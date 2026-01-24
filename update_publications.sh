#!/bin/bash
# Script pour mettre à jour automatiquement les publications depuis HAL

AUTHOR_NAME="Laurent Debreu"
OUTPUT_FILE="_bibliography/debreu_references.bib"
TEMP_FILE="${OUTPUT_FILE}.tmp"

echo "📚 Récupération des publications depuis HAL..."

ENCODED_NAME=$(echo "${AUTHOR_NAME}" | sed 's/ /%20/g')

# Récupérer les BibTeX de base
curl -s "https://api.archives-ouvertes.fr/search/?q=authFullName_t:${ENCODED_NAME}&wt=bibtex&sort=producedDate_tdate+desc&rows=1000" > "${TEMP_FILE}"

NUM_ENTRIES=$(grep -c "^@" ${TEMP_FILE})

if [ ${NUM_ENTRIES} -eq 0 ]; then
    echo "❌ Aucune publication trouvée"
    rm -f "${TEMP_FILE}"
    exit 1
fi

echo "📥 ${NUM_ENTRIES} publications trouvées, récupération des abstracts..."

# Récupérer les HAL IDs et abstracts
python3 << 'PYTHON_SCRIPT'
import re
import requests
import time

# Lire le fichier BibTeX
with open('_bibliography/debreu_references.bib.tmp', 'r', encoding='utf-8') as f:
    content = f.read()

# Extraire les HAL_ID
hal_ids = re.findall(r'HAL_ID = \{([^}]+)\}', content)

print(f"🔍 Récupération de {len(hal_ids)} abstracts...")

# Récupérer les abstracts depuis l'API HAL
abstracts = {}
for i, hal_id in enumerate(hal_ids, 1):
    try:
        url = f"https://api.archives-ouvertes.fr/search/?q=halId_s:{hal_id}&fl=abstract_s&wt=json"
        response = requests.get(url, timeout=10)
        data = response.json()
        
        if data['response']['docs'] and 'abstract_s' in data['response']['docs'][0]:
            abstract = data['response']['docs'][0]['abstract_s'][0]
            # Nettoyer l'abstract
            abstract = abstract.replace('\n', ' ').replace('{', '').replace('}', '')
            abstracts[hal_id] = abstract
            
        if i % 10 == 0:
            print(f"  {i}/{len(hal_ids)} traités...")
        time.sleep(0.1)  # Pause pour ne pas surcharger l'API
    except Exception as e:
        print(f"  ⚠️  Erreur pour {hal_id}: {e}")
        continue

print(f"✅ {len(abstracts)} abstracts récupérés")

# Insérer les abstracts dans le BibTeX
for hal_id, abstract in abstracts.items():
    # Échapper les caractères spéciaux pour regex
    abstract_escaped = abstract.replace('\\', '\\\\').replace('$', '\\$')
    pattern = f'(HAL_ID = {{{hal_id}}})'
    replacement = f'ABSTRACT = {{{abstract_escaped}}},\n  \\1'
    content = re.sub(pattern, replacement, content)

# Écrire le fichier final
with open('_bibliography/debreu_references.bib', 'w', encoding='utf-8') as f:
    f.write(content)

print("💾 Fichier sauvegardé")
PYTHON_SCRIPT

# Nettoyer le fichier temporaire
rm -f "${TEMP_FILE}"

echo "✅ Publications mises à jour avec abstracts"

read -p "🔄 Relancer Jekyll ? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    pkill -f jekyll && sleep 1 && jekyll serve --host 0.0.0.0 &
    echo "🚀 Jekyll relancé"
fi
