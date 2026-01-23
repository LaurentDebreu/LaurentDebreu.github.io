#!/bin/bash
# Script pour mettre à jour automatiquement les publications depuis HAL

AUTHOR_NAME="Laurent Debreu"
OUTPUT_FILE="_bibliography/debreu_references.bib"

echo "📚 Récupération des publications depuis HAL..."

ENCODED_NAME=$(echo "${AUTHOR_NAME}" | sed 's/ /%20/g')
curl -s "https://api.archives-ouvertes.fr/search/?q=authFullName_t:${ENCODED_NAME}&wt=bibtex&sort=producedDate_tdate+desc&rows=1000" > "${OUTPUT_FILE}"

NUM_ENTRIES=$(grep -c "^@" ${OUTPUT_FILE})

if [ ${NUM_ENTRIES} -gt 0 ]; then
    echo "✅ Publications mises à jour : ${NUM_ENTRIES} entrées"
else
    echo "❌ Aucune publication trouvée"
    exit 1
fi

read -p "🔄 Relancer Jekyll ? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    pkill -f jekyll && sleep 1 && jekyll serve --host 0.0.0.0 &
    echo "🚀 Jekyll relancé"
fi
