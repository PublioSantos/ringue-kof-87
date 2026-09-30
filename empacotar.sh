#!/usr/bin/env bash
# Gera web/ (build Kof) e ringue-kof-87.html (arquivo unico, abre offline via file://)
set -euo pipefail
cd "$(dirname "$0")"
rm -rf web
kof build ringue.kf --target js --output web
sed -i 's#<title>Default — Kof</title>#<title>Ringue KOF 87</title>#; s#<span class="name">Default</span>#<span class="name">Ringue KOF 87</span>#; s#<span class="kind">Kof output</span>#<span class="kind">Powered by Kof · github.com/KofLang</span>#' web/index.html
npx --yes esbuild@0.24 web/Default.mjs --bundle --format=iife --minify-syntax --log-level=warning --outfile=web/.bundle.js
python3 - <<'PY'
s = open('web/index.html').read()
js = open('web/.bundle.js').read().replace('</script', '<\\/script')
tag = '<script type="module" src="Default.mjs"></script>'
open('ringue-kof-87.html', 'w').write(s.replace(tag, '<script>\n' + js + '\n</script>'))
PY
rm -f web/.bundle.js web/*.map
echo "ok: web/ e ringue-kof-87.html"
