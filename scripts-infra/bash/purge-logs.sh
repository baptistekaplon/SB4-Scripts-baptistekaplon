#!/bin/bash
# ------------------------------------------------------------
# purge-logs.sh
# Objet    : supprime les fichiers de log de plus de N jours dans un dossier
# Auteur   : baptiste.kaplon@gmail
# Usage    : ./purge-logs.sh <dossier> [jours]
# Prérequis: droit d'écriture sur le dossier cible, testé sur Debian 13
# Retour   : 0 = OK / 1 = usage incorrect / 2 = dossier introuvable
#            3 = droits insuffisants
# ------------------------------------------------------------

FICHIER_LOG="/tmp/purge-logs.log"

if [ "$#" -lt 1 ]; then
    echo "Usage : $0 <dossier> [jours]" >&2
    echo "Exemple : $0 /tmp/faux-logs 30" >&2
    exit 1
fi

DOSSIER="$1"
JOURS="${2:-30}"

# Le nombre de jours doit être un entier positif.
# Si ce n'est pas le cas, la comparaison numérique échoue : on jette son
# message d'erreur et on affiche le nôtre, qui est lisible.
if ! [ "$JOURS" -ge 0 ] 2>/dev/null; then
    echo "Erreur : '$JOURS' n'est pas un nombre de jours valide" >&2
    echo "Usage : $0 <dossier> [jours]" >&2
    exit 1
fi

echo "Purge de $DOSSIER, fichiers de plus de $JOURS jours"

if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier $DOSSIER est introuvable" >&2
    exit 2
fi

NB=$(find "$DOSSIER" -type f -name "*.log" -mtime +"$JOURS" | wc -l)

if [ "$NB" -eq 0 ]; then
    echo "Aucun fichier de plus de $JOURS jours dans $DOSSIER, rien à faire"
else
    echo "$NB fichier(s) à supprimer :"
    find "$DOSSIER" -type f -name "*.log" -mtime +"$JOURS" -print
    find "$DOSSIER" -type f -name "*.log" -mtime +"$JOURS" -delete
fi
