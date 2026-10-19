# Uso: make check | make publish | make verify
BASE := https://notmikenot.github.io/apps-docs
PAGES := index.html en.html privacy.html privacy-en.html

.PHONY: check publish verify

# Ogni app ha le quattro pagine e l'icona, lo stile condiviso e nessun segnaposto.
check:
	@status=0; for app in $$(find . -mindepth 2 -maxdepth 2 -name index.html -exec dirname {} \; | sed 's|^\./||' | sort); do \
		for f in $(PAGES) icon.png; do [ -f "$$app/$$f" ] || { echo "MANCA: $$app/$$f"; status=1; }; done; \
		for f in $(PAGES); do \
			grep -q 'href="../style.css"' "$$app/$$f" || { echo "STILE: $$app/$$f non usa ../style.css"; status=1; }; \
			! grep -qiE 'class="todo"|TODO|XXX' "$$app/$$f" || { echo "SEGNAPOSTO: $$app/$$f"; status=1; }; \
		done; \
		grep -q "href=\"$$app/\"" index.html || { echo "ELENCO: $$app manca in index.html"; status=1; }; \
		echo "$$app: ok"; \
	done; exit $$status

# Pubblica su GitHub Pages (branch main, cartella radice).
publish: check
	git push git@github.com:notmikenot/apps-docs.git HEAD:main

# Controlla che le pagine pubblicate rispondano 200.
verify:
	@for app in $$(find . -mindepth 2 -maxdepth 2 -name index.html -exec dirname {} \; | sed 's|^\./||' | sort); do \
		for f in "" en.html privacy.html privacy-en.html; do \
			echo "$$(curl -s -o /dev/null -w '%{http_code}' $(BASE)/$$app/$$f)  $(BASE)/$$app/$$f"; \
		done; \
	done
