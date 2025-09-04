SOURCE=resume_cv

# define pdf viewer
ifeq ($(shell uname), Darwin)
	VIEWER=open
else
	VIEWER=okular
endif

# define placeholder environment variables
ifndef CVPHONE
	export CVPHONE=Auf Anfrage
endif

ifndef CVADDRESS
	export CVADDRESS=Wien, Österreich
endif

.PHONY: default clean view

default: clean $(SOURCE).pdf

$(SOURCE).pdf: $(SOURCE).tex
	xelatex $<
	xelatex $<

clean:
	find . -type f -not -name "$(SOURCE).tex" -name "$(SOURCE).*" -delete -print

view: $(SOURCE).pdf
	$(VIEWER) $(VIEWER_OPTIONS) $< &

