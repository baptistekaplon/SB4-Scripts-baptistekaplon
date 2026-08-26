# scripts-infra

Script de purge de logs de plus de N jours

## Contenu

| Script | Rôle |
|---|---|
| `bash/purge-logs.sh` | Liste les fichiers de log de plus de N jours |

## Utilisation

```bash
./bash/purge-logs.sh /tmp/faux-logs 30
```

## Prérequis

- Bash, testé sur Debian 13
- Droits de lecture sur les dossiers analysés
