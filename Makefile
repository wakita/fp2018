# GNU Makefile

.SUFFIXES: .html .md .pdf
.DEFAULT: html
all: html

SLIDES   := $(basename $(notdir $(wildcard slide/*-*.md)))
STML     := $(addprefix docs/slide/, $(addsuffix .html, $(SLIDES)))
#PDF      := $(addprefix pdf/,        $(addsuffix .pdf,  $(SLIDES)))

PAGE     := $(basename $(notdir $(wildcard page/*.md)))
PTML     := $(addprefix docs/page/, $(addsuffix .html, $(PAGE)))

QUIZ     := $(basename $(notdir $(wildcard quiz/*.md)))
QTML     := $(addprefix docs/quiz/, $(addsuffix .html, $(QUIZ)))

clean:
	rm -f $(STML) $(PTML) $(PDF)

# Markdown -> HTML is achieved in two-stages.
html: $(STML) $(PTML) $(QTML)

docs/page/%.html: page/%.md
	@echo "pandoc: $^ => $@"
	@/usr/local/bin/pandoc lib/page-header.md $^ lib/page-footer.md \
	  --from markdown+smart \
	  --to html+smart \
	  --standalone \
	  --output $@ \
          --css=/fp2018/lib/reveal.js/css/theme/solarized.css \
	  --css=/fp2018/lib/kw.css \
	  --css=/fp2018/lib/kw-page.css \
	  --mathjax

docs/quiz/%.html: quiz/%.md
	@echo "pandoc: $^ => $@"
	@/usr/local/bin/pandoc $^ \
	  --from markdown+smart \
	  --to html+smart \
	  --standalone \
	  --output $@ \
	  --css=/fp2018/lib/kw.css \
	  --css=/fp2018/lib/kw-quiz.css \
	  --mathjax

STML_DEV = docs/dev/kw.js docs/dev/phantom.js lib/slide.yaml

docs/slide/%.html: $(STML_DEV) slide/%.md
	$(eval slide := $(basename $(notdir $@)))
	$(eval md    := $(addprefix slide/,     $(addsuffix .md,   $(slide))))
	$(eval html1 := $(addprefix docs/tmp/,  $(addsuffix .html, $(slide))))
	$(eval html2 := $(addprefix docs/slide/, $(addsuffix .html, $(slide))))

	@# Firstly, Pandoc generates a temporary HTML file:
	@# slide/*.md -> tmp/*.html
	@echo "pandoc:    $(md) => $(html1)"
	@/usr/local/bin/pandoc lib/slide.yaml lib/slide-header.md $(md) lib/slide-footer.md\
	  --from markdown+smart+fenced_code_attributes \
	  --to revealjs+smart --slide-level=2 \
	  --template lib/default.revealjs \
	  --standalone \
	  --output=$(html1) \
 	  -V revealjs-url=/fp2018/lib/reveal.js \
 	  -V theme=solarized \
	  -V slideNumber=true \
	  -V width=1280 -V height=1024 \
	  --css=/fp2018/lib/kw.css \
	  --mathjax

	@# Then, PhantomJS is used to patch the temporary HTML and finishes it.
	@echo "phantomjs: $(html1) => $(html2)"
	@phantomjs docs/dev/phantom.js $(slide) $(html2)
	@echo

docs/assignment/%.html: assignment/%.md
	@echo "pandoc: $^ => $@"
	@/usr/local/bin/pandoc lib/page-header.md $^ lib/page-footer.md \
	  --from markdown+smart \
	  --to html+smart \
	  --standalone \
	  --output $@ \
          --css=/fp2018/lib/reveal.js/css/theme/solarized.css \
	  --css=/fp2018/lib/kw.css \
	  --css=/fp2018/lib/kw-page.css \
	  --mathjax

#pdf: $(PDF)

#pdf/%.pdf: docs/%.html
#	$(eval slide := $(basename $(notdir $@)))
#	$(eval pdf := $(addprefix pdf/, $(addsuffix .pdf, $(slide))))
#	$(eval url := $(addprefix http://localhost:8080/, $(addsuffix .html, $(slide))))
#	decktape $(url) $(pdf)
