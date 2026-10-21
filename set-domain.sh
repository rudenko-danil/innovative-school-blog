#!/usr/bin/env bash
# Меняет адрес блога во всех canonical, разметке, sitemap, robots.txt и llms.txt.
# Запускать после подключения поддомена в Netlify:
#   ./set-domain.sh blog.is.school
set -euo pipefail
NEW="${1:?Укажите домен, например: ./set-domain.sh blog.is.school}"
OLD="blog-innovative-school.netlify.app"
grep -rl --include='*.html' --include='*.xml' --include='*.txt' "$OLD" . \
  | xargs sed -i.bak "s#${OLD}#${NEW}#g"
find . -name '*.bak' -delete
echo "Готово: ${OLD} → ${NEW}"
