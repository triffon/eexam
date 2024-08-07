%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Базови настройки %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eexam}[2019/08/07 v0.1 Sofia university state exam]

% предаване на всички непознати опции към базовия клас report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% обработка на опциите
\ProcessOptions

% зареждане на базов клас report
\LoadClass[12pt,a4paper]{report}

% шрифтове и кодирания
\RequirePackage[utf8]{inputenc}
\RequirePackage[T2A]{fontenc}
\RequirePackage[bulgarian]{babel}
\RequirePackage{libertine}
\RequirePackage{libertinust1math}
\RequirePackage{nimbusmononarrow}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

% настройка на подфайлове, които могат да се компилират самостоятелно
% и могат да дефинират собствени локални команди
\RequirePackage[subpreambles=true]{standalone}
\RequirePackage{import}

% форматиране на код
\RequirePackage{listings}
\lstset{
  inputencoding=utf8,
  basicstyle=\small\ttfamily,
  keywordstyle=\bfseries,
  commentstyle=\color{gray},
  tabsize=4,
  showstringspaces=false,
  breaklines=true,
  columns=fullflexible,
  extendedchars=false,
  texcl=true,
  escapechar=@,
  keepspaces=true
}

% фино форматиране на списъци
\RequirePackage{enumitem}

% многоредови клетки в таблица
\RequirePackage{multirow}

% настройка на отстъпи
\RequirePackage[a4paper, margin=1cm, headheight=1.1cm, headsep=0.4cm, footskip=0.4cm, includeheadfoot]{geometry}

%% настройка на колонтитули
\RequirePackage{fancyhdr}
\pagestyle{fancy}

% горен колонтитул
\fancyhead[C]{%
  \begin{tabular}{*{5}{c@{\hspace{1.5em}}}c}%
    && \small{Държавен изпит} & \multirow[t]{2}{20ex}{\centering\small{\textbf{\eexam@spec}}} && \\
    \small{\@date}  & \small{СУ--ФМИ} & \small{за ОКС \emph{Бакалавър}} && ф.н. \rule{15ex}{0.4pt}&  \small{лист \thepage/\pageref{LastPage}}%
  \end{tabular}%
}

% долен колонтитул
\fancyfoot{}
\renewcommand{\footrulewidth}{0.4pt}

% включване на картинки
\RequirePackage{graphicx}

% форматиране на колони
\RequirePackage{multicol}

% рефериране към номера на последната страница
\RequirePackage{lastpage}

% включване на външни файлове, използва се за прихващане на git commit hash
\RequirePackage{catchfile}
\newcommand{\eexam@gitmaster}{.git/refs/heads/master}
\IfFileExists{\eexam@gitmaster}{\CatchFileDef{\HEAD}{\eexam@gitmaster}{}}{\def\HEAD{<git master not found>}}

% добавяне на метаданни за git commit hash в генерирания PDF
\pdfinfo{/Author (\HEAD)}

% текстови стилове
\newcommand{\code}[1]{\texttt{#1}}

% команда за оставяне на поле за попълване
\newcommand{\plh}[1]{\rule{#1}{1pt}}

% заглавна страница
\newcommand{\eexamtitlepage}{%
  \newpage
  \begin{center}
    \large
    \vspace*{1cm}
    \begin{tabular}{*{2}{c@{\hspace{1.5cm}}}c}
      \parbox[b]{7cm}{\centering СОФИЙСКИ УНИВЕРСИТЕТ \\ „СВ. КЛИМЕНТ ОХРИДСКИ“}
      & \includegraphics[width=1.5cm]{images/su_logo.jpg}
      & \parbox[b]{7cm}{\centering ФАКУЛТЕТ ПО МАТЕМАТИКА \\ И ИНФОРМАТИКА}
    \end{tabular}

    \vspace{10ex}
    \Large\textbf{ДЪРЖАВЕН ИЗПИТ}\\[2ex]
    \largeЗА ПОЛУЧАВАНЕ НА ОКС „БАКАЛАВЪР ПО \MakeUppercase{\eexam@spec}“\\[4ex]
    ЧАСТ I (ПРАКТИЧЕСКИ ЗАДАЧИ)
  \end{center}

  \vspace{10ex}
  Драги абсолвенти:
  \begin{itemize}
  \item Попълнете факултетния си номер в горния десен ъгъл на всички листове.
  \item Пишете само на предоставените листове, без да ги разкопчавате.
  \item Решението на една задача трябва да бъде на същия лист, на който е и нейното условие (т.е. може да пишете отпред и отзад на листа със задачата, но не и на лист на друга задача).
  \item Ако имате нужда от допълнителен лист, можете да поискате от квесторите.
  \item На един лист не може да има едновременно и чернова, и белова.
  \item Черновите трябва да се маркират, като най-отгоре на листа напишете „ЧЕРНОВА“.
  \item Ако решението на една задача не се побира на нейния лист, трябва да поискате нов бял лист от квесторите. Той трябва да се защипе с телбод към листа със задачата.
  \item Всеки от допълнителните листове (белова или чернова) трябва да се надпише най-отгоре с вашия факултетен номер.
  \item Черновите също се предават и се защипват в края на работата.
  \item Времето за работа по изпита е 3 часа.
  \end{itemize}

  \begin{center}
    \emph{Изпитната комисия ви пожелава успешна работа!}
  \end{center}
}

% страница за чернова
\newcommand{\eexamdraftpage}{%
  \newpage
  \begin{center}
    \large{\underline{\textbf{Чернова}}}
  \end{center}
}

% брояч за задачи
\newcounter{Problem}

% задаване на директория за задачите, по подразбиране "problems"
\def\eexam@problemsdir{problems}
\newcommand{\problemsdir}[1]{\def\eexam@problemsdir{#1}}

% включване на задача
\newcommand{\problem}[1]{%
  \newpage
  \stepcounter{Problem}
  \textbf{Задача \theProblem.}
  \import{\eexam@problemsdir/}{/#1}
}

% задаване на име на специалност
\def\eexam@spec{<специалност>}
\newcommand{\spec}[1]{\def\eexam@spec{#1}}

% в standalone режим се извеждат решения
\ifstandalone
\def\fmisolutions{}
\fi

% по подразбиране се задава режим на печатане без решения, освен ако не е отменен от команден ред
\ifx\fmisolutions\undefined
\def\fmiprint{}
\fi

