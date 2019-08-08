`eexam.cls` е LaTeX клас предназначен за предпечатна подготовка на практическата част на държавния изпит към Факултета по математика и информатика на СУ "Св. Климент Охридски".

Пример за използване на класа е даден във файла `examples/example.tex`. При наличие на инсталиран пакет `Latexmk` примерът може да се компилира с:

``` shell
cd examples
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

Всеки от файловете със задачи може да се компилира също и самостоятелно, благодарение на пакета `standalone`. За самостоятелна компилация на всяка от задачите поотделно е достатъчно да се изпълни:

```shell
cd problems
latexmk
```

или без `Latexmk`:

```shell
cd problems
export TEXINPUTS=../..:$TEXINPUTS
pdflatex problem1_example.tex
pdflatex problem2_example.tex
```

Всяка от задачите може да използва собствен преамбюл, който се включва в основния документ при компилация на цялата тема.

Компилираните теми и задачи могат да се качват в Google Drive с помощта на функциите в `gdrive_helpers.sh` или правилата в `Makefile.gdrive`. Поддържат се две действия: upload и update. При upload се качва първоначален вариант на PDF файловете с темите или задачите в зададена папка в Google Drive и техните ID-та се записват в индекс файл (например `gdrive.index`). При update се обновяват файловете с темите и задачите, които са променени съгласно ID-тата и hash-овете, записани в индексния файл.

За първоначално качване:

```shell
cd examples
. ../gdrive_helpers.sh
gdrive_upload gdrive.index <target-folder-ID> out/example.pdf
```

или с `make`:

```shell
cd examples
make gdrive.index TARGET_FOLDER=<target-folder-ID>
```

За последващо обновяване:
```shell
cd examples
. ../gdrive_helpers.sh
gdrive_update gdrive.index out/example.pdf
```

или с `make`:

```shell
cd examples
make gdrive
```
