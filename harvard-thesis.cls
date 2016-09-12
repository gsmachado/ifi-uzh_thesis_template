% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "harvard-thesis.cls",
%     version         = "0.1.1",
%     date            = "5 April 2011",
%     createdby       = "Jordan Suchow, modified by Andrew Leifer and Guilherme Sperb Machado",
%     email           = "suchow at fas.harvard.edu, gsm at machados.org",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, harvard-thesis, ifi-uzh-thesis",
%     supported       = "send email to suchow@fas.harvard.edu or gsm@machados.org",
%     docstring       = "A thesis class for a IFI-UZH thesis."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{harvard-thesis}[2011/12/08 v0.3 Harvard University Thesis Class]
\LoadClass[11pt, a5paper]{book}  %removed: oneside (default is twoside)

%these should be inpreamble of .tex file, not .cls
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\usepackage[centertags]{amsmath}

% commented by GM:
%\RequirePackage{amssymb}

\RequirePackage[numbers, comma, sort&compress]{natbib}
\RequirePackage[small, md, sc]{titlesec}
\RequirePackage[tight,nice]{units}
\RequirePackage{verbatim}
\usepackage{color}

% added by GM:
\usepackage[table]{xcolor}
\setcounter{secnumdepth}{4}

\setcounter{tocdepth}{1}
\usepackage{hyperref}
\definecolor{Crimson}{rgb}{0.6,0,0}
\RequirePackage{url}
\usepackage[titles]{tocloft}
\RequirePackage{rotating}
\usepackage{packages/natbibspacing}
\setlength{\bibspacing}{.4\baselineskip}

% added by GM:
\usepackage{placeins}
\usepackage{pgfkeys}

% added by GM:
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
% end of GM

\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\bibname{References}
\renewcommand\listfigurename{List of Figures}
\renewcommand\listtablename{List of Tables}
%\raggedright

% Begin Andy's package additions
% GM: I commented this due to http://tex.stackexchange.com/questions/215786/tabular-environment-in-harvard-thesis-template
%\usepackage{pdfsync} % do pdf synchronization [andy]

\usepackage[closeFloats]{packages/fltpage}

\synctex=1 % turn synctex on automatically to sync between pdf viewer [andy]

% list an entire bibliography entry inline. Useful for acknowledging when my paper was previously published
\usepackage{bibentry} 
\nobibliography*        
% End Andy's package additions

\RequirePackage{lettrine} % big letter at start of chapter
\RequirePackage[a5paper,bottom=2cm, top=1.2cm, outer=2.2cm]{geometry}

\RequirePackage{fancyhdr}
\pagestyle{plain} % options: empty , plain , fancy
\RequirePackage[palatino]{quotchap}
\RequirePackage{titling}
\RequirePackage{setspace}
\RequirePackage[labelfont={sf,bf,small},textfont={sf,small},justification=RaggedRight,margin=0pt]{caption}
%\raggedright

\parindent 12pt
\RequirePackage{mathspec}


% Instead of using default latex for math fonts, we can be fancy and try to adapt Chaparral Pro.. --ANDY
\setmathsfont(Digits,Latin,Greek)[Numbers={OldStyle,Proportional}]{Arno Pro}
\setmathrm{Arno Pro}  %I added this to handle \mathbf
%\setmathsfont(Digits,Latin,Greek)[Numbers={OldStyle,Proportional}]{Parsi Digits}
%\setmathrm{Parsi Digits}

%Use this if you want math fonts that are slightly better than default Latex
\setmathfont{Cambria Math}

\RequirePackage{fontspec,xltxtra,xunicode}
\defaultfontfeatures{Mapping=tex-text, Numbers=OldStyle}
\setromanfont[Mapping=tex-text, Numbers=OldStyle]{Arno Pro} 

% added by GM
\RequirePackage{enumitem}
\RequirePackage{pifont} % this is to use the \ding{} command for special characters.

%\setromanfont[Mapping=tex-text, Numbers=OldStyle,
%Ligatures={{Contextual,Rare}}]{Arno Pro}

% Contextuals=Swash, Ligatures={{Historic,Contextual,Rare}}

%Set fonts for Mac Specific (Comment out on Windows XP)
%\setsansfont[Scale=MatchLowercase,Mapping=tex-text]{Helvetica Neue} 
%\setmonofont[Scale=MatchLowercase]{Consolas}

% some definitions
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisor#1{\gdef\@coadvisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\university#1{\gdef\@university{#1}}
\def\authorcity#1{\gdef\@authorcity{#1}}

% defined by GM:
\def\approved#1{\gdef\@approved{#1}}
\def\degreeconferraldate#1{\gdef\@degreeconferraldate{#1}}
\def\degreeconferralplace#1{\gdef\@degreeconferralplace{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\chairdoctoralboard#1{\gdef\@chairdoctoralboard{#1}}

\newenvironment{mysideways}
               {\begin{sideways}\begin{sideways}\begin{sideways}}
               {\end{sideways}\end{sideways}\end{sideways}}

