# Pandoc Template

A template is needed to create PDFs of the documentation markdown files using the project header and footer

## Pandoc

## Markdown

## Template Creation

To create a custom Pandoc template, enter the following on the command-line to populate a new file with the default template latex markup

```
pandoc -D latex > template.tex
```

Make any changes as desired and move or link to your Pandoc templates folder:
```
$PANDOC_DIR/templates
```

e.g.
```
C:/Users/username/AppData/Roaming/Pandoc/templates
```

## Rendering

To build your .md file with your custom template:

## TODO
- symbolically link the template file to templates/
- make alias in Vim

## References

- http://pandoc.org/demo/example9/templates.html
- http://los-pajaros-de-hogano.blogspot.ca/2015/01/pandoc-customized-latex-templates-for.html
- http://texblog.org/2007/11/07/headerfooter-in-latex-with-fancyhdr/
