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
%% Thanks https://github.com/ElegantLaTeX/ElegantBook                                                         *
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

\DeclareStringOption[separate]{counter}
\DeclareVoidOption{separate}{\ekv{counter=separate}}
\DeclareVoidOption{continuous}{\ekv{counter=continuous}}

\DeclareStringOption{math}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}

% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
% \ProcessOptions*\relax
\LoadClass[a4paper,oneside]{book}

\RequirePackage{extarrows}% 长等号
\RequirePackage{fixdif,derivative}% 微分算子修复
\RequirePackage{physics2}
\usephysicsmodule{ab,ab.legacy,braket,nabla.legacy}
\RequirePackage{qrcode}
\qrset{link, height=4em}

\RequirePackage[e]{esvect}% 矢量箭头
\RequirePackage{setspace}
\RequirePackage{bbm}% 花体字
\RequirePackage{dutchcal}% 花体字2
\RequirePackage{mathrsfs}% 花体字3
\RequirePackage{csquotes}% 引号
\RequirePackage{tasks}% 选择题
\settasks{label=\color{normalcolor}\Alph*.}

\RequirePackage[colorlinks, linkcolor=1号色, urlcolor=1号色]{hyperref}

\RequirePackage[letterpaper,margin=0.75in,headheight=0.25in,headsep=0.2in,footskip=0.2in]{geometry}

\RequirePackage{indentfirst,comment}
% fontsetting
\ifdefstring{\LITE@math}{mtpro2}{
  \let\Bbbk\relax
  \RequirePackage[lite]{mtpro2}
}{\relax}

\RequirePackage[UTF8,scheme=plain]{ctex}
\def\chapterfont#1{
  \setCJKfamilyfont{chapterfont}{#1}[Extension =.ttf]
  \gdef\@chapterfont{#1}
}

\setcounter{tocdepth}{1}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}

%%%% 文本中的数字/字母设置 %%%
\RequirePackage[no-math]{fontspec}
\setmainfont{Libertinus Serif}
\setsansfont{Libertinus Sans}
\setmonofont{NotoSansMono}[
  Scale=MatchLowercase,
  Extension=.ttf,
  UprightFont=*-Light,
  BoldFont=*-Medium
]


\AfterEndPreamble{
  \setlength\parindent{2\ccwd}}

%% 章节以及页脚图形
\RequirePackage{xcolor}
\RequirePackage{silence}

  \definecolor{backgroundcolor}{HTML}{F8F7E9}
  \definecolor{headrulecolor}{HTML}{640125}
  \pagecolor{backgroundcolor!20}
  \definecolor{1号色}{HTML}{4D5AAF} %
  \definecolor{2号色}{HTML}{006E54} %

  \ifdefstring{\LITE@answer}{ans}{
  \definecolor{solutioncolor}{HTML}{0F2350} %
  \newcommand{\solutionname}{\faIcon{check-square} 分析与解}
}{\relax}
\ifdefstring{\LITE@answer}{noans}{
  \definecolor{solutioncolor}{HTML}{FEFEFB} %
  \definecolor{solutionbg}{RGB}{130,73,71} %
  \newcommand{\solutionname}{\faIcon{ban} 答案隐藏}
}{\relax}

  \definecolor{normalcolor}{HTML}{000000} %

% ----- box -----
%% 章节设置
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}

\newcommand{\notename}{\faIcon{snowflake} 注意}
\renewcommand*{\proofname}{证明}
\newcommand{\problemname}{\faIcon{pen-square} 题目} % 题目=习题

