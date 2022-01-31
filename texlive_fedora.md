LaTeX paper writing in Fedora without installing all of texlive:

```
sudo dnf install texlive-amscls texlive-bibtex texlive-cmap texlive-comment texlive-ec texlive-environ texlive-hyperxmp texlive-inconsolata texlive-jknapltx texlive-libertine texlive-makecell texlive-metafont texlive-microtype texlive-multirow texlive-ncctools texlive-newtx texlive-rsfs texlive-stmaryrd texlive-textcase texlive-times texlive-totpages texlive-txfonts texlive-upquote texlive-xetex
```

Command obtained with

```
dnf history userinstalled | grep -e 'texlive' | sed -e 's/-9.*//g' | tr '\n' ' '
```
