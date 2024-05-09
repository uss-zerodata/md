# Get the current OS
ifdef OS
	OS = windows
	RM = del /Q
	FixPath = $(subst /,\,$1)
else
	ifeq ($(shell uname), Linux)
		OS = linux
		RM = rm -f
		FixPath = $1
	endif
endif

# Read FILENAME from environment variable or use default value
# if FILENAME is not set or empty, set it to default value
ifeq ($(strip $(FILENAME)),)
	FILENAME = output
endif
ifeq ($(strip $(MAIN_MD)),)
	MAIN_MD = main.md
endif
ifeq ($(strip $(SLIDES_MD)),)
	SLIDES_MD = slides.md
endif

###############################################
# Main targets
###############################################

all: document slides

setup: requirements
install: requirements

pdf: pandoc-pdf slides-pdf
tex: pandoc-tex
html: slides-html

doc: document
render: document
latex: document

marp: slides
slides: marp-pdf marp-html marp-pptx
present: marp-preview

###############################################
# Document rendering tools
###############################################

pandoc-pdf:
	@echo "Rendering PDF document using pandoc..."
	pandoc -o $(FILENAME).pdf ${MAIN_MD} --template assets/eisvogel.tex --listings --toc --toc-depth 2 --number-sections
	@echo "Done."

pandoc-tex:
	@echo "Rendering TEX document using pandoc..."
	pandoc -o $(FILENAME).tex ${MAIN_MD} --template assets/eisvogel.tex --listings --toc --toc-depth 2 --number-sections
	@echo "Done."

document: clear pandoc-tex
	@echo "Rendering PDF document using latexmk..."
	latexmk $(FILENAME).tex
	@echo "Done."

###############################################
# Slide rendering tools
###############################################

marp-preview:
	@echo "Starting marp preview server..."
	npx @marp-team/marp-cli@latest ${SLIDES_MD} --preview --watch --html
	@echo "Stopping marp preview server..."

marp-pdf:
	@echo "Rendering PDF slides using marp..."
	npx @marp-team/marp-cli@latest ${SLIDES_MD} --pdf -o $(FILENAME)_slides.pdf
	@echo "Done."

marp-html:
	@echo "Rendering HTML slides using marp..."
	npx @marp-team/marp-cli@latest ${SLIDES_MD} --html -o $(FILENAME)_slides.html
	@echo "Done."

marp-pptx:
	@echo "Rendering PPTX slides using marp..
	npx @marp-team/marp-cli@latest ${SLIDES_MD} --pptx -o $(FILENAME)_slides.pptx
	@echo "Done."

###############################################
# Cleaning tools
###############################################

clear: 
	@echo "Cleaning up..."
	@echo "Detected OS: $(OS)"
	$(RM) $(call FixPath, *.aux *.bbl *.bcf *.blg *.dvi *.fdb_latexmk *.fls *.log *.run.xml *.synctex.gz *.toc *.out *.out.ps)
	@echo "Done."

purge: clear
	@echo "Purging..."
	$(RM) $(call FixPath, $(FILENAME).pdf  $(FILENAME).tex $(FILENAME)_slides.pdf $(FILENAME)_slides.html $(FILENAME)_slides.pptx)
	@echo "Done."

###############################################
# Setup tools
###############################################

requirements:
	@echo "Setting up..."
	@echo "Detected OS: $(OS)"
	ifeq ($(OS), windows)
		@echo "Installing pandoc..."
		choco install pandoc
		@echo "Installing MiKTeX..."
		choco install miktex
		@echo "Installing strawberry-perl..."
		choco install strawberryperl
		@echo "Installing Python3..."
		choco install python3
		@echo "Installing npm..."
		choco install nodejs
		@echo "Installing npm packages..."
		npm install
		@echo "Generating textures..."
		cd assets/textures/generate_textures.py
		python3 generate_textures.py
		@echo "Done."
	else
		@echo "Updating package lists..."
		sudo apt update
		@echo "Installing pandoc..."
		sudo apt install pandoc -y
		@echo "Installing texlive-core..."
		sudo apt install texlive-core -y
		@echo "Installing perl..."
		sudo apt install perl -y
		@echo "Installing Python3..."
		sudo apt install python3 -y
		@echo "Installing npm..."
		sudo apt install npm -y
		@echo "Installing npm packages..."
		npm install
		@echo "Generating textures..."
		cd assets/textures/generate_textures.py
		python3 generate_textures.py
		@echo "Done."
	endif

###############################################
# Help
###############################################

help:
	@echo "Markdown PDF Template"
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo " - make all			# Renders the main.md and slides.md files to various formats. (Default)"
	@echo " - make document		# Renders the main.md file to a final PDF document (render)"
	@echo "	 render			# Alias for 'make document'"
	@echo " - make slides			# Renders the slides.md file to a PDF, HTML and PPTX file."
	@echo " - make present		# Starts a marp preview server for the slides.md file."
	@echo ""
	@echo " - make clear			# Deletes all temporary files"
	@echo " - make purge			# Deletes all temporary and output files"
	@echo ""
	@echo " - make setup			# Installs the template and all dependencies"
	@echo " - make help			# Shows this help"
	@echo ""
	@echo "Advanced targets:"
	@echo " - make pandoc-pdf		# Renders the main.md file to a PDF document using pandoc"
	@echo " - make pandoc-tex		# Renders the main.md file to a TEX document using pandoc"
	@echo " - make marp-pdf		# Renders the slides.md file to a PDF file using marp"
	@echo " - make marp-html		# Renders the slides.md file to a HTML file using marp"
	@echo " - make marp-pptx		# Renders the slides.md file to a PPTX file using marp"
	@echo ""
	@echo "Note:	To change the output filename, edit the FILENAME variable in the Makefile or"
	@echo "	add the FILENAME=<filename> parameter to the make command."
	@echo "	Alternatively, you can also define an environment variable called FILENAME."
	@echo "	Example: make document FILENAME=example"
	@echo ""
	@echo "Note:  To generate the full set of slide textures run the generate_textures.py"
	@echo "	script in the assets/textures folder."
	@echo "	Example: cd assets/textures && python3 generate_textures.py"

###############################################
# Debugging tools
###############################################

test:
	@echo "Testing Makefile..."
	@echo "Detected OS: $(OS)"
	@echo "Detected FILENAME: $(FILENAME)"
	@echo "Detected MAIN_MD: $(MAIN_MD)"
	@echo "Detected SLIDES_MD: $(SLIDES_MD)"
	@echo "Done."
