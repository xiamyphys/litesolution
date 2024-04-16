%% ***********************************************************
%%   Copyright 2024 by Mingyu Hsia <xiamyphys@gmail.com>     *
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
%%   available at https://github.com/xiamyphys/LitSolution   *
%% ***********************************************************
% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\PassOptionsToPackage{svgnames}{xcolor}
\ProvidesClass{litesolution}[2024/04/17 v2.1a LiteSolution document class]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=LITE, prefix=LITE@, setkeys=\kvsetkeys}
\def\ekv#1{\kvsetkeys{LITE}{#1}}

\DeclareStringOption[ans]{answer}
\DeclareVoidOption{ans}{\ekv{answer=ans}}
\DeclareVoidOption{noans}{\ekv{answer=noans}}

\DeclareStringOption[newtx]{math}
\DeclareVoidOption{newtx}{\ekv{math=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}

\DeclareStringOption[separate]{counter}
\DeclareVoidOption{separate}{\ekv{counter=separate}}
\DeclareVoidOption{continuous}{\ekv{counter=continuous}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[letterpaper,11pt,openany]{book}

\RequirePackage{geometry,setspace,datetime,caption,booktabs,multicol,diagbox,paracol,float,enumitem}
\RequirePackage[nokeyprefix]{refstyle}
\newref{fig}{name={\sffamily\bfseries Figure~}}
\newref{tab}{name={\sffamily\bfseries Table~}}
\geometry{margin = 1in}
\linespread{1.3}
\ddmmyyyydate
\captionsetup{labelsep=period,labelfont={bf,sf},font=small}
\AtBeginEnvironment{figure}{\vspace*{-1ex}}
\AfterEndEnvironment{figure}{\vspace*{-2ex}}
\AtBeginEnvironment{paracol}{\nointerlineskip}
\AfterEndEnvironment{paracol}{\nointerlineskip}
\columnratio{.64}
\setlist[enumerate]{itemsep=.5ex}
\setlist[itemize]{itemsep=.5ex}

\RequirePackage{graphics,graphicx,wallpaper}
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{ifxetex}
\ifXeTeX
  \RequirePackage[quiet]{xeCJK}
  \RequirePackage{zhlipsum}
  \setlength{\parindent}{2em}
\fi

\ifdefstring{\LITE@math}{mtpro2}{%
  \RequirePackage{amssymb}
  \let\Bbbk\relax
  \RequirePackage[mtpscr,mtpccal,mtpfrak]{mtpro2}
  \RequirePackage[mono=false]{libertine}
}{\relax}

\ifdefstring{\LITE@math}{newtx}{%
  \RequirePackage[libertine,mono=false]{newtx}
}{\relax}
\let\openbox\relax\def\hmmax{0}\def\bmmax{0}
\RequirePackage{amsthm,mdframed,physics2,bm,fixdif,derivative,cancel,extarrows,siunitx,xfrac,nicematrix}
\usephysicsmodule{ab,braket,diagmat,doubleprod,xmat,ab.legacy,op.legacy}
\RequirePackage[e]{esvect}
\AtBeginDocument{%
  \def\i{\mathrm i}
  \def\e{\mathrm e}
  \def\T{\mathsf T}
  \let\leq\leqslant\let\geq\geqslant
  \setlength{\abovedisplayskip}{9pt}
  \setlength{\belowdisplayskip}{9pt}
}

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{fontawesome5}
\AddToHook{cmd/faIcon/before}{%
  \begingroup\fontsize{\fpeval{\f@size*.8}}{0}\selectfont
}
\AddToHook{cmd/faIcon/after}{\endgroup}

\RequirePackage{circuitikz,pgfplots,fadingimage}
\usetikzlibrary{arrows,tikzmark,patterns,calc,fadings,angles,quotes,intersections,}
\tikzset{>=stealth',
every picture/.append style={%
    line join=round,line cap=round,thick
  }}
\pgfplotsset{compat=1.8}
\ctikzset{capacitors/width=0.12,capacitors/height=0.3}
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
\def\coverdecoration#1{\gdef\@coverdecoration{#1}}
\def\cover#1{\gdef\@cover{#1}}
\renewcommand*\maketitle{
  \newgeometry{margin = 0in}
  \tikz[remember picture,overlay]{
    \fill [MidnightBlue!10] (current page.north west) rectangle (current page.south east);
    \fill [white,opacity=.5] ($(current page.south west)+(.2*\paperwidth,.6*\paperheight)$) rectangle (current page.south east);
    \fill [white,opacity=.5] ($(current page.south west)+(.3*\paperwidth,.7*\paperheight)$) rectangle (current page.south east);
    \ifcsname @cover\endcsname
      \node [opacity=.5] at ($(current page.south west)+(.65*\paperwidth,.3*\paperheight)$) {\includegraphics[height=.3\paperheight]{\@cover}};
      \foreach \a in {0,1,...,50}
        \fill [pattern=checkerboard,pattern color=MidnightBlue!10!white!50!white!50] ($(current page.south west)+(.3*\paperwidth,0)$) rectangle ++ (.7*\paperwidth,.6\paperheight);
    \fi
    \node [darkgray] at ($(current page.south west)+(.65*\paperwidth,.65*\paperheight)$) {\Huge\bfseries\@title};
    \ifcsname @subtitle\endcsname
      \node [rotate=90,gray!60] at ($(current page.south west)+(.25*\paperwidth,.3*\paperheight)$) {\huge\bfseries\@subtitle};
    \fi
    \ifcsname @coverdecoration\endcsname
    \node[opacity=0.5,scale=2,color=MidnightBlue!40,rotate=15] at ($(current page.center)+(0,.35*\paperheight)$) {\@coverdecoration};
    \fi
    \ifcsname @bioinfo\endcsname
      \node [gray!40] at ($(current page.south)+(.15*\paperwidth,.075*\paperheight)$) {\large\@bioinfo};
    \fi
  }\restoregeometry
}

\def\chapterimage#1{\gdef\@chapterimage{#1}}
\def\@makechapterhead#1{%
  \setcounter{section}{0}
  \setcounter{problem}{0}
  \setcounter{page}{1}{\centering
  \ifcsname @chapterimage\endcsname
    \@chapterimage
  \fi\leavevmode\vskip-42\p@
    \parindent \z@ \normalfont
      \interlinepenalty\@M
      \huge \bfseries #1\par\nobreak
    \vskip 26\p@}}

\def\mailto#1{\href{mailto:#1}{\ttfamily #1}}
\def\thesection{\arabic{section}}
\def\ans#1{\underline{~#1~}}
\AddToHook{cmd/section/before}{\setcounter{problem}{0}}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
  \let\oldheadrule\headrule
  \renewcommand{\headrule}{{\color{gray}\oldheadrule}}
  \renewcommand{\headrulewidth}{1pt}\cfoot{}
  \fancyhead[OL]{\textsc{\color{darkgray}\nouppercase\leftmark}}
  \fancyhead[OR]{\color{darkgray}\sffamily\thepage}
  \fancyhead[ER]{\textsc{\color{darkgray}\nouppercase\rightmark}}
  \fancyhead[EL]{\color{darkgray}\sffamily\thepage}
  \setlength{\headheight}{14pt}

\RequirePackage{comment}
\ifdefstring{\LITE@answer}{ans}{%
  \def\ans#1{\underline{~#1~}}
  \def\s@solute#1{\relax}\def\@solute#1{\relax}
  \AtBeginDocument{%
    \excludecomment{draft}
    \let\enddraft\relax}
  \def\true{%
    \addtocounter{task}{1}%
    \faIcon{check-circle}}
}{\relax}

\ifdefstring{\LITE@answer}{noans}{%
  \def\ans#1{\underline{\phantom{#1}}}
  \def\choiceans#1{\phantom{#1}}
  \def\s@solute#1{\begin{draft}#1\end{draft}}
  \def\@solute#1{\begin{draft}\leavevmode\vspace*{#1ex}\end{draft}}
  \AtBeginDocument{%
    \excludecomment{solution}\excludecomment{note}
    \let\endsolution\relax\let\endnote\relax}
  \def\true{%
    \addtocounter{task}{1}%
    \thetask
  }
}{\relax}
\def\solute{\@ifstar\s@solute\@solute}

\newtheoremstyle{tags}{3pt}{3pt}{}{}{}{}{.5em}
  {\bfseries  \thmname{#1} \thmnumber{#2}. \hfill \thmnote{\normalfont\faIcon{rss}~#3}\\\leavevmode}
\theoremstyle{tags}
\theoremstyle{definition}
\newtheorem{problem}{\scshape\sffamily\color{DarkGreen}\faIcon{pen-square}~\scshape Problem}[chapter]
\def\theproblem{\arabic{problem}}
\newtheorem*{solution}{\scshape\sffamily\color{MidnightBlue}\faIcon{check-square}~\scshape Solution}
\newtheorem*{draft}{\scshape\sffamily\color{MidnightBlue}\faIcon{check-square}~\scshape Solution}
\newtheorem*{note}{\scshape\sffamily\color{DarkRed}\faIcon{info-circle}~\scshape Note}