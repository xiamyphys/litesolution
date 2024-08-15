%% ***********************************************************
%%   Copyright 2024 by Mingyu XIA <xiamyphys@gmail.com>      *
%%                                                           *
%%   This work may be distributed and/or modified under      *
%%   the conditions of the LaTeX Project Public License      *
%%                                                           *
%%       http://www.latex-project.org/lppl.txt               *
%%                                                           *
%%   either version 1.3c of this license or any later        *
%%   version.                                                *
%%                                                           *
%%   This work has the LPPL maintenance status `maintained'. *
%%                                                           *
%%   The Current Maintainer of this work is Mingyu XIA.      *
%%                                                           *
%%   This work consists of the files litesolution.cls,       *
%%                               and README.md.              *
%%   available at https://github.com/xiamyphys/litsolution   *
%% ***********************************************************
% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{svgnames}{xcolor}
\ProvidesClass{litesolution}[2024/07/02 v2.4a LiteSolution document class]
\RequirePackage{kvoptions,etoolbox,keyval}
\SetupKeyvalOptions{family=LITE, prefix=LITE@, setkeys=\kvsetkeys}
\def\ekv#1{\kvsetkeys{LITE}{#1}}

\DeclareStringOption{answer}
\DeclareVoidOption{hideanswer}{\ekv{answer=hideanswer}}

\DeclareStringOption[newtx]{math}
\DeclareVoidOption{newtx}{\ekv{math=newtx}}
\DeclareVoidOption{newtxsf}{\ekv{math=newtxsf}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[letterpaper,11pt]{book}

\RequirePackage{setspace,datetime,tabularx,caption,subcaption,anyfontsize,booktabs,multicol,diagbox,paracol}
\linespread{1.3}
\ddmmyyyydate
\captionsetup{labelsep=period,labelfont={bf,sf},font=small}
\AtBeginEnvironment{figure}{\vspace*{-1ex}}
\AfterEndEnvironment{figure}{\vspace*{-2ex}}
\AtBeginEnvironment{paracol}{\nointerlineskip}
\AfterEndEnvironment{paracol}{\nointerlineskip}
\columnratio{.64}
\RequirePackage[inline]{enumitem}
\setlist[enumerate]{itemsep=.5ex}
\setlist[itemize]{itemsep=.5ex}
\RequirePackage[notelinecolor=MidnightBlue,notemargin=.75in]{notebeamer}
\geometry{margin=1in,headheight=14pt}
\RequirePackage[nokeyprefix]{refstyle}
\newref{eq}{refcmd=(\ref{#1}),name={\sffamily eq.~},Name={\sffamily Eq.~}}
\newref{fig}{name={\sffamily fig.~},Name={\sffamily Fig.~}}
\newref{tab}{name={\sffamily tab.~},Name={\sffamily Tab.~}}

\RequirePackage{graphicx,magicwatermark,pagecolor}
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{ifxetex}
\ifXeTeX
  \RequirePackage[quiet,CJKmath,CheckSingle,PlainEquation]{xeCJK}
  \RequirePackage{zhlipsum}
  \setlength{\parindent}{2em}
\fi

\ifdefstring{\LITE@math}{mtpro2}{%
  \RequirePackage[mtpscr,mtpccal,mtpfrak]{mtpro2}
  \let\Bbbk\relax
  \RequirePackage[mono=false]{libertine}
}{\relax}
\ifdefstring{\LITE@math}{newtx}{%
  \RequirePackage[libertine,mono=false]{newtx}
  \let\Bbbk\relax
}{\relax}
\ifdefstring{\LITE@math}{newtxsf}{%
  \RequirePackage{newtxsf,mathrsfs}
  \RequirePackage[mono=false]{libertine}
}{\relax}
\let\openbox\relax\def\hmmax{0}\def\bmmax{0}
\RequirePackage{amssymb,mathtools,physics2,bm,fixdif,derivative,cancel,extarrows,siunitx,xfrac,nicematrix}
\usephysicsmodule{ab,braket,diagmat,doubleprod,xmat,ab.legacy,op.legacy}
\RequirePackage[e]{esvect}
\let\vec\vv
\renewcommand*\env@cases[1][.84]{%
  \let\@ifnextchar\new@ifnextchar
  \left\lbrace
  \def\arraystretch{#1}%
  \array{@{}l@{\quad}l@{}}%
}
\AtBeginDocument{%
  \def\i{\mathrm i}\def\e{\mathrm e}\def\T{\mathsf T}
  \let\leq\leqslant\let\geq\geqslant
  \setlength{\abovedisplayskip}{9pt}
  \setlength{\belowdisplayskip}{9pt}
}

\RequirePackage[hidelinks]{hyperref}
\def\mailto#1{\href{mailto:#1}{\ttfamily #1}}
\RequirePackage{fontawesome5}
\AddToHook{cmd/faIcon/before}{%
  \begingroup\fontsize{\fpeval{\f@size*.8}}{0}\selectfont
}
\AddToHook{cmd/faIcon/after}{\endgroup}

\RequirePackage{circuitikz,pgfplots,fadingimage}
\RequirePackage[version=4]{mhchem}
\usetikzlibrary{arrows,tikzmark,patterns,calc,angles,quotes,intersections}
\tikzset{>=stealth',
    every picture/.append style={%
    line join=round,line cap=round,thick
  }}
\pgfplotsset{compat=1.8}
\ctikzset{capacitors/width=.12,capacitors/height=.3}
\NewDocumentCommand\length{ O{} m m m m m }{%
  \node [#1] at ($.5*($#3+#2$)$) {#4}#6
  \draw [->|,thick] ($.5*($#3+#2+#5$)$) -- #3#6
  \draw [->|,thick] ($.5*($#3+#2-#5$)$) -- #2#6
}
\NewDocumentCommand\wall{ m m m }{
  \fill [pattern=north east lines] #1 rectangle #2#3
  \draw [very thick,line cap=butt] let \p1=#1, \p2=#2 in (\x1,\y1) (\x2,\y2) (\x1,\y1) -- (\x2,\y1)#3
}

\RequirePackage{tasks,lipsum,hologo,qrcode}
\settasks{label=\sffamily\Alph*.,label-width=1.25em,item-indent=2em,label-offset=.25em}
\hologoFontSetup{general=\sffamily}
\def\pkg#1{\textcolor{DarkGreen}{\textsf{#1}}}
\def\mode#1{\textcolor{Indigo}{\textsf{#1}}}
\def\cmd#1{\textcolor{MidnightBlue}{\texttt{\string#1}}}

\define@key{coverset}{title}{\gdef\@title{#1}}
\define@key{coverset}{subtitle}{\gdef\@subtitle{#1}}
\define@key{coverset}{bioinfo}{\gdef\@bioinfo{#1}}
\define@key{coverset}{covercolor}{\gdef\@covercolor{#1}}
\define@key{coverset}{coverhead}{\gdef\@coverhead{#1}}
\define@key{coverset}{coverhead.rotate}{\gdef\@coverheadrotate{#1}}
\define@key{coverset}{cover}{\gdef\@cover{#1}}
\define@key{coverset}{cover.pattern}{\gdef\@coverpattern{#1}}
\def\coverset#1{
  \setkeys{coverset}{#1}
  \ifcsname @covercolor\endcsname
    \relax
  \else
    \gdef\@covercolor{DarkSlateGray}
  \fi
}

\renewcommand*\maketitle{
  \begin{titlepage}
  \newgeometry{margin=0in}
  \newpagecolor{\@covercolor!15}
  \gdef\@covercolor{DarkSlateGray}
  \tikz[remember picture,overlay]{
    \fill [white,opacity=.5] ($(current page.south west)+(.2*\paperwidth,.6*\paperheight)$) rectangle (current page.south east);
    \fill [white,opacity=.5] ($(current page.south west)+(.3*\paperwidth,.7*\paperheight)$) rectangle (current page.south east);
    \node [darkgray] at ($(current page.south west)+(.65*\paperwidth,.65*\paperheight)$) {\Huge\bfseries\@title};
    \ifcsname @subtitle\endcsname
      \node [rotate=90,gray,opacity=.6] at ($(current page.south west)+(.25*\paperwidth,.3*\paperheight)$) {\huge\bfseries\@subtitle};
    \fi
    \ifcsname @bioinfo\endcsname
      \node [gray,opacity=.4] at ($(current page.south)+(.15*\paperwidth,.075*\paperheight)$) {\large\@bioinfo};
    \fi
    \ifcsname @coverhead\endcsname
      \ifcsname @coverheadrotate\endcsname
        \relax
      \else
        \gdef\@coverheadrotate{0}
      \fi
      \node [rotate=\@coverheadrotate] at ($(current page.center)+(0,.35*\paperheight)$) {\includegraphics[width=\paperwidth]{\@coverhead}};
    \fi
    \ifcsname @cover\endcsname
      \node (@cover) at ($(current page.south west)+(.65*\paperwidth,.3*\paperheight)$) {\includegraphics[height=.3\paperheight]{\@cover}};
      \ifcsname @coverpattern\endcsname
        \fill [scope fading=south,pattern=\@coverpattern,pattern color=\@covercolor!15!white!25] (@cover.south west) rectangle (@cover.north east);
      \fi\fi}
  \end{titlepage}
  \restoregeometry
  \restorepagecolor
    \if@twoside
      \clearpage%
      \newpagecolor{\@covercolor!15!white!25}
      \thispagestyle{empty}%
      \null\clearpage
    \fi
    \restorepagecolor
}

\RequirePackage{tocloft}
\setlength{\cftbeforetoctitleskip}{6\p@}
\setlength{\cftaftertoctitleskip}{24\p@}
\AddToHook{cmd/tableofcontents/before}{
  \begingroup
  \setstretch{1.5}
}
\AddToHook{cmd/tableofcontents/after}{\endgroup}
\renewcommand\contentsname{\sffamily\scshape Contents}
\setcounter{tocdepth}{1}

\let\@chapapptmp\@chapapp
\gdef\@chapapp{\textsc{\@chapapptmp}}
\def\chapterimage#1{\gdef\@chapterimage{#1}}
\def\@makechapterhead#1{%
  \def\thesection{\arabic{chapter}.\arabic{section}}
  \def\theproblem{\thechapter.\arabic{problem}}
  \vspace*{-36\p@}{%
  \parindent \z@ \raggedright \normalfont
    \ifcsname @chapterimage\endcsname
      \@chapterimage
      \else\leavevmode
    \fi
    \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter
              \parbox{6em}
              {\centering\@setfontsize\HUGE{30}{40}\normalfont\bfseries\textcolor{darkgray}\thechapter\vskip4\p@\normalsize\bfseries\textcolor{darkgray}{\bfseries\sffamily\@chapapp}}%
            \fi
    \fi
    \interlinepenalty\@M\hspace*{3ex}
    \huge\bfseries #1\par\nobreak
    \vskip 36\p@
}}
\def\@makeschapterhead#1{%
\def\thesection{\arabic{section}}
\def\theproblem{\arabic{problem}}
\setcounter{section}{0}
\setcounter{problem}{0}
{\centering
\ifcsname @chapterimage\endcsname
  \@chapterimage
\fi\vskip-40\p@
  \parindent \z@ \normalfont
    \interlinepenalty\@M
    \huge \bfseries #1\par\nobreak
  \vskip 28\p@}}
\let\cleardoublepage=\clearpage
\renewcommand*\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\ifnum \thechapter=0
  \vspace*{\fill}
    {\centering\itshape\Large This page was intentionally left blank.\par}
  \vspace{\fill}
\else
  \clearpage%
  \thispagestyle{empty}%
  \null\clearpage
\fi
\thispagestyle{empty}\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\let\oldheadrule\headrule
\renewcommand{\headrule}{{\color{gray}\oldheadrule}}
\renewcommand{\headrulewidth}{1pt}
\fancyfoot[L]{\footnotesize\fbox{Unauthorized copying or reuse of any part of this page is illegal}}
\fancyfoot[OR]{\sffamily\bfseries GO ON TO THE NEXT PAGE}
\if@twoside\cfoot{}
  \fancyhead[OL]{\color{darkgray}\nouppercase\leftmark}
  \fancyhead[OR]{\color{darkgray}\sffamily\thepage}
  \fancyhead[ER]{\color{darkgray}\nouppercase\rightmark}
  \fancyhead[EL]{\color{darkgray}\sffamily\thepage}
\else
  \fancyhead[L]{\color{darkgray}\nouppercase\leftmark}
  \fancyhead[R]{\color{darkgray}\nouppercase\rightmark}
  \cfoot{\color{darkgray}\sffamily\thepage}
\fi

\RequirePackage{amsthm}
\renewcommand\qedsymbol{$\color{gray}\blacksquare$}
\theoremstyle{definition}
\newtheorem{problem}{\color{DarkGreen}\faIcon{pen-square}~\textsc{\textsf{Problem}}}[chapter]
\newtheorem*{solution}{\color{MidnightBlue}\faIcon{check-square}~\textsc{\textsf{Solution}}}
\newtheorem*{scratch}{\color{MidnightBlue}\faIcon{check-square}~\textsc{\textsf{Scratch}}}
\newtheorem*{note}{\color{DarkRed}\faIcon{info-circle}~\textsc{\textsf{Note}}}
\RequirePackage{comment,ulem,soul}
\ifxetex
  \RequirePackage{xeCJKfntef}
  \def\@emph#1{\CJKsout*[thickness=2.5ex, format=\color{\@covercolor!15}]{#1}}
  \def\s@emph#1{\CJKunderwave{#1}}
\else
  \def\@emph#1{\sethlcolor{\@covercolor!15}\hl{#1}}
  \def\s@emph#1{\uwave{#1}}
\fi
\ifdefstring{\LITE@answer}{hideanswer}{%
  \def\ans#1{\underline{\phantom{#1}}}
  \def\choiceans#1{\phantom{#1}}
  \def\s@solute#1{\begin{scratch}#1\end{scratch}}
  \def\@solute#1{\begin{scratch}\leavevmode\vspace*{#1ex}\end{scratch}}
  \AtBeginDocument{%
    \excludecomment{solution}\excludecomment{note}
    \let\endsolution\relax\let\endnote\relax}
  \def\true{\addtocounter{task}{1}\thetask}
  \DeclareRobustCommand\emph{\@ifstar\s@emph\s@emph}
}{
  \def\ans#1{\underline{~#1~}}
  \def\s@solute#1{\relax}\def\@solute#1{\relax}
  \AtBeginDocument{%
    \excludecomment{scratch}
    \let\endscratch\relax}
  \def\true{\addtocounter{task}{1}\faIcon{check-circle}}
  \DeclareRobustCommand\emph{\@ifstar\s@emph\@emph}
}
\DeclareRobustCommand\solute{\@ifstar\s@solute\@solute}
%%
%% End of file `litesolution.cls'.
