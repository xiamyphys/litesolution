%% ************************************************************************************************************
%% ******************************************************                                                     *
%% * This work may be distributed and/or modified under *           *           *****       *   *             *
%% * the conditions of the LaTeX Project Public License *           *      ** *   *    ***   * *              *
%% *     http://www.latex-project.org/lppl.txt          *           *     *  **   *   *****   *               *
%% * either version 1.3c of this license or any later   *           *     *  **   *   *****   *               *
%% * version.                                           *           *     *  **   *   *      * *              *
%% ******************************************************           *****  ** *   *    ***  *   *             *
%% start of file `litesolution.cls'.                                                                          *
%% Copyright 2023 LiteLaTeX (xiamyphys@gmail.com)                                                             *
%% available at https://github.com/xiamyphys/LiteSolution                                                     *
%% Thanks https://github.com/ElegantLaTeX/ElegantBook,  https://github.com/Azure1210/VividBooK                *
%% !Mode:: "TeX:UTF-8"                                                                                        *
%% ************************************************************************************************************

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{litesolution}[15/11/2023 v1.0a LiteSolution document class]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=LITE, prefix=LITE@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{LITE}{#1}}
% ---- 全局选项
\DeclareStringOption[ans]{answer}
\DeclareVoidOption{ans}{\ekv{answer=ans}}
\DeclareVoidOption{noans}{\ekv{answer=noans}}
\DeclareVoidOption{preprint}{\ekv{answer=preprint}}

\DeclareStringOption[separate]{counter}
\DeclareVoidOption{separate}{\ekv{counter=separate}}
\DeclareVoidOption{continuous}{\ekv{counter=continuous}}

\DeclareStringOption{math}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}

% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[a4paper,oneside]{book}
\RequirePackage[letterpaper,margin=0.75in,headheight=0.25in,headsep=0.2in,footskip=0.2in]{geometry}

\RequirePackage{extarrows}% 长等号
\RequirePackage{fixdif,derivative}% 微分算子修复
\RequirePackage{physics2}
\usephysicsmodule{ab,ab.legacy,braket,nabla.legacy}
\RequirePackage{amsmath,amssymb}
\usepackage{nicematrix}
\RequirePackage{bm}
\RequirePackage{esint}
\makeatletter
\def\sim@x@scale{.15}
\def\sim@y@scale{.05}
\def\sim@y@thick{.02}
\newsavebox\sim@upper
\newsavebox\sim@lower
% extensible sim symbol
\NewDocumentCommand{\xSim}{ O{} m }{%
  \TextOrMath{%
    \PackageError{TEST}{`\string\xSim` is valid in math mode only.}{}%
  }{
    % math mode only, hence no need to eliminate spaces
    \sbox\sim@upper{$\scriptsize #2$}
    \sbox\sim@lower{$\scriptsize #1$}
    \pgfmathparse{min(max(\wd\sim@upper/1em, \wd\sim@lower/1em, 1.0), 1.5)}
    \edef\sim@ratio{\pgfmathresult}
    \def\sim@x {\sim@x@scale * \sim@ratio}
    \def\sim@y {\sim@y@scale * \sim@ratio}
    \def\sim@@y{\sim@y@thick * \sim@ratio}
    \pgfmathparse{floor(max(\wd\sim@upper/1em, \wd\sim@lower/1em)) + 1}
    \edef\sim@wd{\pgfmathresult em}
    \mathrel{
      \begin{tikzpicture}[baseline=-.7ex]
        \filldraw[line width=.2pt] 
          (0, 0)
            .. controls +(\sim@x, \sim@y+\sim@@y) and +(-\sim@x, -\sim@y) .. 
          +(\sim@wd, 0) 
            node[midway, above] {\usebox\sim@upper} 
            node[midway, below] {\usebox\sim@lower}
            .. controls +(-\sim@x, -\sim@y-\sim@@y) and +(\sim@x, \sim@y) .. 
          (0, 0);
      \end{tikzpicture}
    }
  }%
}

\RequirePackage[e]{esvect}% 矢量箭头
\RequirePackage{bbm}% 花体字
\RequirePackage{dutchcal}% 花体字2
\RequirePackage{mathrsfs}% 花体字3
\RequirePackage{csquotes}% 引号
\RequirePackage{tasks}% 选择题
\settasks{label=\Alph*.}
\RequirePackage{setspace}
\setstretch{1.5}
\AtBeginDocument{
  \everymath{\displaystyle}
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
}

\definecolor{pkgcolor}{Hsb}{103,.8,.5}
\definecolor{moducolor}{Hsb}{290,.8,.5}
\definecolor{cmdcolor}{Hsb}{188,.8,.5}
\definecolor{filecolor}{Hsb}{207,.6,.7}
\definecolor{H1}{Hsb}{349,.8,.8}% 海棠紅 (Hangzhou MTR L 1 )
\definecolor{H2}{Hsb}{23, .8,.8}% 丹桂橙 (Hangzhou Metro 2 )
\definecolor{H3}{Hsb}{48, .8,.8}% 柠檬黄 (Hangzhou Metro 3 )
\definecolor{H4}{Hsb}{103,.8,.8}% 香樟绿 (Hangzhou Metro 4 )
\definecolor{H5}{Hsb}{188,.8,.8}% 青藍色 (Hangzhou MTR L 5 )
\definecolor{H6}{Hsb}{207,.8,.8}% 海洋蓝 (Hangzhou Metro 6 )
\definecolor{H7}{Hsb}{290,.8,.8}% 浪漫紫 (Hangzhou Metro 7 )
\RequirePackage{hyperref}
\hypersetup{colorlinks,urlcolor=H1,linkcolor=H2,filecolor=filecolor,pdfstartview=FitH,pdfview=FitH,pdfcreator=XeTeX output}

\RequirePackage{indentfirst,comment}
% fontsetting
\ifdefstring{\LITE@math}{mtpro2}{
  \let\Bbbk\relax
  \RequirePackage[lite]{mtpro2}
}{\relax}

\RequirePackage[UTF8,scheme=plain]{ctex}
\RequirePackage{xeCJK}
\NewDocumentCommand\chapterfont{s m}{
  \IfBooleanTF{#1}{
    \setCJKfamilyfont{chapterfont}{#2}[Extension =.ttf]
  }
  {
    \setCJKfamilyfont{chapterfont}{#2}
  }
  \gdef\@chapterfont{#2}
}

\setcounter{tocdepth}{1}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage[no-math]{fontspec}

\AfterEndPreamble{
  \setlength\parindent{2\ccwd}}{\relax}

%% 章节以及页脚图形
\RequirePackage{xcolor}
\RequirePackage{silence}
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}

% ----- box -----
\definecolor{headrulecolor}{HTML}{640125}
\definecolor{1号色}{HTML}{4D5AAF} %
\definecolor{2号色}{HTML}{006E54} %

\ifdefstring{\LITE@answer}{ans}{
  \definecolor{solutioncolor}{HTML}{0F2350} %
  \newcommand{\solutionname}{\faIcon{check-square} 分析与解}
  \def\ans#1{\underline{\color{solutioncolor}\ #1\ }}
  \def\choiceans#1{{\color{solutioncolor}\ #1\ }}
  \definecolor{backgroundcolor}{HTML}{F8F7E9}
}{\relax}
\ifdefstring{\LITE@answer}{noans}{
  \definecolor{solutioncolor}{HTML}{FEFEFB} %
  \def\solutionname{\faIcon{pen-square} 答题区域}
  \def\ans#1{\underline{\phantom{\color{solutioncolor}#1}}}
  \def\choiceans#1{\phantom{\color{solutioncolor}}}
  \definecolor{backgroundcolor}{HTML}{FFFFFF}
}{\relax}
\pagecolor{backgroundcolor!20}
\newcommand{\notename}{\faIcon{info-circle} 注意}
\def\proofname{证明.}
\newcommand{\problemname}{\faIcon{pen-square} 题目} % 题目=习题

\RequirePackage[most]{tcolorbox}
\tcbuselibrary{breakable}
\tcbset{
  common/.style={
    blanker,breakable,
    left=3mm,
    toprule=.3em,
    bottomrule=.3em,
    bottomtitle=.75\baselineskip,
    fonttitle=\bfseries
  }
}
\newcounter{prob}[chapter]
\setcounter{prob}{1}
\renewcommand{\theprob}{\arabic{prob}}

\NewDocumentEnvironment{choice}{m o}{
  \refstepcounter{prob}
  \IfNoValueTF{#2}
  {
    \begin{tcolorbox}[
      common,
      borderline west={1.5pt}{0mm}{2号色},
      title=\bfseries\color{2号色}{\problemname}\theprob\hfill【\quad \choiceans#1 \color{2号色}\quad 】,
      coltitle=2号色
    ]
  }{
    \begin{tcolorbox}[
      common,
      borderline west={1.5pt}{0mm}{2号色},
      title=\bfseries\color{2号色}{\problemname}\theprob\hfill\color{2号色}\faIcon{tag}~#2\qquad【\quad \choiceans#1 \color{2号色}\quad 】,
      coltitle=2号色
    ]
  }
  \rmfamily}{\end{tcolorbox}}  

\NewDocumentEnvironment{problem}{s o o}{
  \refstepcounter{prob}
  \IfBooleanTF{#1}{
    \def\tagname{\relax}
  }{
    \def\tagname{\hfill\faIcon{tag}}
  }
  \IfNoValueTF{#3}{
    \IfNoValueTF{#2}{
      \begin{tcolorbox}[
        common,
        borderline west={1.5pt}{0mm}{2号色},
        title=\color{2号色}{\problemname} \theprob,
        coltitle=2号色,
      ]
    }{
      \begin{tcolorbox}[
        common,
        borderline west={1.5pt}{0mm}{2号色},
        title=\color{2号色}{\problemname} \theprob\tagname~#2,
        coltitle=2号色,
      ]
    }
  }{
    \IfNoValueTF{#2}{
      \begin{tcolorbox}[
        common,
        borderline west={1.5pt}{0mm}{2号色},
        title=\color{2号色}{\problemname} \theprob（本题#3分）,
        coltitle=2号色,
      ]
    }{
      \begin{tcolorbox}[
        common,
        borderline west={1.5pt}{0mm}{2号色},
        title=\color{2号色}{\problemname} \theprob（本题#3分）\tagname~#2,
        coltitle=2号色,
      ]
    }
  }
  \rmfamily}{\end{tcolorbox}}

\newenvironment{note}{
  \begin{tcolorbox}[
    common,
    borderline west={1.5pt}{0mm}{H1},
    title=\textbf{\color{H1}\notename},
    coltitle=H1 
  ]
  \kaishu}{\end{tcolorbox}}

\NewDocumentEnvironment{proof}{s}{
  \par\noindent\bfseries\songti{\color{H1}\proofname\;}
  \color{solutioncolor!90}\fangsong
}{\IfBooleanTF{#1}{\relax}{\QED}}

\NewDocumentEnvironment{solution}{s}{
  \IfBooleanTF{#1}{
    \begin{tcolorbox}[
      common,
      borderline west={1.5pt}{0mm}{1号色},
      coltitle=1号色
      ]
    \textcolor{1号色}{\textbf{\solutionname}}
  }
  {
    \begin{tcolorbox}[
    common,
    borderline west={1.5pt}{0mm}{1号色},
    title=\textcolor{1号色}{\textbf{\solutionname}},
    coltitle=1号色,
    colupper=solutioncolor,
    collower=solutioncolor
    ]}%
  \kaishu\color{solutioncolor}}{\end{tcolorbox}}

\RequirePackage{enumerate}
% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep,leftmargin=1.5em}

\RequirePackage{graphicx}
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}
\RequirePackage{pdfpages}
\RequirePackage{wrapstuff}% 图文绕排
\RequirePackage{booktabs}
\RequirePackage{paracol}
\columnratio{0.67}
\RequirePackage{multicol,multirow}

\RequirePackage{fancyvrb}

%绘图
\RequirePackage{tikz} %% load tikz without tikz
\usetikzlibrary{intersections,decorations.markings,spy,arrows,shapes,fadings,mindmap,shapes.arrows,shapes.symbols,tikzmark,shapes.geometric,graphs,decorations.pathmorphing,through,arrows.meta,shapes.misc,decorations.shapes,angles,backgrounds,calc,math,decorations,decorations.pathreplacing,fit,quotes,shadows,positioning,patterns,shadings,snakes}
\tikzset{>=stealth,line cap=round,line join=round}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.9}
%电路图绘制
\RequirePackage{circuitikz}
\ctikzset{logic ports=ieee,logic ports/scale=0.6,fill=backgroundcolor}

\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=1号色,draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=1号色,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=1号色,draw=none] circle (2pt);}
\setlist[enumerate,1]{label=\color{1号色}\arabic*.}
\setlist[enumerate,2]{label=\color{1号色}(\alph*).}
\setlist[enumerate,3]{label=\color{1号色}\Roman*.}
\setlist[enumerate,4]{label=\color{1号色}\Alph*.}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

\titleformat{\chapter}[hang]{\bfseries}{
  \filcenter\LARGE\enspace\bfseries}{1pt}{
  \LARGE\bfseries\color{1号色}\filcenter}[]
\def\thesection{\arabic{section}}
\titleformat{\section}[hang]{\bfseries}{
    \Large\bfseries\heiti{\color{1号色}\thesection.}\enspace}{1pt}{%
    \color{1号色}\Large\bfseries\filright}
\titleformat{\subsection}[hang]{\bfseries}{
  \large\bfseries\color{1号色}\thesubsection\enspace}{1pt}{%
  \color{1号色}\large\bfseries\filright}
\titleformat{\subsubsection}[hang]{\bfseries}{
  \large\bfseries\color{1号色}\thesubsubsection\enspace}{1pt}{%
  \color{1号色}\large\bfseries\filright}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%chapter图片定制开始%%%%%%%%%%%%%%%
\def\chapterimage{\gdef\@chapterimage}
\def\@makechapterhead#1{%
	\begin{tikzpicture}[remember picture,overlay]
      \node[scope fading=south,anchor=north,inner sep=0pt,outer sep=0pt] at (current page.north) {\includegraphics[width=\paperwidth]{\@chapterimage}}; % 图片
      \draw [line width=2pt,2号色!40] ($(current page.north west)-(0,3.5/13*\paperwidth)$) -- ($(current page.north east)-(0,3.5/13*\paperwidth)$); % 上线
      \draw [line width=2pt,2号色!40] ($(current page.north west)-(0,4.5/13*\paperwidth)$) -- ($(current page.north east)-(0,4.5/13*\paperwidth)$); % 下线
      \fill [backgroundcolor!40,opacity=0.5] ($(current page.north west)-(0,3.5/13*\paperwidth)$) rectangle +(\paperwidth,-\paperwidth/13); % 中间
      \node at ($(current page.north west)-(-0.5*\paperwidth,4/13*\paperwidth)$) {\ifcsname @chapterfont\endcsname\CJKfamily{chapterfont}\fi\huge\bfseries#1~\color{2号色}\faIcon{feather-alt}}; % 标题
	\end{tikzpicture}\par
  \vspace{3.5\paperwidth/13}
	\thispagestyle{plain}
  \fancypagestyle{plain}{
  \fancyhead{} % 页眉清空
  \renewcommand{\headrule}{} % 首页去页眉线
  }
  \ifdefstring{\LITE@counter}{separate}{
    \setcounter{page}{1}
  }{\relax}
}
\def\@makeschapterhead#1{
  {\parindent \z@ \raggedright
  \normalfont
  \interlinepenalty\@M
    \centering  \ifcsname @chapterfont\endcsname\CJKfamily{chapterfont}\fi  \huge \bfseries  \color{1号色!80!2号色!80!black}  #1\par\nobreak
    \vspace*{1em}
  }
	\thispagestyle{plain}
  \fancypagestyle{plain}{
  \fancyhead{} % 页眉清空
  \renewcommand{\headrule}{} % 首页去页眉线
  }
  \ifdefstring{\LITE@counter}{separate}{
    \setcounter{page}{1}
  }{\relax}
  \setcounter{section}{0}
  \setcounter{prob}{0}
}
%%%%%%%%%%%chapter图片定制结束%%%%%%%%%%%%%%%

\def\watermark#1{\RequirePackage{wallpaper}\CenterWallPaper{0.5}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ulem}
\RequirePackage{fancyhdr}
\RequirePackage{fontawesome5}
\fancyhf{}
\fancyfoot[C]{\color{1号色}\sout{\hbox to 0.4\textwidth{}}\quad\faIcon{chevron-left}\;第~{\sffamily\thepage}\color{1号色}~页\;\faIcon{chevron-right}\quad\sout{\hbox to 0.4\textwidth{}}}
\fancyfoot[L]{\color{1号色}{$\boldsymbol{\cdot}$}}
\fancyfoot[R]{\color{1号色}{$\boldsymbol{\cdot}$}}
\renewcommand{\headrule}{\color{headrulecolor}\hrule width\textwidth}

\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{listings,dirtree}
\lstdefinestyle{TeX}{
    language      =  [LaTeX]TeX,
    texcsstyle    =  *\color{H7},
    numbers       =  none,
    basicstyle    =  {\small\color{H6}\tt},
    mathescape    =  false,
    breaklines    =  true,
    columns       =  fixed,
    keywordstyle  =  \color{H3},
    commentstyle  =  \color{darkgray},
    tabsize       =  2,
    keywords      =  {chapter,choice,problem,solution,enumerate}
}

% document setup
\def\e{\mathrm{e}}
\def\i{\mathrm{i}}
\def\ee#1{\times 10^{#1}}
\def\T{\mathsf{T}}
\def\unit#1{\,\mathrm{#1}}
\def\mat#1{\mathbf{#1}}
\def\rank#1{\text{R}\ab({#1})}
\def\QED{\hfill\sffamily Q.E.D. }
\def\mailto#1{\href{mailto:#1}{\nolinkurl{#1}}}
\def\sokka#1{故本题选择 \textbf{#1} 项.}
\newcommand\length[4]{
\node (a) at ($0.5*($#2+#1$)$) {#3};
\draw [->|] ($0.5*($#2+#1+#4$)$) -- #2; 
\draw [->|] ($0.5*($#2+#1-#4$)$) -- #1;}
\def\point#1{\leavevmode\cleaders\hb@xt@.44em{\hss$\cdot$\hss}\hfill\kern\z@\texttt{(#1pt)}}
\makeatletter
\def\@pkg#1{\texorpdfstring{\href{https://www.ctan.org/pkg/#1}{\textcolor{pkgcolor}{\textsf{#1}}}}{“#1”}}
\def\s@pkg#1{\texorpdfstring{\textcolor{pkgcolor}{\textsf{#1}}}{“#1”}}
\DeclareRobustCommand\pkg{\@ifstar\s@pkg\@pkg}
\def\mode#1{\texorpdfstring{\textcolor{moducolor}{\textsf{#1}}}{“#1”}}
\def\cmd#1{\texorpdfstring{\textcolor{cmdcolor}{\textsf{#1}}}{“#1”}}
\def\datechange#1#2{%
  \noindent{\makebox[\textwidth][r]{\color{H7}\rule{1.15\textwidth}{.4pt}}}
  \noindent\makebox[0pt][r]{\makebox[-3em][r]{\small\textbf{\textcolor{H7}{#1}}}\;\;}{\sffamily Update: \ignorespaces#2}}
\protected\def\@titlelogo#1#2{
  \leavevmode@ifvmode
  \lower\dimexpr\f@size\p@*1/10\hbox{\href{#1}{\includegraphics[height={\f@size\p@}]{#2}}}
  }
\protected\def\s@titlelogo#1#2{
  \leavevmode@ifvmode
  \lower\dimexpr\f@size\p@*1/10\hbox{\includegraphics[height={\f@size\p@}]{#1}}
  }
\DeclareRobustCommand\titlelogo{\@ifstar\s@titlelogo\@titlelogo}
\RequirePackage{qrcode}
\qrset{link, height=4em}
\renewcommand*{\date}[8]{
  \vspace{-0.5em}
  \begin{minipage}{0.64\textwidth}
    \begin{multicols}{2}
      \textbf{考试时间}：\kaishu #1
  
      \textbf{\songti 课程编号}：\kaishu #3

      \textbf{\songti 任课教师}：\kaishu #2
      
      \textbf{\songti 解析制作}：\kaishu #4
    \end{multicols}
  \end{minipage}
  \hfill
  \begin{minipage}{0.15\textwidth}
    \centering
      \qrcode{#5}

      \vskip1ex\scriptsize\textbf{\href{#5}{#6}}
  \end{minipage}
  \hfill
  \begin{minipage}{0.15\textwidth}
    \centering
      \qrcode{#7}

      \vskip1ex\scriptsize\textbf{\href{#7}{#8}}
  \end{minipage}
  \vspace{-0.5em}
}
\makeatother
\setmainfont{Libertinus Serif}
\setsansfont{Libertinus Sans}
\setmonofont{NotoSansMono}[
  Scale=MatchLowercase,
  Extension=.ttf,
  UprightFont=*-Light,
  BoldFont=*-Medium
]