# Site Jekyll - Laurent Debreu

Site personnel hébergé sur GitHub Pages : https://laurentdebreu.github.io

## Commandes essentielles

### Lancer le site en local
```bash
jekyll serve --host 0.0.0.0
```
Le site sera accessible sur http://localhost:4000

### Arrêter le serveur
```bash
pkill -f jekyll
```

### Mettre à jour les publications depuis HAL
```bash
./update_publications.sh
```

## Configuration
- Jekyll 4.4.1 + jekyll-scholar 7.1.3
- Ruby 3.2.x
