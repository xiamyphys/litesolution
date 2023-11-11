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
\ProvidesClass{litesolution}[11/11/2023 v1.0a LiteSolution document class]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=LITE, prefix=LITE@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{LITE}{#1}}
% ---- 全局选项
\DeclareStringOption[ans]{answer}
\DeclareVoidOption{ans}{\ekv{answer=ans}}
\DeclareVoidOption{noans}{\ekv{answer=noans}}

\DeclareStringOption[light]{appearence}
\DeclareVoidOption{light}{\ekv{appearence=light}}
\DeclareVoidOption{dark}{\ekv{appearence=dark}}

\DeclareStringOption[separate]{counter}
\DeclareVoidOption{separate}{\ekv{counter=separate}}
\DeclareVoidOption{continuous}{\ekv{counter=continuous}}

\DeclareStringOption{math}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}

\DeclareStringOption[onecol]{toc}
\DeclareVoidOption{onecol}{\ekv{toc=onecol}}
\DeclareVoidOption{twocol}{\ekv{toc=twocol}}

\DeclareStringOption[hang]{titlestyle}[hang]
\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}
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
\RequirePackage{arydshln}% 分块矩阵


\RequirePackage[colorlinks, linkcolor=1号色, urlcolor=1号色]{hyperref}

\RequirePackage[letterpaper,margin=0.75in,headheight=0.25in,headsep=0.2in,footskip=0.2in]{geometry}

\RequirePackage{indentfirst,comment}
% fontsetting
\ifdefstring{\LITE@math}{mtpro2}{
  \let\Bbbk\relax
  \RequirePackage[lite]{mtpro2}
}{\relax}

\RequirePackage[UTF8,scheme=plain]{ctex}
  \setCJKfamilyfont{zhbs}{FZXiaoBiaoSong-B05S}[Extension =.ttf]
  \newcommand*{\biaosong}{\CJKfamily{zhbs}}{\relax}
  \setCJKfamilyfont{zhlx}{HDU}[Extension =.ttf]
  \newcommand*{\luxun}{\CJKfamily{zhlx}}{\relax}

\setcounter{tocdepth}{1}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}

%%%% 文本中的数字/字母设置 %%%
\RequirePackage{iftex}
\ifXeTeX
  \RequirePackage[no-math]{fontspec}
  \setmainfont{texgyretermes}[
    UprightFont = *-regular ,
    BoldFont = *-bold ,
    ItalicFont = *-italic ,
    BoldItalicFont = *-bolditalic ,
    Extension = .otf ,
    Scale = 1.0]
    
  \setsansfont{texgyreheros}[
    UprightFont = *-regular ,
    BoldFont = *-bold ,
    ItalicFont = *-italic ,
    BoldItalicFont = *-bolditalic ,
    Extension = .otf ,
    Scale = 0.9]
\else
  \RequirePackage{newtxtext}
  \RequirePackage[scaled=.90]{helvet}
\fi


\AfterEndPreamble{
  \setlength\parindent{2\ccwd}}

%% 章节以及页脚图形
\RequirePackage{xcolor}
\RequirePackage{jpcolours}
\RequirePackage{silence}

\ifdefstring{\LITE@appearence}{light}{
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
}{\relax}

\ifdefstring{\LITE@appearence}{dark}{
  \definecolor{backgroundcolor}{HTML}{2C2C2E}
  \definecolor{headrulecolor}{HTML}{C0A2C7}
  \pagecolor{backgroundcolor}
  \definecolor{1号色}{HTML}{DBD0E6} %
  \definecolor{2号色}{HTML}{D6E9CA} %

  \ifdefstring{\LITE@answer}{ans}{
  \definecolor{solutioncolor}{HTML}{E2E8F6} %
  \newcommand{\solutionname}{\faIcon{check-square} 分析与解}
}{\relax}
\ifdefstring{\LITE@answer}{noans}{
  \definecolor{solutioncolor}{HTML}{2B2A28} %
  \definecolor{solutionbg}{RGB}{130,73,71} %
  \newcommand{\solutionname}{\faIcon{ban} 答案隐藏}
}{\relax}

  \definecolor{normalcolor}{HTML}{EAE5E3} %
}{\relax}

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
  
