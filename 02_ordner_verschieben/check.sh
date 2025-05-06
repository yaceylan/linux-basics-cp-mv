#!/bin/bash

echo "🔍 Überprüfe Dateistruktur..."

case "02_ordner_verschieben" in
  "01_datei_verschieben")
    ok_file="[ -f ziel/bericht.txt ] && [ ! -f quelle/bericht.txt ]"
    ;;
  "02_ordner_verschieben")
    ok_file="[ -d backup/daten ] && [ ! -d daten ]"
    ;;
  "03_inhalt_kopieren_mit_hidden")
    ok_file="[ -f ziel/sichtbar.txt ] && [ -f ziel/.geheim ]"
    ;;
  "04_ordner_umbenennen")
    ok_file="[ -d frontend ] && [ ! -d frontend-temp ]"
    ;;
  "05_kopieren_ohne_hidden")
    ok_file="[ -f ziel/datei.txt ] && [ ! -f ziel/.secret ]"
    ;;
esac

if eval "$ok_file"; then
  echo "✅ Dateisystem korrekt verändert."

  echo "🔍 Prüfe Bash-History (~/.bash_history)..."
  if grep -qE 'mv +.*daten +.*backup' ~/.bash_history; then
    echo "✅ passender Befehl in der Bash-History gefunden."
  else
    echo "⚠️ Kein passender Befehl in der Bash-History gefunden."
    echo "❗️ Bitte verwende mv oder cp in der Shell – nicht per Maus!"
  fi
else
  echo "❌ Aufgabe nicht korrekt gelöst (Dateien oder Ordner stimmen nicht)."
fi
