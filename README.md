# Site Jekyll - Laurent Debreu

Site personnel hébergé sur GitHub Pages : https://laurentdebreu.github.io

## Déploiement automatique avec GitHub Actions

Le site utilise **GitHub Actions** pour compiler automatiquement Jekyll avec le plugin jekyll-scholar (non supporté nativement par GitHub Pages).

À chaque `git push`, GitHub compile le site et le déploie automatiquement.

### Configuration GitHub Pages (à faire une seule fois)

1. Allez sur https://github.com/LaurentDebreu/LaurentDebreu.github.io/settings/pages
2. Dans **"Build and deployment"** > **"Source"** : sélectionnez `GitHub Actions`
3. Sauvegardez

## Workflow quotidien

### 1. Modifier le site localement
```bash
jekyll serve --host 0.0.0.0
```
Le site sera accessible sur http://localhost:4000 pour prévisualiser vos changements.

### 2. Arrêter le serveur
```bash
pkill -f jekyll
```

### 3. Mettre à jour les publications depuis HAL
```bash
./update_publications.sh
```

### 4. Publier les modifications
```bash
git add -A
git commit -m "Description des modifications"
git push
```
GitHub Actions compile et déploie automatiquement (2-3 minutes).

## Configuration technique
- Jekyll 4.4.1 + jekyll-scholar 7.1.3
- Ruby 3.2.x
- Déploiement via `.github/workflows/jekyll.yml`
