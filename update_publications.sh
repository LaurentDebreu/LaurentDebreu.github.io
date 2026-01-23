#!/bin/bash
# Script pour mettre à jour automatiquement les publications depuis HAL

# Votre nom complet (à adapter si besoin)
AUTHOR_NAME="Laurent Debreu"

# Fichier de sortie
OUTPUT_FILE="_bibliography/debreu_references.bib"

echo "📚 Récupération des publications depuis HAL..."

# Télécharge toutes vos publications en BibTeX via l'API HAL
ENCODED_NAME=$(echo "${AUTHOR_NAME}" | sed 's/ /%20/g')
curl -s "https://api.archives-ouvertes.fr/search/?q=authFullName_t:${ENCODED_NAME}&wt=bibtex&sort=producedDate_tdate+desc&rows=1000" > "${OUTPUT_FILE}"

# Compte le nombre de publications
NUM_ENTRIES=$(grep -c "^@" ${OUTPUT_FILE})

if [ ${NUM_ENTRIES} -gt 0 ]; then
    echo "✅ Publications mises à jour avec succès dans ${OUTPUT_FILE}"
    echo "📊 Nombre d'entrées : ${NUM_ENTRIES}"
else
    echo "❌ Aucune publication trouvée - vérifiez le nom d'auteur"
    exit 1
fi

# Optionnel : relancer Jekyll pour voir les changements
read -p "🔄 Voulez-vous relancer Jekyll ? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    pkill -f jekyll
    sleep 1
    jekyll serve --host 0.0.0.0 &
    echo "🚀 Jekyll relancé"
fi
