SOURCE=resume_cv

# define pdf viewer
ifeq ($(shell uname), Darwin)
	VIEWER=open
else
	VIEWER=xreader
endif

# define placeholder environment variables
ifndef CVPHONE
	export CVPHONE=(+XX) XXXXXXXXXX
endif

ifndef CVADDRESS
	export CVADDRESS=Example Street 1, Test Town, Earth
endif

ifndef CVEMAIL
	export CVEMAIL=john.doe@example.com
endif

ifndef CVHOMEPAGE
	export CVHOMEPAGE=www.example.com
endif

.PHONY: default clean view

default: clean $(SOURCE).pdf

$(SOURCE).pdf: $(SOURCE).tex
	xelatex $<

clean:
	find . -type f -not -name "$(SOURCE).tex" -name "$(SOURCE).*" -delete -print

view: $(SOURCE).pdf
	$(VIEWER) $(VIEWER_OPTIONS) $< &

