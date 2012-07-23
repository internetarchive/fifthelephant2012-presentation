presentation.html: presentation.cfg ia.md arch.md Makefile
	landslide -c presentation.cfg

clean:
	rm presentation.html

pdf: presentation.html
	prince -s css/pdf.css presentation.html -o fifthelephant-ia.pdf