\newcommand{\remarkname}{注}
\renewcommand*{\date}[8]{
  \vspace{-0.5em}\color{normalcolor}
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
      #5

      \vskip1ex\scriptsize\textbf{#6}
  \end{minipage}
  \hfill
  \begin{minipage}{0.15\textwidth}
    \centering
      #7

      \vskip1ex\scriptsize\textbf{#8}
  \end{minipage}
  \vspace{-0.5em}
}

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
      title=\bfseries\color{2号色}{\problemname}\theprob\hfill【\quad\color{solutioncolor} #1 \color{2号色}\quad 】,
      coltitle=2号色,
      colupper=normalcolor,
      collower=normalcolor
    ]
  }{
    \begin{tcolorbox}[
      common,
      borderline west={1.5pt}{0mm}{2号色},
      title=\bfseries\color{2号色}{\problemname}\theprob\hfill\color{2号色}\faIcon{tag}~#2\qquad【\quad\color{solutioncolor} #1 \color{2号色}\quad 】,
      coltitle=2号色,
      colupper=normalcolor,
      collower=normalcolor
    ]
  }
  \rmfamily\color{normalcolor}}{\end{tcolorbox}}  

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
        colupper=normalcolor,
        collower=normalcolor
      ]
    }{
      \begin{tcolorbox}[
        common,
        borderline west={1.5pt}{0mm}{2号色},
        title=\color{2号色}{\problemname} \theprob\tagname~#2,
        coltitle=2号色,
        colupper=normalcolor,
        collower=normalcolor
      ]
    }
  }{
    \IfNoValueTF{#2}{
      \begin{tcolorbox}[
        common,
        borderline west={1.5pt}{0mm}{2号色},
        title=\color{2号色}{\problemname} \theprob（本题#3分）,
        coltitle=2号色,
        colupper=normalcolor,
        collower=normalcolor
      ]
    }{
      \begin{tcolorbox}[
        common,
        borderline west={1.5pt}{0mm}{2号色},
        title=\color{2号色}{\problemname} \theprob（本题#3分）\tagname~#2,
        coltitle=2号色,
        colupper=normalcolor,
        collower=normalcolor
      ]
    }
  }
  \rmfamily\color{normalcolor}}{\end{tcolorbox}}

\newcommand{\noting}[1]{
  \begin{tcolorbox}[
    common,
    borderline west={1.5pt}{0mm}{orange},
    coltitle=orange,
    ]%
    {\textbf{\color{orange}\notename}}
  \kaishu\color{normalcolor}#1\end{tcolorbox}}

\newenvironment{note}{
  \begin{tcolorbox}[
    common,
    borderline west={1.5pt}{0mm}{orange},
    title=\textbf{\color{orange}\notename},
    coltitle=2号色,
  ]
  \kaishu\color{normalcolor}}{\end{tcolorbox}}

\definecolor{second}{RGB}{226,106,106} %
\newenvironment{proof}{
  \par\noindent\bfseries\songti{\color{second}\proofname\;}
  \color{black!90}\fangsong}{
  \hfill\ensuremath{\square}
  \par}

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
\RequirePackage{bm}% 数学加粗
\RequirePackage{pdfpages}
\RequirePackage{esint}% 面积分
\RequirePackage{wrapstuff}% 图文绕排
\RequirePackage{booktabs}
\RequirePackage{paracol}
\columnratio{0.67}
\RequirePackage{multicol,multirow}

\RequirePackage{fancyvrb}
%%中文结构名字

%绘图
\RequirePackage{tikz} %% load tikz without tikz
\usetikzlibrary{intersections,decorations.markings,spy,arrows,shapes,fadings,mindmap,shapes.arrows,shapes.symbols,tikzmark,shapes.geometric,graphs,decorations.pathmorphing,through,arrows.meta,shapes.misc,decorations.shapes,angles,backgrounds,calc,math,decorations,decorations.pathreplacing,fit,quotes,shadows,positioning,patterns,shadings}
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
      \fill [fill=backgroundcolor,opacity=0.2] (current page.north west) rectangle +(\paperwidth,-\paperwidth/13*6);
      \node[scope fading=south,anchor=north,inner sep=0pt] at (current page.north) {\includegraphics[width=\paperwidth]{\@chapterimage}};
      \draw [line width=2pt,2号色!40] ($(current page.north west)-(0,3.5/13*\paperwidth)$) -- ($(current page.north east)-(0,3.5/13*\paperwidth)$);
      \draw [line width=2pt,2号色!40] ($(current page.north west)-(0,4.5/13*\paperwidth)$) -- ($(current page.north east)-(0,4.5/13*\paperwidth)$);
      \fill [backgroundcolor!40,opacity=0.5] ($(current page.north west)-(0,3.5/13*\paperwidth)$) rectangle +(\paperwidth,-\paperwidth/13);
      \node at ($(current page.north west)-(-0.5*\paperwidth,4/13*\paperwidth)$) {\ifcsname @chapterfont\endcsname\CJKfamily{chapterfont}\fi\huge\bfseries\color{normalcolor}#1~\color{2号色}\faIcon{feather-alt}};
	\end{tikzpicture}\par
  \vspace{3.5\paperwidth/13}
	\thispagestyle{plain}
  \fancypagestyle{plain}{
  \fancyhead{} % 页眉清空
  \def\headrulewidth{0pt} % 去页眉线
  }
  \ifdefstring{\LITE@counter}{separate}{
    \setcounter{page}{1}
  }{\relax}
}
\def\@makeschapterhead#1{
  \centering
  \ifcsname @chapterfont\endcsname\CJKfamily{chapterfont}\fi\huge\bfseries\color{normalcolor}#1\normalsize
  \thispagestyle{plain}
  \fancypagestyle{plain}{
  \fancyhead{} % 页眉清空
  \def\headrulewidth{0pt} % 去页眉线
  }
  \ifdefstring{\LITE@counter}{separate}{
    \setcounter{page}{1}
  }{\relax}
}
%%%%%%%%%%%chapter图片定制结束%%%%%%%%%%%%%%%

