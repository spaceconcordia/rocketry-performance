FILES=abbreviations.md \
	  Performance_Model_Spec.md \
	  dynamic_parameters.md \
	  drag_model.md \
	  data_model.md \
	  matlab_conventions.md \
	  references.md \

PANDOC_TEMPLATE_NAME=scrd-template.tex
PANDOC_TEMPLATE_PATH=template/
PANDOC_TEMPLATE_FILE=template/$(PANDOC_TEMPLATE_NAME)

TITLEPAGE=$(PANDOC_TEMPLATE_PATH)/titlepage.tex
BIBLIOGRAPHY=--biblatex --bibliography
TOC= --toc
LOF= -V lof=lof
#LOT= -V lot=lot
BEFORE_BODY= $(TITLEPAGE)

PANDOC_CMD = pandoc -s $(TOC) $(LOF) $(LOT) $(BIBLIOGRAPHY) --template="$(PANDOC_TEMPLATE_FILE)" --include-before-body="$(BEFORE_BODY)" -o 

report: 
	$(PANDOC_CMD) PERFORMANCE_MODEL.pdf $(FILES)

