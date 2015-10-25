# Documentation Conventions

## Markdown 
Markdown is a markup language that is meant to be easy to read and easy to write, as well as easy to convert to HTML, LaTeX, PDF, and other output types.

## Python
Python is used to enable additional filters which handle features currently not supported out-of-the-box by Pandoc

[Download Python for Windows here](https://www.python.org/downloads/windows/)

## Pandoc

Pandoc is a document converter that in our case is useful in converting the Markdown (.md) files into PDF and HTML

[The User Guide is very helpful](http://pandoc.org/README.html) 


## Haskell

Haskell is useful in this environment to do some custom scripting

## LaTeX

LaTeX is a powerful typesetting language useful for academic writing. It's mathematical expressions are particularly useful for this report.

## Citations

[Excellent citation discussion](http://www.chriskrycho.com/2015/academic-markdown-and-citations.html)

[Haskell and Bibtex in Pandoc](http://blog.wuzzeb.org/posts/2012-06-15-bibtex-and-pandoc.html)

[IEEE CSL File](https://gist.github.com/marcelofernandez/3264858)

## Equations

Wrap functions as follows to enable automatic numbering:
```
\begin{equation}
f(x) = s \cdot e^{xy}
\end{equation}
```

[pandoc-eqnos](https://github.com/tomduck/pandoc-eqnos) 

[StackOverflow - LaTeX equations in Markdown+Pandoc](http://stackoverflow.com/questions/25042901/how-to-use-latex-equation-environment-in-pandoc-markdown)

## Figures

To automatically number figures, use the following syntax to insert an image:
```
[rocket_drag_model_overview]: images/rocket_drag_model_overview.png "Rocket Drag Model Overview" 
![Rocket Drag Model Overview \label{rocket_drag_model_overview_label}][rocket_drag_model_overview] 
```
Then, in your pandoc command, add the lof variable:
```
pandoc -s ... -V lof=lof
```

## Tables

To automatically number tables and add captions, add the *capt-of* package to your preamble
```
\usepackage{capt-of}
```

Then, in your pandoc command, add the lot variable:
```
pandoc -s ... -V lot=lot
```