\newcommand{\watermark}[1]{\RequirePackage{wallpaper}\CenterWallPaper{0.5}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ulem}
\RequirePackage{fancyhdr}
\RequirePackage{fontawesome5}

\fancyhf{}

\fancyfoot[C]{\color{1号色}\sout{\hbox to 0.4\textwidth{}}\quad\faIcon{chevron-left}\;第~\color{normalcolor}{\sffamily\thepage}\color{1号色}~页\;\faIcon{chevron-right}\quad\sout{\hbox to 0.4\textwidth{}}}
\fancyfoot[L]{\color{1号色}{$\boldsymbol{\cdot}$}}
\fancyfoot[R]{\color{1号色}{$\boldsymbol{\cdot}$}}

\renewcommand{\headrule}{\color{headrulecolor}\hrule width\textwidth}
\pagestyle{fancy}

\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%[第三方定制]%%%%%%%%%%%%%%%%%%%%%
\def\e{\mathrm{e}}
\def\i{\mathrm{i}}
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}
\newcommand\sokka[1]{故本题选择 \textbf{#1} 项.}
\newcommand\ans[1]{\underline{\color{solutioncolor}\ #1\ }}
\newcommand\length[4]{
\node (a) at ($0.5*($#2+#1$)$) {#3};
\draw [->|] ($0.5*($#2+#1+#4$)$) -- #2; 
\draw [->|] ($0.5*($#2+#1-#4$)$) -- #1;}
\newcommand\cdotfill{\leavevmode\cleaders\hb@xt@.44em{\hss$\cdot$\hss}\hfill\kern\z@}
\newcommand{\point}[1]{\cdotfill\texttt{(#1pt)}}
\setstretch{1.5}
\AtBeginDocument{\everymath{\displaystyle}}

\makeatletter 
\protected\def\titlelogo#1#2{
  \leavevmode@ifvmode
  \lower\dimexpr\f@size\p@*1/10\hbox{\href{#1}{\includegraphics[height={\f@size\p@}]{#2}}}
  }
\makeatother

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