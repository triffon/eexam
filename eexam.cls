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
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

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
\addtolength{\topmargin}{-1.0in}
\addtolength{\oddsidemargin}{-1.0in}
\addtolength{\evensidemargin}{-1.0in}
\addtolength{\textwidth}{2.0in}
\addtolength{\textheight}{2.0in}

%% настройка на колонтитули
\RequirePackage{fancyhdr}
\pagestyle{fancy}

% горен колонтитул
\fancyhead[C]{%
  \begin{tabular}{cccccc}%
    && \small{Държавен изпит} & \multirow[t]{2}{20ex}{\centering\small{\textbf{\@spec}}} && \\ 
    \small{\@date}  & \small{СУ-ФМИ} & \small{за ОКС \emph{Бакалавър}} && ф.н. \rule{15ex}{0.4pt}&  \small{лист \thepage/\pageref{LastPage}}%
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

% текстови стилове
\newcommand{\code}[1]{\texttt{#1}}

% заглавна страница
\newcommand{\eexamtitlepage}{%
  \newpage
  \noindent\parbox[c][4cm]{19cm}{
    \begin{center}
      \begin{tabular}{l c c}
        \noindent\parbox[b]{7.8cm}{\large{СОФИЙСКИ УНИВЕРСИТЕТ \\ ``СВ. КЛИМЕНТ ОХРИДСКИ''}} &
                                                                                               \includegraphics[width=1.5cm]{images/su_logo.jpg} &
                                                                                                                                                   \noindent\parbox[b]{7.8cm}{\centering \large{ФАКУЛТЕТ ПО МАТЕМАТИКА \\ И ИНФОРМАТИКА}}
      \end{tabular}        
    \end{center}
  }

  \begin{center}
    
    \Large{\textbf{ДЪРЖАВЕН ИЗПИТ}}

    \bigskip
    \large{ЗА ПОЛУЧАВАНЕ НА ОКС ``БАКАЛАВЪР ПО \MakeUppercase{\@spec}''}

    \bigskip

    \bigskip

    \large{ЧАСТ I (ПРАКТИЧЕСКИ ЗАДАЧИ)}
  \end{center}

  \bigskip

  \bigskip

  \bigskip

  \bigskip

  Драги абсолвенти:
  \begin{itemize}
  \item Попълнете факултетния си номер в горния десен ъгъл на всички листове.
  \item Пишете само на предоставените листове, без да ги разкопчавате.
  \item Решението на една задача трябва да бъде на същия лист, на който е и нейното условие (т.е. може да пишете отпред и отзад на листа със задачата, но не и на лист на друга задача).
  \item Ако имате нужда от допълнителен лист, можете да поискате от квесторите.
  \item На един лист не може да има едновременно и чернова, и белова.
  \item Черновите трябва да се маркират, като най-отгоре на листа напишете ``ЧЕРНОВА''.
  \item Ако решението на една задача не се побира на нейния лист, трябва да поискате нов бял лист от квесторите. Той трябва да се защипе с телбод към листа със задачата.
  \item Всеки от допълнителните листове (белова или чернова) трябва да се надпише най-отгоре с вашия факултетен номер.
  \item Черновите също се предават и се защипват в края на работата.
  \item Времето за работа по изпита е 3 часа.
  \end{itemize}

  \begin{center}
    \emph{Изпитната комисия ви пожелава успешна работа!}
  \end{center}
}

% задаване на опции

% брояч за задачи
\newcounter{Problem}

% включване на задача
\newcommand{\problem}[1]{%
  \newpage
  \stepcounter{Problem}
  \textbf{Задача \theProblem.}
  \input{#1}
}

% задаване на име на специалност
\newcommand{\spec}[1]{\def\@spec{#1}}