% GM: this is the original cover from the Harvard template.
% I made a \coveruzh, which is defined below
\renewcommand{\maketitle}{
	\thispagestyle{empty}\vspace*{\fill} 
	\begin{center} \sc
	\huge \begin{spacing}{0.75} \thetitle \end{spacing} \normalsize
	\vspace{50pt} Doctoral Thesis\\	\vspace{18pt}
	For the Degree of\\ \@degree\\	\vspace{18pt}
	At the \@department\\ of the \\\@university\\	\vspace{18pt}
	by \\\theauthor\\ from \\ \@authorcity\\	\vspace{18pt}	
	Accepted on the recommendation of \\\@advisor\\\@coadvisor\\	\vspace{18pt}
	\@degreemonth\ \@degreeyear
	\end{center} \vspace*{\fill}
} 

\pgfkeys{
 /coveruzh/.is family, /coveruzh,
 % Here are the options that a user can pass
 default/.style = {beforeTitle = 70pt, afterTitle = 70pt},
 beforeTitle/.estore in = \coveruzhSpaceBeforeTitle,
 afterTitle/.estore in = \coveruzhSpaceAfterTitle,
}


\newcommand{\coveruzh}[1][]{
	\pgfkeys{/coveruzh, default, #1}%
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
	Department of Informatics 
	\\ \vspace{\coveruzhSpaceBeforeTitle}
	\huge \begin{spacing}{0.75} \thetitle \end{spacing} \normalsize	
	\vspace{\coveruzhSpaceAfterTitle}
	Dissertation submitted to the\\
	\textsc{\@faculty}
	\\of the \textsc{\@university} \vspace{18pt}
	\\to obtain the degree of\\
	\textsc{Doktor / Doktorin der Wissenschaften, Dr. sc.}\\
	(corresponds to \textsc{Doctor of Science, Ph.D.})\\ \vspace{30pt}
	presented by\\
	\textsc{\theauthor}\\
	from \\
	\textsc{\@authorcity}\\ \vspace{30pt}
	approved in \textsc{\@approved}\\ \vspace{18pt}
	accepted on the recommendation of\\
	\textsc{\@advisor}\\
	\textsc{\@coadvisor}\\
	\end{center}
	\vspace*{\fill}
	\pagebreak
	\thispagestyle{empty}
	\vspace*{\fill}
	The \@faculty of the \@university hereby authorizes the printing of this dissertation, without indicating an opinion of the views expressed in the work.\\ \vspace{20pt}
	\\\textsc{\@degreeconferralplace, \@degreeconferraldate}\\ \vspace{20pt}
	\\Chair of the Doctoral Board: \textsc{\@chairdoctoralboard}\\
	\vspace*{\fill}
} 

\renewcommand{\appendix}{
  \par
  \setcounter{chapter}{1}
  \setcounter{section}{0}
  \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
  \renewcommand{\thefigure}{\Alph{chapter}.\arabic{figure}}
}

\newcommand{\copyrightpage}{
	\newpage \thispagestyle{empty} \vspace*{\fill}
	\sc \noindent \copyright 2016\hspace{3pt}-- \theauthor \\
	\noindent All rights reserved.
	\vspace*{\fill} \newpage \rm
}

\newcommand{\abstractpage}{
	\newpage
	\setcounter{page}{3}
	%\lhead{\@advisor} \rhead{\@author} \vspace*{\fill}
	\chapter*{Abstract}
	\addcontentsline{toc}{chapter}{Abstract}
	\input{chapters/abstract}
	\newpage %\lhead{} \rhead{}
	\cfoot{\thepage}
}

\newcommand{\kurzfassungspage}{
	\newpage
	%\lhead{\@advisor} \rhead{\@author} \vspace*{\fill}
	\chapter*{Kurzfassung}
	\addcontentsline{toc}{chapter}{Kurzfassung}
	\noindent
    \input{chapters/kurzfassung}
	\newpage %\lhead{} \rhead{}
	%\cfoot{\thepage}
}

\newcommand{\dedicationpage}{
	\pagestyle{fancy}
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\sc \noindent \input{chapters/dedication}
	\vspace*{\fill} \newpage \rm
	}

\newcommand{\authorlist}{
	\pagestyle{fancy}
	\newpage
	\thispagestyle{fancy} 
	\chapter*{Author List}
	\addcontentsline{toc}{chapter}{Author List}
	\noindent \input{chapters/authorlist}
	\newpage \rm
	}

\newcommand{\acknowledgments}{
%	\vspace*{\fill} %This has to be removed, otherwise you get an additional empty page
	\chapter*{Acknowledgments}
	\addcontentsline{toc}{chapter}{Acknowledgments}
	\noindent
	\input{chapters/acks}
}

\newcommand{\cv}{
%	\vspace*{\fill} %This has to be removed, otherwise you get an additional empty page
	\chapter*{Curriculum Vitae}
	\addcontentsline{toc}{chapter}{Curriculum Vitae}
	\noindent
	\input{chapters/cv}
}

% An environment for paragraph-style section
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}	

\widowpenalty=50000
\clubpenalty=50000
%\raggedbottom

%Andys Spacing 
%Be more forgiving, and stretch word spacing out more so that wormds don't run out into the margins..
\sloppy
%End Andy Spacing