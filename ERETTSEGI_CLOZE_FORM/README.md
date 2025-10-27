# Use of English Practice (Open Cloze + Word Formation)

This is a self-contained web app for practicing Use of English tasks. It runs entirely in the browser (no backend), so it's perfect for GitHub Pages.

## Files
- `index.html` — the app (tabs for **Open Cloze** and **Word Formation**).
- `open_cloze_database_sample.json` — sample Open Cloze database (replace with your own `open_cloze_database.json` when ready).
- `word_formation_all.json` — full Word Formation database.

## Quick Start (GitHub Pages)
1. Create a new repo on GitHub (e.g. `use-of-english`).
2. Upload **all three files**: `index.html`, `open_cloze_database_sample.json`, `word_formation_all.json` (and this `README.md` if you like).
3. Go to **Settings → Pages** and set:
   - **Source**: `Deploy from a branch`
   - **Branch**: `main` (or `master`) and folder `/ (root)`
4. Save. GitHub will publish the site in ~30–60 seconds at:
   `https://<your-username>.github.io/<your-repo>/`

## How the app finds the databases
- **Open Cloze**: the app tries (in this order)
  1. `?db=<URL>` query parameter
  2. `open_cloze_database.json` (if present in repo)
  3. `open_cloze_database_sample.json` (included here)
  4. built-in 4-item starter set
- **Word Formation**: the app tries
  1. `?wfdb=<URL>` query parameter
  2. `word_formation_database.json` (if present in repo)
  3. `word_formation_all.json` (included here)
  4. built-in 2-item starter set

> Tip: Keep your JSON files in the same repo and load them with relative paths for best CORS behavior.

## Updating content
- Replace `open_cloze_database_sample.json` with your full `open_cloze_database.json` (same schema: `[{ "sentence": "...", "solution": "..." }, ...]`).
- Keep `word_formation_all.json` as is or replace with `word_formation_database.json` if you want a different set.
- Students will automatically get the latest version on refresh.

## Optional: Direct linking to different DBs
Use URL parameters:
- `?db=https://your.domain/path/open_cloze.json`
- `&wfdb=https://your.domain/path/word_formation.json`

## Local test
Just open `index.html` in a browser, or use a static server:
```bash
python -m http.server 8000
# then browse to http://localhost:8000/
```

## License
Educational use.