\newcommand{\solute}[1]{
  \begin{tcolorbox}[
    common,
    borderline west={1.5pt}{0mm}{1号色},
    coltitle=1号色,
    ]%
    \textcolor{1号色}{\textbf{\solutionname}}
  \kaishu\color{solutioncolor}#1\end{tcolorbox}}

\newenvironment{solution}{
  \begin{tcolorbox}[
    common,
    borderline west={1.5pt}{0mm}{1号色},
    title=\textcolor{1号色}{\textbf{\solutionname}},
    coltitle=1号色,
    colupper=solutioncolor,
    collower=solutioncolor
    ]%
  \kaishu\color{solutioncolor}}{\end{tcolorbox}}

\newenvironment{translation}{
  \begin{tcolorbox}[
    common,
    borderline west={1.5pt}{0mm}{2号色!80},
    title=\color{2号色!80}Translation,
    bottomtitle=.75\baselineskip,
    coltitle=2号色!80,
  ]
  \rmfamily\color{normalcolor!80}}{\end{tcolorbox}}


% ----- Title Style -----
\ifdefstring{\LITE@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\LITE@titlestyle}{display}{\def\style{display}}{\relax}

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

\titleformat{\chapter}[\style]{\bfseries}{
  \filcenter\LARGE\enspace\bfseries{\color{1号色}{\chaptername~}}}{1pt}{
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
      \fill [fill=backgroundcolor,opacity=0.2] (current page.north west) rectangle +(\paperwidth,-\paperwidth/13*6);
      \node[scope fading=south,anchor=north,inner sep=0pt] at (current page.north) {\includegraphics[width=\paperwidth]{\@chapterimage}};
      \draw [line width=2pt,2号色!40] ($(current page.north west)-(0,3.5/13*\paperwidth)$) --++ (\paperwidth,0);
      \draw [line width=2pt,2号色!40] ($(current page.north west)-(0,4.5/13*\paperwidth)$) --++ (\paperwidth,0);
      \fill [backgroundcolor!40,opacity=0.5] ($(current page.north west)-(0,3.5/13*\paperwidth)$) rectangle +(\paperwidth,-\paperwidth/13);
      \node at ($(current page.north west)-(-0.5*\paperwidth,4/13*\paperwidth)$) {\biaosong\huge\color{2号色}\faIcon{leaf}\bfseries\color{normalcolor}~#1};
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

%% 代码框 %%
\RequirePackage{listings}
\lstdefinestyle{Matlab}{
    language        =   Matlab, % 语言选Matlab
    frame           =   none,
    basicstyle      =   {\small\color{white}\tt},
    mathescape,
    emphstyle       =   {\small\bfseries\color{white}},
    numbers         =   none,
    stepnumber      =   2,
    numbersep       =   3em,
    numberstyle     =   \small\ttfamily\bfseries\tiny,
    keywordstyle    =   \small\ttfamily\bfseries\color{orange},
    stringstyle     =   \small\ttfamily\bfseries\color{white},
    breaklines      =   true,   % 自动换行，
    columns         =   fixed,  % 字间距就不固定很丑，必须加
    basewidth       =   .5em,
    commentstyle    =   \small\ttfamily\bfseries\color{cyan!40},
    backgroundcolor =   \color{macosbox@bgdark},
    tabsize         =   4,
    showspaces      =   false,
    showstringspaces=   false,
    morekeywords    =   {Out,In,maketitle,pip,matplotlib,pandas,numpy,np,dtype},
}
\lstdefinestyle{TeX}{
    language        =   [LaTeX]TeX,
    texcsstyle      =   *\color{orange},
    numbers         =   none,
    basicstyle      =   {\small\color{white}\tt},
    mathescape      =   false,
    breaklines      =   true,   % 自动换行，
    columns         =   fixed,  % 字间距就不固定很丑，必须加
    keywordstyle    =   \color{orange},
    commentstyle    =   \color{gray},
    emphstyle       =   {\small\bfseries\color{white}},
    tabsize         =   2,
    rulecolor       =   \color{1号色},
}
\definecolor{macosbox@bgdark}{RGB}{30,30,30}
\definecolor{macosbox@titledark}{RGB}{61,62,64}
\definecolor{macosbox@linedark}{RGB}{116,116,118}
\newtcolorbox{macboxd}[2][]{%
  top              =   -.5em,
  bottom           =   -.5em,
  arc              =   5pt,
  enhanced,
  colupper         =   white,
  coltitle         =   white,
  colback          =   macosbox@bgdark,
  boxrule          =   0.5pt,
  frame style      =   {
  draw             =   macosbox@linedark,
  fill             =   macosbox@bgdark},
  title style      =   {
  color            =   macosbox@titledark},
  drop fuzzy shadow=   darkgray,
  title            =   {\hspace{-1em}
  \textcolor[RGB]{220,105,98}{\scriptsize\faIcon{circle}}\ \ 
  \textcolor[RGB]{244,191,79}{\scriptsize\faIcon{circle}}\ \ 
  \textcolor[RGB]{97, 197,84}{\scriptsize\faIcon{circle}}\rightline{#2\hspace{0.5\textwidth}}},#1
}

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
\newcommand{\hdu}{\luxun\Huge{~杭\hspace{-0.35em} 州\hspace{-0.25em} 电\hspace{-0.5em} 子\hspace{-0.55em} 科\hspace{-0.45em} 技\hspace{-0.55em} 大\hspace{-0.5em} 学~}\biaosong\huge}
\setstretch{1.5}
\everymath{\displaystyle}% 行间公式