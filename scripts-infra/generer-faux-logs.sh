#!/bin/bash
# ------------------------------------------------------------
# generer-faux-logs.sh
# Objet    : créé un dossier /tmp/faux-logs puis créé de faux fichiers logs avec différentes cr�eation date dans ce dossier
# Auteur   : baptiste.kaplon@gmail.com
# Usage    : ./generer-faux-logs.sh
# Prérequis: lecture sur le dossier cible, testé sur Debian 13
# ------------------------------------------------------------

mkdir -p /tmp/faux-logs
cd /tmp/faux-logs

touch -d "60 days ago" tres-vieux.log
touch -d "40 days ago" vieux1.log
touch -d "40 days ago" vieux2.log
touch -d "40 days ago" "rapport de mars.log"
touch -d "10 days ago" moyen.log
touch -d "2 days ago"  recent.log
touch -d "40 days ago" archive-fevrier.gz
