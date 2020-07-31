MAKRDOWN_FILES += README.md
PANDOC = pandoc
PANDOC_OPT = -s --toc-depth=4 --toc -c epub.css title.txt $(MAKRDOWN_FILES)
NAME = clojure-from-the-ground-up

all: $(NAME).epub $(NAME).html

$(NAME).epub: $(MAKRDOWN_FILES) epub.css title.txt
	$(PANDOC) $(PANDOC_OPT) -o $(NAME).epub

$(NAME).html: $(MAKRDOWN_FILES) epub.css
	$(PANDOC) $(PANDOC_OPT) -o $(NAME).html

release: $(NAME).epub $(NAME).html
	zip $(NAME).zip $(NAME).epub $(NAME).html

clean:
	rm -f $(NAME).html $(NAME).epub $(NAME).zip

.PHONY: clean
