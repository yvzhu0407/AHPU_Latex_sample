% !Mode:: "TeX:UTF-8"
%%%%% 'ahputhesis.cls' BEGIN

%%%%%%%%%% class clarification %%%%%%%%%%
% 模板声明

\NeedsTeXFormat{LaTeX2e}[2019/08/15]
\ProvidesClass{ahputhesis}[2019/08/15 v0.1 The LaTeX template for thesis of AHPU]
\typeout{Document Class `ahputhesis' v0.1 by YUZHU(2019/08)}

% 其余选项传递给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% 引用ctexbook及基本设置
\LoadClass{ctexbook}[2019/08/15]

%%%%%%%%%% global package %%%%%%%%%%
% 全局通用宏包

\RequirePackage{ifthen}

%%%%%%%%%% font %%%%%%%%%%
% 数学相关和字体设置

\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{txfonts}

% 主要字体为Times New Roman和宋体
% 模板某些标题需要华文行楷和32号字
\setmainfont{Times New Roman}

%%%%%%%%%% page margin %%%%%%%%%%
% 页面边距

\RequirePackage[top=3cm,bottom=2.5cm,left=3cm,right=2cm]{geometry}

 %%%%%%%%%% space %%%%%%%%%%
% 其他间距

\renewcommand{\baselinestretch}{1}%行间距
\setlength{\parindent}{2em}
\setlength{\floatsep}{3pt plus 3pt minus 2pt}      % 图形之间或图形与正文之间的距离
\setlength{\abovecaptionskip}{10pt plus 1pt minus 1pt} % 图形中的图与标题之间的距离
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt} % 表格中的表与标题之间的距离

%%%%%%%%%% header & footer %%%%%%%%%%
% 页眉页脚

\RequirePackage{fancyhdr}
\fancypagestyle{frontmatter}{
	\fancyhead[CO]{\small{安徽工程大学毕业设计（论文）}}%单页页眉
	\fancyhead[CE]{\small{张玉动：基于Android的模拟炒股APP}}%双页页眉
	\fancyhead[R,L]{}
	\fancyfoot[C]{\thepage}%页脚
	\pagenumbering{Roman}%页码以罗马格式书写
	\renewcommand{\headrulewidth}{0.5bp} % 页眉线宽度
}

\fancypagestyle{mainmatter}{
	\pagestyle{fancy}%此部分设置正文以及附录部分页面风格。
	\fancyhead[CO]{\small{安徽工程大学毕业设计（论文）}}
	\fancyhead[CE]{\small{张玉动：基于Android的模拟炒股APP}}
	\fancyhead[R,L]{}
	\fancyfoot[C]{-\thepage-}
	\pagenumbering{arabic}
	
	\renewcommand{\headrulewidth}{0.5bp} % 页眉线宽度
}

\fancypagestyle{plain}{
    \pagestyle{fancy}
}

%%%%%%%%%% title %%%%%%%%%%
% 标题

% 汉化
%目录与其内容加一行空行，目录二字中空一字符
\renewcommand{\contentsname}{\zihao{-3}\bfseries{\hfill 目~~~录 \hspace*{\fill}\newline}}
\renewcommand\listfigurename{\songti\zihao{-4}\bfseries{\hfill 插图目录 \hspace*{\fill}\newline}}
\renewcommand\listtablename{\songti\zihao{-4}\bfseries{\hfill 表格目录 \hspace*{\fill}\newline}}
\renewcommand\bibname{参考文献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\RequirePackage{fontspec} 
\setCJKmainfont{SimSun} %正文字体宋体  SimHei 黑体
\setmainfont{Times New Roman} %英文字符 新罗马字体
% 格式
\CTEXsetup[
		format+={\centering\songti\bfseries\zihao{-3}},
        	nameformat={},
        	aftername={\quad},
        	titleformat={},
        	beforeskip={-.5\baselineskip},
        	afterskip={\baselineskip},
        	name={第,章},
		number={\arabic{chapter}}
		]{chapter}
\CTEXsetup[
		format+={\heiti\bfseries\zihao{-4}\raggedright},
		beforeskip={.5\baselineskip},
		afterskip={.5\baselineskip}
		]{section}
\CTEXsetup[
		format={\songti\zihao{-4}\raggedright},
		beforeskip={.5\baselineskip},
		afterskip={.5\baselineskip}
		]{subsection}

\let\cleardoublepage\clearpage

%%%%%%%%%% cross reference %%%%%%%%%%
% 交叉引用

\RequirePackage[CJKbookmarks=true,xetex,unicode]{hyperref}



%%%%%%%%%% contents %%%%%%%%%%
% 目录

\RequirePackage{titletoc}
    \titlecontents{chapter}[0pt]{\songti\bfseries\zihao{-4}}{\thecontentslabel\ }{}
        {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
    \titlecontents{section}[2em]{\vspace{0.1\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
        {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
    \titlecontents{subsection}[4em]{\vspace{0.1\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
    	{\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}


% 取消图片、表格目录中的章节空格
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

%表目录图目录的格式设置
%表目录与图目录数字前增加“表”与“图”字，并且使目录行间距与section行间距一致

\titlecontents{figure}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{图~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

\titlecontents{table}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{表~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

%%%%%%%%%% table %%%%%%%%%%
% 表格

% 设置三线表格的上下边为粗实线
\RequirePackage{booktabs}

% 长表格
\RequirePackage{longtable}

% 表格中的行合并
\RequirePackage{multirow}

% 重定义table/tabular/tabularx环境，使表格内为5号字
% TODO(huxuan): 支持 longtable
\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtable[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtable}

\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtabular[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtabular}

\RequirePackage{tabularx}
\let\oldtabularx\tabularx
\let\endoldtabularx\endtabularx
\renewenvironment{tabularx}[2]
{\renewcommand{\arraystretch}{1.5}
\zihao{5}\oldtabularx{#1}{#2}}
{\renewcommand{\arraystretch}{1}
\endoldtabularx}


\RequirePackage{array}

%%%%%%%%%% picture %%%%%%%%%%
% 图片

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.eps,.ps,.jpg,.bmp}
\graphicspath{{figure/}}
\RequirePackage{pifont} % “秘级”后的五角星
\RequirePackage{subfigure}

%%%%%%%%%% list %%%%%%%%%%
% 列表

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[1,2]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*、}
\setlist[enumerate,2]{label=（\arabic*）}
\setlist{
    topsep=0pt,
    itemsep=0pt,
    partopsep=0pt,
    parsep=\parskip,
}
%%%%%%%%%% caption %%%%%%%%%%
% 图表标题

\RequirePackage{caption}
\DeclareCaptionFormat{ahpufigure}{\songti\zihao{5}{#1 \textrm{#2} #3}}
\DeclareCaptionFormat{ahputable}{\songti\zihao{5}{#1 \textrm{#2} #3}}
\DeclareCaptionFormat{ahpulstlisting}{\songti\zihao{5}{#1\textrm{#2}#3}}
\captionsetup[figure]{format=ahpufigure,labelsep=quad}
\captionsetup[table]{format=ahputable,labelsep=quad}
\captionsetup[lstlisting]{format=ahpulstlisting,labelsep=quad}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

%%======中文摘要===========================%

\newenvironment{cnabstract}{
    	\chapter*{\songti\zihao{-3}\bfseries\ahpu@thesiscntitle}
    	\centerline{\songti\zihao{-3} 摘~~~~要}
    	\vskip .5\baselineskip
    	\par
    	\setlength{\parindent}{24bp}
}{
    \noindent
    \newline
    {\songti\bfseries\zihao{-4} 关键词：}\ahpu@cnkeyword
}


%%======英文摘要===========================%
\newenvironment{enabstract}{
    	\chapter*{\zihao{-3}\bfseries\ahpu@thesisentitle}
    	\centerline{\zihao{-3} ABSTRACT}
    	\vskip .5\baselineskip
    	\par
    	\setlength{\parindent}{24bp}
}{
    \noindent
    \newline
    {\bfseries\zihao{-4} Key Words:}\ahpu@enkeyword
}

%%%%%%%%%% other settings %%%%%%%%%%
% 杂项

% 设置<附录>的图表编号与当前附录章号关联
\newcommand{\rmrelation}{
% 图、表、公式编号随 chapter 清零
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\@addtoreset{equation}{chapter}
%图、表、公式编号章节关联
\renewcommand{\thefigure}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\renewcommand{\thetable}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\renewcommand{\theequation}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
}

\let\oldappendix\appendix
\renewcommand{\appendix}{
\oldappendix\rmrelation
}


%%%%%%%%%% common user info %%%%%%%%%%
% 用户信息

% 论文标题
\def\ahpu@thesiscntitle{}
\def\ahpu@thesisentitle{}
\newcommand{\thesistitle}[2]{
	\def\ahpu@thesiscntitle{#1}
	\def\ahpu@thesisentitle{#2}
}

% 中文摘要关键字
\def\ahpu@ckeyword{}
\newcommand{\cnkeyword}[1]{%
    \def\ahpu@cnkeyword{#1}
}
    
% 英文摘要关键字
\def\ahpu@enkeyword{}
\newcommand{\enkeyword}[1]{%
    \def\ahpu@enkeyword{#1}
}

%%%%% 'ahputhesis.cls' %%%%% END