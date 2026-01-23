# Site Jekyll - Laurent Debreu

Site personnel hébergé sur GitHub Pages : https://laurentdebreu.github.io

## Configuration

- **Jekyll** : 4.4.1
- **Thème** : Minima 2.5.2
- **Plugins** :
  - jekyll-scholar 7.1.3 (pour les publications académiques)
  - jekyll-feed 0.17.0
- **Ruby** : 3.2.x

## Commandes essentielles

### Lancer le site en local

```bash
jekyll serve --host 0.0.0.0
```

Le site sera accessible sur http://localhost:4000

### Arrêter le serveur Jekyll

```bash
pkill -f jekyll
```

### Mettre à jour les publications depuis HAL

```bash
./update_publications.sh
```

Ce script récupère automatiquement toutes vos publications depuis HAL Open Archive et met à jour le fichier `_bibliography/debreu_references.bib`.

## Structure du site

```
├── _config.yml              # Configuration Jekyll
├── index.md                 # Page d'accueil
├── w0_research.md          # Page Recherche
├── w1_projects.md          # Page Projets
├── w2_publications.md      # Page Publications
├── _bibliography/
│   └── debreu_references.bib    # Références bibliographiques (BibTeX)
├── _layouts/               # Templates HTML
│   ├── default.html
│   ├── bibliography.html
│   └── bib.html           # Template pour chaque publication
├── _sass/                 # Styles CSS
└── assets/                # Images et fichiers statiques
```

## Publications

Les publications sont gérées automatiquement via **jekyll-scholar** :
- Source : fichier BibTeX `_bibliography/debreu_references.bib`
- La page `w2_publications.md` utilise le tag `{% bibliography %}` pour générer automatiquement la liste
- Le style de citation est défini dans `_config.yml` (fichier CSL)

### Ajouter/modifier des publications

**Option 1 - Automatique (recommandé)** :
```bash
./update_publications.sh
```

**Option 2 - Manuel** :
Éditez directement `_bibliography/debreu_references.bib` avec vos entrées BibTeX.

## Déploiement sur GitHub Pages

Les modifications pushées sur la branche `main` sont automatiquement publiées par GitHub Pages.

```bash
git add .
git commit -m "Mise à jour du site"
git push origin main
```

## Dépannage

### Réinstaller les dépendances

Si vous rencontrez des problèmes de gems :

```bash
sudo gem install jekyll -v 4.4.1
sudo gem install jekyll-scholar -v 7.1.3
sudo gem install jekyll-feed minima
sudo gem install liquid -v 4.0.4
sudo gem install citeproc-ruby -v 1.1.14
```

### Nettoyer le cache

```bash
rm -rf _site .jekyll-cache
```

## Notes

- Le Gemfile existe mais on utilise les gems installées globalement pour éviter les problèmes de compilation native sur WSL
- Jekyll se recharge automatiquement quand vous modifiez des fichiers
- Les avertissements Sass sur les fonctions deprecated sont normaux et n'empêchent pas le fonctionnement
