%%%%%%%%%%%%%%%%%%%%%%
%% start of file `litesolution.cls'.
%% 
%% Copyright 2013-2022 ElegantLaTeX (elegantlatex2e@gmail.com)
%% Copyright 2022-2023 LiteSolution (xiamyphys@gmail.com)
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook [采用ElegantBook系列模板内核]
%% available at https://github.com/sxiamyphy/LiteSolution.git
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{litesolution}[2023/06/18 v5.0-alpha LiteSolution document class]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=LITE, prefix=LITE@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{LITE}{#1}}
% ---- 全局选项
\DeclareStringOption[ans]{answer}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[cm]{math}
\DeclareStringOption[marginfalse]{marginpar}
\DeclareStringOption[onecol]{toc}
\DeclareStringOption{scheme}
\DeclareStringOption[normal]{device}
\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}
\DeclareStringOption[seperate]{counter}
\DeclareVoidOption{seperate}{\ekv{counter=separate}}
\DeclareVoidOption{continuous}{\ekv{counter=continuous}}
\DeclareVoidOption{chinese}{\ekv{scheme=chinese}}

\DeclareStringOption[ctexfont]{chinesefont}
\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{nofont}{\ekv{chinesefont=nofont}}

\DeclareVoidOption{noans}{\ekv{answer=noans}}

\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}


\DeclareStringOption[numeric-comp]{citestyle}
\DeclareStringOption[numeric]{bibstyle}

\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}
\DeclareVoidOption{cm}{\ekv{math=cm}}

\DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}


\DeclareVoidOption{onecol}{\ekv{toc=onecol}}
\DeclareVoidOption{twocol}{\ekv{toc=twocol}}

\DeclareStringOption[chapter]{thmcnt}
\DeclareVoidOption{chapter}{\ekv{thmcnt=chapter}}
\DeclareVoidOption{section}{\ekv{thmcnt=section}}


% ----- Math option -----
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% ----- Title Style -----
\DeclareStringOption[hang]{titlestyle}[hang]
% ----- backward compatibility
\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}
% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessKeyvalOptions*\relax
% \ProcessOptions*\relax
\LoadClass[a4paper,oneside]{book}

\everymath{\displaystyle}% 行间公式
\RequirePackage{extarrows}% 长等号
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{fixdif,derivative}% 微分算子修复
\RequirePackage{physics2}
\usephysicsmodule{ab} % 不用qty啦！
\usephysicsmodule{ab.legacy}
\usephysicsmodule{ab,ab.braket}

\RequirePackage{esvect}% 矢量箭头
\RequirePackage{setspace}
\RequirePackage{bbm}% 花体字
\RequirePackage{dutchcal}% 花体字2
\RequirePackage{mathrsfs}% 花体字3
\RequirePackage{csquotes}% 引号
\RequirePackage{tasks}% 选择题
\settasks{label=\Alph *.,}
\RequirePackage{arydshln}% 分块矩阵
% \RequirePackage{pmat}


\RequirePackage[colorlinks, linkcolor=structurecolor, urlcolor=structurecolor]{hyperref}

%% device settings
\RequirePackage{geometry}
\ifdefstring{\LITE@device}{normal}{
\geometry{
  paperwidth=21.590cm, 
  paperheight=28.787cm,
  top=21.2mm, 
  bottom=21.2mm, 
  left=1.91cm, 
  right=1.91cm, 
  headheight=1.81cm, 
  headsep=3.3mm, 
  footskip=4.71mm
}}{\relax}
\ifdefstring{\LITE@device}{pad}{
\geometry{
  paperwidth=7.5in, 
  paperheight=10.74in,
  margin=17.18mm,
  headheight=2.33cm,
  footskip=4mm
}}{\relax}


\RequirePackage{indentfirst,comment}
% fontsetting
\ifdefstring{\LITE@math}{mtpro2}{
  \let\Bbbk\relax
  \RequirePackage[lite]{mtpro2}
}{\relax}


\setcounter{tocdepth}{1}
\renewcommand{\baselinestretch}{1.2}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage{iftex}

%%%% 文本中的数字/字母设置 %%%
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

\ifdefstring{\LITE@chinesefont}{founder}{
  \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
  \setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
  \setCJKsansfont[BoldFont={FZHei-B01}]{FZKai-Z03}
  \setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
  \setCJKfamilyfont{zhsong}{FZShuSong-Z01}
  \setCJKfamilyfont{zhhei}{FZHei-B01}
  \setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
  \setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
  \newcommand*{\songti}{\CJKfamily{zhsong}}
  \newcommand*{\heiti}{\CJKfamily{zhhei}}
  \newcommand*{\kaishu}{\CJKfamily{zhkai}}
  \newcommand*{\fangsong}{\CJKfamily{zhfs}}{\relax}}

\ifdefstring{\LITE@chinesefont}{nofont}{
  \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}}{\relax}

\ifdefstring{\LITE@chinesefont}{ctexfont}{
  \RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}

\AfterEndPreamble{
  \setlength\parindent{2\ccwd}}

%% 章节以及页脚图形
\RequirePackage[table]{xcolor}
% \RequirePackage{background}
\RequirePackage{silence}
\RequirePackage{mwe}
% \newcommand{\logo}[1]{\gdef\@logo{#1}}
% \ifcsname @logo\endcsname\backgroundsetup{scale=0.75,angle=0,opacity=0.08,contents={\includegraphics[width=\paperwidth, height=\paperwidth, keepaspectratio]{\@logo}}}\fi

\definecolor{ocre}{RGB}{146, 218, 243}
\definecolor{geyecolor}{RGB}{249,250,252}%
% \pagecolor{geyecolor}
\definecolor{structurecolor}{RGB}{68,79,173} % 
  \ifdefstring{\LITE@answer}{ans}{
  \definecolor{solutioncolor}{RGB}{0,64,116} %
}{\relax}
\ifdefstring{\LITE@answer}{noans}{
  \definecolor{solutioncolor}{RGB}{249,250,252} %
}{\relax}


% ----- box -----

% ----- Title Style -----
\ifdefstring{\LITE@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\LITE@titlestyle}{display}{\def\style{display}}{\relax}

\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}


\RequirePackage{enumerate}
% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}

\RequirePackage[labelfont={bf,color=structurecolor}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
  \RequirePackage[flushmargin,stable]{footmisc}
  \setlength{\footnotesep}{12pt}
}



\RequirePackage{graphicx}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}
\RequirePackage{booktabs}
\RequirePackage{multicol,multirow}

\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,hologo}
%%中文结构名字


%% 章节设置
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}

\renewcommand{\baselinestretch}{1.3}
\newcommand{\notename}{ノート}
\renewcommand*{\proofname}{证明}
\newcommand{\exercisename}{题目} % 题目=习题
\newcommand{\remarkname}{注}
\newcommand{\analysisname}{分析}
\newcommand{\solutionname}{解答}
\newcommand{\solutionstname}{解法一}
\newcommand{\solutionndname}{解法二}
\renewcommand*{\date}[4]{
  \begin{multicols}{2}
    \textbf{考试形式}：#1

    \textbf{考试时间}：#2

    \textbf{课程编号}：#3
    
    \textbf{任课教师}：#4
  \end{multicols}
  }


\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{tikz} %% load tikz without tikz
\usetikzlibrary{hobby,intersections, decorations.markings,spy,arrows,shapes,fadings,trees,mindmap,shapes.arrows,shapes.symbols,tikzmark,shapes.geometric,graphs,decorations.pathmorphing,through,arrows.meta,shapes.misc,decorations.shapes, angles,backgrounds,calc,math,decorations,decorations.pathreplacing,fit,quotes,shadows,positioning,patterns,shadings}
\tikzset{>=stealth}

\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=structurecolor,draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=structurecolor,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=structurecolor,draw=none] circle (2pt);}
\setlist[enumerate,1]{label=\color{structurecolor}\arabic*.}
\setlist[enumerate,2]{label=\color{structurecolor}(\alph*).}
\setlist[enumerate,3]{label=\color{structurecolor}\Roman*.}
\setlist[enumerate,4]{label=\color{structurecolor}\Alph*.}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

\RequirePackage{apptools}

\newcommand{\xchaptertitle}{\chaptername~}

\setcounter{secnumdepth}{5}
\titleformat{\chapter}[\style]{\bfseries}{
  \filcenter\LARGE\enspace\bfseries{\color{structurecolor}{\xchaptertitle\;}}}{1pt}{
  \LARGE\bfseries\color{structurecolor}\filcenter}[]

\titleformat{\section}[hang]{\bfseries}{
    \Large\bfseries\heiti{\color{structurecolor}\faChain ~}\enspace}{1pt}{%
    \color{structurecolor}\Large\bfseries\filright}
\titleformat{\subsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}
\titleformat{\subsubsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%chapter图片定制开始%%%%%%%%%%%%%%%
\newif\ifusechapterimage
\usechapterimagetrue
\newcommand{\thechapterimage}{}%
\newcommand{\chapterimage}[1]{\ifusechapterimage\renewcommand{\thechapterimage}{#1}\fi}%
\def\@makechapterhead#1{%
	{\parindent \z@ \raggedright \kaishu
		\begin{tikzpicture}[remember picture,overlay]
			\node at (current page.north west)
			{\begin{tikzpicture}[remember picture,overlay]
					\node[scope fading=south,anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{\thechapterimage}};
					\draw (\Gm@lmargin+0.5\paperwidth-1.91cm,-9cm) node [line width=2pt,,draw=ocre,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[\paperwidth]{}};
					\draw (\Gm@lmargin+0.5\paperwidth-1.91cm,-9cm) node {\huge\kaishu\bfseries\color{black}\color{teal}\faLeaf\;\color{black}~#1\strut};
			\end{tikzpicture}};
		\end{tikzpicture}
		\par\vspace*{230\p@}}
	\thispagestyle{empty}
  \ifdefstring{\LITE@counter}{separate}{
    \setcounter{page}{1}
  }{\relax}
	}
%%%%%%%%%%%chapter图片定制结束%%%%%%%%%%%%%%%

\RequirePackage[most]{tcolorbox}
\newcounter{exer}[chapter]
\setcounter{exer}{1}
\renewcommand{\theexer}{\arabic{exer}}

\newenvironment{choice}[3][]{
  \refstepcounter{exer}
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{teal},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    title=\textbf{\color{teal}{\exercisename} \theexer #1\ }\hfill\color{structurecolor}\faTag #3\color{teal}\qquad【\quad\color{solutioncolor} #2 \color{teal}\quad 】,
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \rmfamily}{\end{tcolorbox}}  

\newenvironment{exercise}[3][]{
  \refstepcounter{exer}
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{teal},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    title=\color{teal}{\exercisename} \theexer #1\ （本题#2分）\hfill\color{structurecolor}\faTag #3,
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \rmfamily}{\end{tcolorbox}}
\newenvironment{exercising}{
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{teal},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \kaishu}{\end{tcolorbox}}

\newenvironment{note}{
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{orange},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    title=\noindent{\scriptsize\color{red!90}\textdbend\quad}
    \textbf{\color{second}\notename},
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \kaishu}{\end{tcolorbox}}

\definecolor{second}{RGB}{226,106,106} %
\newenvironment{proof}{
  \par\noindent\bfseries\songti{\color{second}\proofname\;}
  \color{black!90}\fangsong}{
  \hfill\ensuremath{\square}
  \par}

\newenvironment{analysis}{
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{teal},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    title=\color{teal}\analysisname,
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \kaishu\color{solutioncolor}}{\end{tcolorbox}}

\newenvironment{analysising}{
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{teal},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \kaishu\color{solutioncolor}}{\end{tcolorbox}}  
\newenvironment{solution}{
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{teal},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    title=\color{teal}\solutionname,
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \kaishu\color{solutioncolor}}{\end{tcolorbox}}
\newenvironment{soluting}{
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{teal},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \kaishu\color{solutioncolor}}{\end{tcolorbox}}  
\newenvironment{solutionst}{
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{teal},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    title=\color{teal}\solutionstname,
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \kaishu\color{solutioncolor}}{\end{tcolorbox}}
\newenvironment{solutionnd}{
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{teal},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    title=\color{teal}\solutionndname,
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \kaishu\color{solutioncolor}}{\end{tcolorbox}}
\newenvironment{translation}{
  \begin{tcolorbox}[
    blanker,
    borderline west={1.5pt}{3mm}{teal},
    left=6mm,
    toprule=.3em,
    bottomrule=.3em,
    title=\color{structurecolor}Translation,
    bottomtitle=.75\baselineskip,
    coltitle=teal,
    fonttitle=\bfseries
  ]
  \rmfamily}{\end{tcolorbox}}
\newenvironment{remark}{\noindent\textbf{\color{second}\remarkname}}{\par}

%页眉页脚

%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ulem}
\RequirePackage{fancyhdr}
\RequirePackage{fontawesome}
\RequirePackage{pifont,manfnt,bbding}
\RequirePackage{xhfill}
\fancyhf{}


% \fancypagestyle{plain}{
% \fancyhead{} % 页眉清空
% \renewcommand{\headrulewidth}{0pt} % 去页眉线
% \fancyfoot{} % 页脚清空
% \fancyfoot[R]{\thepage} % 将页码设置在右页脚
% }

\fancyfoot[C]{\color{structurecolor}\sout{\hbox to 0.4\textwidth{}}\quad\faChevronLeft\;第~\color{black}{\thepage}\color{structurecolor}~页\;\faChevronRight\quad\sout{\hbox to 0.4\textwidth{}}}
\fancyhead[R]{\color{structurecolor}\kaishu\rightmark}
\fancyhead[L]{\color{structurecolor}{\faTree}\;\kaishu\leftmark} 
\fancyfoot[L]{\color{structurecolor}{$\boldsymbol{\cdot}$}}
\fancyfoot[R]{\color{structurecolor}{$\boldsymbol{\cdot}$}}
\renewcommand{\headrule}{\color{violet!90}\hrule width\textwidth}
\pagestyle{fancy}
\fancypagestyle{plain}{\pagestyle{fancy}}

\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%[第三方定制]%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{varwidth,multicol}
% \usepackage[os=mac,hyperrefcolorlinks]{menukeys}
\newcommand{\ee}{\mathrm{e}}
\newcommand{\ii}{\mathrm{i}}
\newcommand\sokka[1]{故本题选择 \textbf{#1} 项.}
\newcommand\ans[1]{\underline{\color{solutioncolor} #1 }}
\newcommand\length[3]{\node (a) at (0, 1) {#3};
\coordinate (b) at #2;
\coordinate (c) at #1;
\path[->]   (a) edge (b) 
            (a) edge (c);}


\RequirePackage{listings}
% \lstset{
%     language=TeX,
%     numbers=left, 
%     numberstyle= \tiny, 
%     keywordstyle= \color{ blue!70},
%     commentstyle= \color{red!50!green!50!blue!50}, 
%     frame=shadowbox, % 阴影效果
%     rulesepcolor= \color{ red!20!green!20!blue!20} ,
%     escapeinside=``, % 英文分号中可写入中文
%     xleftmargin=2em,xrightmargin=2em, aboveskip=1em,
%     framexleftmargin=2em
% } 
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle,breaklines=true}


\newcommand\bmmax{0}
\RequirePackage{bm}% 数学加粗
\RequirePackage{pdfpages}
\RequirePackage{esint}
\RequirePackage{wrapfig}% 图文绕排