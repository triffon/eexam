`eexam.cls` е LaTeX клас предназначен за предпечатна подготовка на практическата част на държавния изпит към Факултета по математика и информатика на СУ "Св. Климент Охридски".

Пример за използване на класа е даден във файла `examples/example.tex`. При наличие на инсталиран пакет `Latexmk` примерът може да се компилира с просто изпълняване на командата

``` shell
latexmk
```

За компилация без използване на `Latexmk` е нужно да се подсигури, че `eexam.cls` е в пътя за търсене на LaTeX, който може да се зададе чрез установяване на променливата на средата `TEXINPUTS`, например така:

```shell
cd examples
export TEXINPUTS=..:$TEXINPUTS
pdflatex example.tex
pdflatex example.tex
```
Двукратната компилация е нужна за правилно пресмятане на номерата на страниците.