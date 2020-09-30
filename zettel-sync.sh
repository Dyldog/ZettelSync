#!/bin/bash

echo "Updating repo..."
pushd ~/Bear
git pull
popd

echo "Syncing from Bear..."
python3 Bear-Markdown-Export/bear_export_sync.py --out ~/Bear/notes --backup ~/Bear/backup

echo "Creating summaries..."
notes-monthly-summariser/.build/release/DailyNoteSummaries

echo "Running janitor..."
node note-link-janitor/dist/index.js ~/Bear/notes

echo "Syncing to Bear..."
python3 Bear-Markdown-Export/bear_export_sync.py --out ~/Bear/notes --backup ~/Bear/backup

echo "Pushing back to bear..."
pushd ~/Bear
git add .
git commit -m "Sync"
git push
popd