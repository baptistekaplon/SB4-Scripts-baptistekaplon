# scripts-infra

purge-logs.sh : Script de purge de logs de plus de N jours  
generer-faux-logs.sh : Script de création de faux logs dans un dossier /tmp/faux-logs

## Contenu

| Script | Rôle |
|---|---|
| `scripts-infra/purge-logs.sh` | Liste les fichiers de log de plus de N jours |
| `scripts-infra/generer-faux-logs.sh` | Créé un dossier /tmp/faux-logs et 7 fichier logs plus ou moins vieux |

## Utilisation

```bash
./bash/purge-logs.sh /tmp/faux-logs 30
```

```bash
./generer-faux-logs.sh
```

## Prérequis

- Bash, testé sur Debian 13
- Droits de lecture sur les dossiers analysés
