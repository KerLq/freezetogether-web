# Dependencies
  * Rubocop
  * Brakeman
  * Erblint

# Workflow

Das Einbauen/Beheben von Features/Bugs oder sonstiges:
  * Issue erstellen mit ggf. Beschreibung
  * Branch basierend auf das Issue erstellen
  * Commits sollten am Besten kurz sein

Nach fertigem Branch:
  * Alle CI's (Git Actions) beheben
  * Dafür zuständig sind folgende Commands:
    `rubocop -A`
    `brakeman`
    `erblint --lint-all -a`
  * Audit und Brakeman Schwachstellen sind unter Actions zu finden
  * Sobald alles grün ist, mergen! (Am besten uns gegenseitig Bescheid geben, damit wir sehen was alles gemacht wurde) 
