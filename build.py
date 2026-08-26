#!/usr/bin/env python3
import pathlib

root = pathlib.Path(__file__).parent
js = (root / "elm.js").read_text()
template = (root / "src" / "template.html").read_text()
html = template.replace("<!-- ELM_SCRIPT -->", "<script>\n" + js + "\n</script>")
(root / "index.html").write_text(html)
(root / "elm.js").unlink()
print("index.html built")
