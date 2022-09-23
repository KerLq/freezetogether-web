# Dependencies
  * Rubocop
  * Brakeman
  * Erblint

# Workflow

Feature/Bug oder sonstiges:
  * Issue erstellen mit ggf. Beschreibung
  * Branch basierend auf das Issue erstellen
  * Commits sollten am Besten kurz sein

Nach fertigem Branch:
  * Alle CI's (Git Actions) beheben
  * Dafür zuständig sind folgende Commands:
    `rubocop -A`
    `brakeman`
    `erblint --lint-all -a`
  * Sobald alles grün, mergen!
