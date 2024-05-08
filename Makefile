MAKRDOWN_FILES += README.md
COVER_IMAGE = bg.jpg
PANDOC = pandoc
PANDOC_OPT += -s --toc-depth=4 --toc
PANDOC_OPT += --epub-cover-image=$(COVER_IMAGE) title.txt $(MAKRDOWN_FILES)
NAME = Kyle_Kingsbury_Clojure_From_The_Ground_Up

all: $(NAME).epub $(NAME).html

$(NAME).epub: $(MAKRDOWN_FILES) title.txt
	$(PANDOC) $(PANDOC_OPT) -o $(NAME).epub

$(NAME).html: $(MAKRDOWN_FILES)
	$(PANDOC) $(PANDOC_OPT) -o $(NAME).html

release: $(NAME).epub $(NAME).html
	zip $(NAME).zip $(NAME).epub $(NAME).html

clean:
	rm -f $(NAME).html $(NAME).epub $(NAME).zip

.PHONY: clean
