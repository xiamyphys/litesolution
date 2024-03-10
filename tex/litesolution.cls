%% ****************************************************************************************************
%%   Copyright 2024 by Mingyu Hsia <xiamyphys@gmail.com>                                              *
%%                                                                                                    *
%%   This work may be distributed and/or modified under          *           *****       *    *       *
%%   the conditions of the LaTeX Project Public License          *      ** *   *    ***   *  *        *
%%                                                               *     *  **   *   *   *   **         *
%%       http://www.latex-project.org/lppl.txt                   *     *   *   *   *****   **         *
%%                                                               *     *  **   *   *      *  *        *
%%   either version 1.3c of this license or any later            *****  ** *   *    ***  *    *       *
%%   version.                                                                                         *
%%                                                                                                    *
%%   This work has the LPPL maintenance status `maintained'.                                          *
%%                                                                                                    *
%%   The Current Maintainer of this work is Mingyu Hsia.                                              *
%%                                                                                                    *
%%   This work consists of the files litesolution.cls,                                                *
%%                               and README.md.                                                       *
%%   available at https://github.com/xiamyphys/LitSolution                                            *
%% ****************************************************************************************************
% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{litesolution}[2024/03/11 v2.0a LiteSolution document class]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=LITE, prefix=LITE@, setkeys=\kvsetkeys}
\def\ekv#1{\kvsetkeys{LITE}{#1}}

\DeclareStringOption[ans]{answer}
\DeclareVoidOption{ans}{\ekv{answer=ans}}
\DeclareVoidOption{noans}{\ekv{answer=noans}}

\DeclareStringOption[separate]{counter}
\DeclareVoidOption{separate}{\ekv{counter=separate}}
\DeclareVoidOption{continuous}{\ekv{counter=continuous}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[letterpaper,11pt,openany]{book}

\RequirePackage{geometry,anyfontsize,setspace,enumitem,booktabs,tabularx,diagbox,multicol,multirow}
\geometry{margin= 1 in}
\setstretch{1.25}

\RequirePackage{graphics,graphicx}
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{indentfirst}
\setlength{\parindent}{2ex}

\RequirePackage[labelsep=period,labelfont={bf,sf},font=small]{caption}
\RequirePackage[nokeyprefix]{refstyle}
\newref{fig}{name={\sffamily\bfseries Figure~}}
\newref{tab}{name={\sffamily\bfseries Table~}}

\RequirePackage{lipsum,hologo}
\hologoFontSetup{general=\sffamily}
\RequirePackage{ifxetex}
\ifXeTeX
    \RequirePackage[quiet]{xeCJK}
    \RequirePackage[quiet,no-math]{fontspec}
    \RequirePackage{zhlipsum}
    \NewDocumentCommand\chapterfont{ o m }{
        \setCJKfamilyfont{chapterfont}[#1]{#2}
        \gdef\@chapterfont[#1]{#2}
    }
\else
    \def\chapterfont#1{}
    \def\CJKfamily#1{}
\fi

\def\chapterimage#1{\gdef\@chapterimage{#1}}
\def\@makechapterhead#1{%
  {\UPFadingImage[trim={0 {.9\paperheight} 0 0},clip]{\@chapterimage}
   \parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \par\nobreak
    \fi
    \interlinepenalty\@M
    \ifcsname @chapterfont\endcsname\CJKfamily{chapterfont}\fi
    \normalsize \bfseries \ifXeTeX\else\sffamily\fi \huge #1\par\nobreak
    \vskip 20\p@\normalfont\normalsize
  }}

\def\@makeschapterhead#1{%
  {\parindent \z@ \centering
    \normalfont
    \interlinepenalty\@M
    \huge \bfseries \sffamily  #1\par\nobreak
    \vskip 40\p@
  }}
\setlength{\headheight}{14pt}
\def\thesection{\arabic{section}}

\RequirePackage{datetime}
\yyyymmdddate

\def\watermark#1{\RequirePackage{wallpaper}\CenterWallPaper{0.5}{#1}}
\RequirePackage{fancyhdr}
\def\sectionmark#1{\markright{#1}{}}
\def\chaptermark#1{\markboth{#1}{}}
\pagestyle{fancy}
   \fancyhead[OL]{\scshape\sffamily\nouppercase\rightmark}
   \fancyhead[OR]{\thepage}
   \fancyhead[EL]{\thepage}
   \fancyhead[ER]{\scshape\sffamily\nouppercase\leftmark}
   \lfoot{}\cfoot{}\rfoot{}

\RequirePackage[most]{tcolorbox}
\RequirePackage{circuitikz,fontawesome5}
\usetikzlibrary{arrows,tikzmark,patterns,calc}
\RequirePackage{fadingimage}
\tikzset{>=stealth',
every picture/.append style={
    line join=round,
    line cap=round,
    thick
  }
}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.9}
\definecolor{headrulecolor}{HTML}{640125}

\RequirePackage{comment}
\ifdefstring{\LITE@answer}{ans}{
  \def\solutionname{\small\faIcon{check-square}\normalsize~Solution}
  \def\ans#1{\underline{~#1~}}
  \def\choiceans#1{~#1~}
  \def\solute#1{\relax}
}{\relax}

\ifdefstring{\LITE@answer}{noans}{
  \def\solutionname{\small\faIcon{pen-square}\normalsize~Answer}
  \def\ans#1{\underline{\phantom{#1}}}
  \def\choiceans#1{\phantom{#1}}
  \def\solute#1{\begin{draft}\leavevmode\vspace*{#1ex}\end{draft}}
  \AtBeginDocument{
  \excludecomment{solution}
  \let\endsolution\relax
  }
}{\relax}

\definecolor{pkgcolor}{HTML}{006E54}
\definecolor{moducolor}{HTML}{4D5AAF}
\definecolor{cmdcolor}{HTML}{19727F}
\RequirePackage[colorlinks,linkcolor=teal,urlcolor=pkgcolor]{hyperref}
\def\pkg#1{\texorpdfstring{\textcolor{pkgcolor}{
    \href{https://ctan.org/pkg/#1}{\textsf{#1}}}}{“#1”}}
\def\mode#1{\texorpdfstring{\textcolor{moducolor}{\textsf{#1}}}{“#1”}}
\def\cmd#1{\texorpdfstring{\textcolor{cmdcolor}{\textsf{#1}}}{“#1”}}
\NewDocumentCommand{\titlelogo}{ o m }{
    \leavevmode@ifvmode
    \IfNoValueTF{#1}{
        \lower\dimexpr\f@size\p@*1/10\hbox{\includegraphics[height={\f@size\p@}]{#2}}
    }{
        \lower\dimexpr\f@size\p@*1/10\hbox{\href{#1}{\includegraphics[height={\f@size\p@}]{#2}}}
    }
}
\pdfstringdefDisableCommands{%
  \def\titlelogo#1{<#1>}%
}

\AtBeginDocument{
    \setlength{\abovedisplayskip}{3pt}
    \setlength{\belowdisplayskip}{3pt}
}
\def\hmmax{0}\def\bmmax{0}
\RequirePackage{amsmath,amssymb,amsthm,mathrsfs,tasks}
\settasks{label=\Alph*.}
\RequirePackage[libertine,mono=false]{newtx}
\RequirePackage[e]{esvect}
\RequirePackage{physics2,bm,fixdif,derivative,cancel,extarrows,siunitx,nicefrac,nicematrix}
\usephysicsmodule{ab,braket,diagmat,doubleprod,xmat,ab.legacy,op.legacy}
\RequirePackage[e]{esvect}
\def\i{\mathrm i}\def\e{\mathrm e}\def\T{\mathsf T}

\newtheoremstyle{tags}{3pt}{3pt}{}{}{}{}{.5em}
  {\bfseries  \thmname{#1} \thmnumber{#2}. \hfill \thmnote{\normalfont\small\faIcon{rss}\normalsize~#3}\\\leavevmode}
\theoremstyle{tags}
\newtheorem{problem}{\sffamily\scshape\color{pkgcolor}\small\faIcon{pen-square}\normalsize~Problem}[chapter]
\def\theproblem{\arabic{problem}}

\theoremstyle{definition}
\newtheorem*{solution}{\sffamily\scshape\color{moducolor}\solutionname}
\newtheorem*{draft}{\sffamily\scshape\color{moducolor}\solutionname}
\newtheorem*{note}{\sffamily\scshape\color{cmdcolor}\small\faIcon{info-circle}\normalsize~Note}