SOURCE=resume_cv

# define pdf viewer
ifeq ($(shell uname), Darwin)
	VIEWER=open
else
	VIEWER=xreader
endif

# define placeholder environment variables
ifndef CVPHONE
	export CVPHONE=Upon Request
endif

ifndef CVADDRESS
	export CVADDRESS=Vienna, Austria
endif

.PHONY: default clean view

default: clean $(SOURCE).pdf

$(SOURCE).pdf: $(SOURCE).tex
	xelatex $<

clean:
	find . -type f -not -name "$(SOURCE).tex" -name "$(SOURCE).*" -delete -print

view: $(SOURCE).pdf
	$(VIEWER) $(VIEWER_OPTIONS) $< &

