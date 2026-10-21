# apps-docs

Pagine di supporto e privacy policy di tutte le app di Opem Gestionali di Mazzuferi Sara, pubblicate con
GitHub Pages su https://notmikenot.github.io/apps-docs/ (repo pubblico `notmikenot/apps-docs`, branch `main`,
cartella radice). I repo del codice delle app restano privati e non contengono queste pagine.

## Struttura

```
style.css            stile condiviso (chiaro e scuro)
index.html           elenco delle app
<app>/               una cartella per app: nome = ultima parte del bundle ID (com.opemgestionali.ipdf → ipdf)
  index.html         supporto in italiano     → URL di supporto (italiano) in App Store Connect
  en.html            supporto in inglese      → URL di supporto (inglese)
  privacy.html       privacy policy italiana  → URL della privacy policy (italiano)
  privacy-en.html    privacy policy inglese   → URL della privacy policy (inglese)
  icon.png           icona dell'app (copia dell'AppIcon, 1024×1024 va bene)
```

Le pagine usano `../style.css`. Titolare: Opem Gestionali di Mazzuferi Sara, email `info@opemgestionali.com`,
nessun indirizzo. Nessun segnaposto (TODO, XXX).

## Comandi

| Comando | Cosa fa |
|---|---|
| `make check` | Controlla pagine, icona, stile, segnaposto ed elenco in `index.html` |
| `make publish` | `check` e poi push su GitHub (SSH come `notmikenot`): Pages si aggiorna in 1–2 minuti |
| `make verify` | Controlla con `curl` che tutte le pagine pubblicate rispondano 200 |

## Nuova app

1. Copia una cartella esistente (es. `ipdf/`) con il nome della nuova app e riscrivi i testi.
2. Aggiungi l'app in `index.html`.
3. `make check`, commit, `make publish`, `make verify`.
4. Inserisci i quattro URL in App Store Connect e in `AppStore/metadata/<lingua>/support_url.txt` e
   `privacy_url.txt` del progetto dell'app.

## App

| App | Pagine |
|---|---|
| iPDF | https://notmikenot.github.io/apps-docs/ipdf/ |
| Rinnovi | https://notmikenot.github.io/apps-docs/rinnovi/ |
