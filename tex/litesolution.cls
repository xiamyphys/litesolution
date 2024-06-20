%% ***********************************************************
%%   Copyright 2024 by Mingyu Hsia <xiamyphys@hdu.edu.cn>    *
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
%%   The Current Maintainer of this work is Mingyu Hsia.     *
%%                                                           *
%%   This work consists of the files litesolution.cls,       *
%%                               and README.md.              *
%%   available at https://github.com/xiamyphys/litesolution  *
%% ***********************************************************
% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{svgnames}{xcolor}
\ProvidesClass{litesolution}[2024/05/07 v2.2b LiteSolution document class]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
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

\RequirePackage{setspace,datetime,caption,booktabs,multicol,diagbox,paracol}
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
\geometry{margin=1in}
\RequirePackage[nokeyprefix]{refstyle}
\newref{eq}{refcmd=(\ref{#1}),name={\sffamily eq.~},Name={\sffamily Eq.~}}
\newref{fig}{name={\sffamily fig.~},Name={\sffamily Fig.~}}
\newref{tab}{name={\sffamily tab.~},Name={\sffamily Tab.~}}

\RequirePackage{graphics,graphicx,wallpaper,pagecolor}
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{ifxetex}
\ifXeTeX
  \RequirePackage[quiet]{xeCJK}
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
\RequirePackage{amsthm,amssymb,mathtools,physics2,bm,fixdif,derivative,cancel,extarrows,siunitx,xfrac,nicematrix}
\renewcommand\qedsymbol{$\color{gray}\blacksquare$}
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

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\bioinfo#1{\gdef\@bioinfo{#1}}
\NewDocumentCommand\coverhead{ O{0} m }{
  \gdef\@coverheadrotate{#1}\gdef\@coverhead{#2}
}
\NewDocumentCommand\cover{ o m }{
  \IfValueT{#1}{\gdef\@coverpattern{#1}}
  \gdef\@cover{#2}}
\RenewDocumentCommand\maketitle{O{MidnightBlue}}{
  \begin{titlepage}
  \newgeometry{margin=0in}\newpagecolor{#1!15}
  \tikz[remember picture,overlay]{
    \ifcsname @coverhead\endcsname
      \node [rotate=\@coverheadrotate] at ($(current page.center)+(0,.35*\paperheight)$) {\includegraphics[width=\paperwidth]{\@coverhead}};
    \fi
    \fill [white,opacity=.5] ($(current page.south west)+(.2*\paperwidth,.6*\paperheight)$) rectangle (current page.south east);
    \fill [white,opacity=.5] ($(current page.south west)+(.3*\paperwidth,.7*\paperheight)$) rectangle (current page.south east);
    \ifcsname @cover\endcsname
      \node [opacity=.5] at ($(current page.south west)+(.65*\paperwidth,.3*\paperheight)$) {\includegraphics[height=.3\paperheight]{\@cover}};
      \ifcsname @coverpattern\endcsname
      \fill [pattern=\@coverpattern,pattern color=#1!15!white!25] ($(current page.south west)+(.3*\paperwidth,0)$) rectangle ++ (.7*\paperwidth,.6\paperheight);
    \fi\fi
    \node [darkgray] at ($(current page.south west)+(.65*\paperwidth,.65*\paperheight)$) {\Huge\bfseries\@title};
    \ifcsname @subtitle\endcsname
      \node [rotate=90,gray,opacity=.6] at ($(current page.south west)+(.25*\paperwidth,.3*\paperheight)$) {\huge\bfseries\@subtitle};
    \fi
    \ifcsname @bioinfo\endcsname
      \node [gray,opacity=.4] at ($(current page.south)+(.15*\paperwidth,.075*\paperheight)$) {\large\@bioinfo};
    \fi}
  \end{titlepage}
    \restoregeometry\restorepagecolor
    \if@twoside
      \clearpage%
      \newpagecolor{#1!15!white!50}
      \thispagestyle{empty}%
      \null\clearpage
    \fi\restorepagecolor
}

\RequirePackage{tocloft}
\setlength{\cftbeforetoctitleskip}{6\p@}
\setlength{\cftaftertoctitleskip}{24\p@}
\setlength{\cftbeforesecskip}{3\p@}
\def\contentsname{\sffamily\scshape\hfill Contents\hfill}
\setcounter{tocdepth}{1}

\let\@chapapptmp\@chapapp
\def\@chapapp{\textsc{\@chapapptmp}}
\def\chapterimage#1{\gdef\@chapterimage{#1}}
\def\HUGE{\@setfontsize\HUGE{30}{40}}
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
        {\centering\HUGE\normalfont\bfseries\textcolor{darkgray}\thechapter\vskip4\p@\normalsize\bfseries\textcolor{darkgray}{\bfseries\sffamily\@chapapp}}%
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
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
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
  \setlength{\headheight}{14pt}

\theoremstyle{definition}
\newtheorem{problem}{\color{DarkGreen}\faIcon{pen-square}~\textsc{\textsf{Problem}}}[chapter]
\newtheorem*{solution}{\color{MidnightBlue}\faIcon{check-square}~\textsc{\textsf{Solution}}}
\newtheorem*{scratch}{\color{MidnightBlue}\faIcon{check-square}~\textsc{\textsf{Scratch}}}
\newtheorem*{note}{\color{DarkRed}\faIcon{info-circle}~\textsc{\textsf{Note}}}
\RequirePackage{comment}
\ifdefstring{\LITE@answer}{hideanswer}{%
  \def\ans#1{\underline{\phantom{#1}}}
  \def\choiceans#1{\phantom{#1}}
  \def\s@solute#1{\begin{scratch}#1\end{scratch}}
  \def\@solute#1{\begin{scratch}\leavevmode\vspace*{#1ex}\end{scratch}}
  \AtBeginDocument{%
    \excludecomment{solution}\excludecomment{note}
    \let\endsolution\relax\let\endnote\relax}
  \def\true{\addtocounter{task}{1}\thetask}
}{
  \def\ans#1{\underline{~#1~}}
  \def\s@solute#1{\relax}\def\@solute#1{\relax}
  \AtBeginDocument{%
    \excludecomment{scratch}
    \let\endscratch\relax}
  \def\true{\addtocounter{task}{1}\faIcon{check-circle}}
}
\DeclareRobustCommand\solute{\@ifstar\s@solute\@solute}
%%
%% End of file `litesolution.cls'.
