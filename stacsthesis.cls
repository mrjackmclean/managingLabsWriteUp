%
% StACS PhD thesis document class
% Lakshitha de Silva
% v0.2
% 2014
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{stacsthesis}[2014/04/04 v0.1 StACS PhD thesis class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt,oneside,openany]{memoir}

%
% Dependent packages
%
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage{graphicx}
\DisemulatePackage{setspace}
\RequirePackage[english]{babel}
\RequirePackage{setspace}
\RequirePackage{color}
\RequirePackage{xstring}
\RequirePackage{t1enc}
\RequirePackage{mathptmx}
\RequirePackage{changepage}
\RequirePackage[letterspace=32]{microtype}
\RequirePackage{titlesec}

%
% Macros
%
\def\school#1{\gdef\@school{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\submittextA#1{\gdef\@submittextA{#1}}
\def\submittextB#1{\gdef\@submittextB{#1}}
\def\logo{\includegraphics[width=30mm]{stacrest.png}}
\def\bibtitle#1{\gdef\@bibtitle{#1}}

%
% Paper settings-we support only A4
%
\ifpdf
	\pdfpageheight=297mm
	\pdfpagewidth=210mm
\else
	\setlength{\paperheight}{297mm}
	\setlength{\paperwidth}{210mm}
\fi

%
% Text properties and margins
%
\setlength{\topmargin}{2mm}
\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{0mm}
\setlength{\textwidth}{160mm}
\setlength{\textheight}{224mm}
\raggedbottom

%
% Title page
%
\renewcommand{\maketitle}{
	\begin{singlecolumn}
		\renewcommand{\footnotesize}{\small}
		\renewcommand{\footnoterule}{\relax}
		\thispagestyle{empty}
		\begin{center}
    			\Huge{\textls{\@title}}\par
			\Large\vspace*{22.4mm}{\textls{\@author}}\par
			\Large\vspace*{2mm}{\textls{Supervisor: \@supervisor}}\par
			\large\vspace*{2mm}{\@school}\par
			\vspace*{44mm}{\logo}\par
			\normalsize\vspace*{32mm}{\@submittextA}\par
			\normalsize\vspace*{2mm}{\emph{\@degree}}\par
			\normalsize\vspace*{2mm}{\@submittextB}\par
			\normalsize\vspace*{8mm}{\@submitdate}
		\end{center}
	\end{singlecolumn}}

%
% Customise standard titles, section numbering, etc.
%
\addto\captionsenglish{\renewcommand{\bibname}{\@bibtitle}}
\renewcommand*{\cftappendixname}{Appendix\space}		% Prefix 'Appendix' to toc appendix names
\setsecnumdepth{subsubsection}						% Enable numbering up to sub-sub-section level

%
% Renewed environments
%
\renewenvironment{abstract}
	{\begin{singlecolumn}\thispagestyle{empty}\begin{epititle}{\textls{Abstract}}\end{epititle}\begin{quote}}
	{\end{quote}\end{singlecolumn}}

%
% New environments
%
\newenvironment{dedication}
	{\begin{singlecolumn}\thispagestyle{empty}\vspace*{80mm}\Large\itshape\begin{flushright}}
	{\end{flushright}\end{singlecolumn}}

\newenvironment{acknowledgement}
	{\begin{singlecolumn}\thispagestyle{empty}\begin{epititle}{\textls{Acknowledgements}}\end{epititle}\begin{quote}}
	{\end{quote}\end{singlecolumn}}

\newenvironment{acknowledgementlong}
	{\begin{singlecolumn}\thispagestyle{empty}\begin{epititle}{\textls{Acknowledgements}}\end{epititle}}
	{\end{singlecolumn}}
		
\newenvironment{declaration}
	{\begin{singlecolumn}\thispagestyle{empty}\begin{epititle}{\textls{Declaration}}\end{epititle}\begin{quote}}
	{\end{quote}\end{singlecolumn}}

\newenvironment{permission}
	{\begin{singlecolumn}\thispagestyle{empty}\begin{epititle}{\textls{Permission for Electronic Publication}}\end{epititle}\begin{quote}}
	{\end{quote}\end{singlecolumn}}

\newenvironment{romanpages}
	{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
	{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

\newenvironment{singlecolumn}
	{\@restonecolfalse
		\if@twocolumn\@restonecoltrue\onecolumn
	 	\else\if@openright\cleardoublepage\else\clearpage\fi
	 	\fi}
	{\if@restonecol\twocolumn
		\else\newpage\thispagestyle{empty}
	 	\fi}

\newenvironment{epititle}
	{\begin{center}\vspace*{16mm}\LARGE\bfseries}
	{\end{center}\vspace{8mm}}

\newenvironment{indentpara}[1][32pt]
	{\begin{adjustwidth}{#1}{}}
	{\end{adjustwidth}}

%
% Chapter style
%
\titleformat{\chapter}[block]
  {\normalfont\huge\bfseries\thispagestyle{stacs-pg}}{\thechapter}{1em}{\Huge}
\titlespacing*{\chapter}{0pt}{-19pt}{0pt}

%
% Page style

% underline header command
\newcommand{\insertunderline}{\rule[-.3\baselineskip]{\linewidth}{.4pt}}

\makepagestyle{stacs-pg}
\makeevenhead{stacs-pg}{\scriptsize\slshape\rightmark}{\insertunderline}{\small\normalfont\scshape\thepage}
\makeoddhead{stacs-pg}{\scriptsize\slshape\rightmark}{\insertunderline}{\small\normalfont\scshape\thepage}
\setlength{\topmargin}{0pt}
\setlength{\headsep}{24pt}
\setlength{\textheight}{656pt}
\setlength{\footskip}{36pt}

