#!/bin/sh
set -e

cd /app

echo "==> Installing dependencies..."
npm install

echo "==> Building application..."
npm run build

echo "==> Starting application on port 3000..."
exec node_modules/.bin/next start -p 3000
