ELM=elm

ELM_ENTRY=src/Main.elm
ELM_OUTPUT=elm.js

.PHONY: all site clean

all: site

site:
	$(ELM) make $(ELM_ENTRY) --output=$(ELM_OUTPUT)
	python3 build.py

clean:
	rm -f $(ELM_OUTPUT)
