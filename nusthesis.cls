\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nusthesis}[2023/11/20 NUS thesis cls file]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class and Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load Base Class -- Book
\PassOptionsToClass{a4paper}{book}
\PassOptionsToClass{12pt}{book}
\PassOptionsToClass{oneside}{book}
\PassOptionsToClass{openright}{book}
\LoadClass{book}
%Packages

\RequirePackage[UKenglish]{isodate}
\RequirePackage{color}
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}
\RequirePackage[svgnames,table]{xcolor}
\RequirePackage[]{graphicx}
\RequirePackage{epstopdf}
\RequirePackage{setspace}
%\RequirePackage{sectsty}
\RequirePackage{ifthen}
\RequirePackage[top=1in, bottom=1in, left=1.5in, right=1.5in]{geometry}
\RequirePackage{amsmath}
\RequirePackage{lipsum}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{mathtools}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{fancyvrb}
\RequirePackage{pbox}
\RequirePackage{pdflscape}
\RequirePackage{pstricks}
%\RequirePackage{minitoc}
\RequirePackage{acronym}
\RequirePackage[section]{placeins}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage[titletoc]{appendix}
\RequirePackage[raggedright]{titlesec}
\RequirePackage{mdwtab}
\RequirePackage{subcaption}
\RequirePackage{caption}
\RequirePackage{floatrow}

\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[scaled=0.9,varl]{inconsolata}
  \RequirePackage[mono=false]{libertinus-type1}  
  \RequirePackage{libertinust1math}  
%  \RequirePackage[]{stix} % loads textcomp
%  \RequirePackage[sans]{libertinus-type1}

\else % if luatex or xelatex
  \RequirePackage{fontspec}
  \RequirePackage{xunicode}
\fi

\RequirePackage[hyperfootnotes=false]{hyperref}
\hypersetup{
 linkcolor = DarkBlue,
 citecolor = DarkBlue,
 plainpages = false,
 hypertexnames = false,
 allbordercolors = white,
}

\RequirePackage[nameinlink,noabbrev, capitalise]{cleveref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Double Line Spacing
\doublespacing

%Plain Page Style
%\pagestyle{plain}

%Labels Declaration
\graphicspath{ {./images/} }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Defaults of Variables
\@ifundefined{@degree}{\gdef\@degree{Master of Engineering}}{}
\gdef\@university{National University of Singapore}
\gdef\@department{Department of Electrical and \\Computer Engineering}
\gdef\@submityear{\number\year}
\gdef\@subtitle{\space}
\gdef\@qualification{B.Eng. (Hons), NUS}
\gdef\@keywords{\space}
\gdef\nus@abbrev{\space Test \space MAC }

%Define Inputs
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\submityear#1{\gdef\@submityear{#1}}
\def\Degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\university#1{\gdef\@university{#1}}
\def\qualification#1{\gdef\@qualification{#1}}
\def\keywords#1{\gdef\@keywords{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Renewed Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Title Page
\renewcommand{\titlepage}{
\thispagestyle{empty}
\begin{center}\hyphenpenalty=10000
\Large\bfseries\uppercase\expandafter{\@title}\\
\normalsize\mdseries\uppercase\expandafter{\@subtitle}
\end{center}\vfill
\titlepagebody
\vfill
\begin{center}\hyphenpenalty=10000
\titlepagefooter
\end{center}\newpage}

%Title (Cover and Title)
\renewcommand{\maketitle}{
\coverpage
\titlepage
}

% Table captions
\renewcommand{\tablename}{Table}
\DeclareCaptionFormat{hfillstart}{#1#2#3}
\DeclareFloatFont{normalsize}{\normalsize}
\captionsetup[table]{
  format=hfillstart,
  labelsep=newline,
  justification=centering,
}

% Figure caption
\renewcommand{\figurename}{Figure}
\captionsetup[figure]{
  labelsep=period,
}

\floatsetup[table]{capposition=top, font=normalsize}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Coverpage
\newcommand{\coverpage}{
\thispagestyle{empty}\vspace*{0.3in}
\begin{center}\hyphenpenalty=10000
\Large\bfseries\uppercase\expandafter{\@title}\\
\Large\mdseries\uppercase\expandafter{\@subtitle}
\end{center}\vspace*{8cm}
\begin{center}\hyphenpenalty=10000
\large\bfseries\uppercase\expandafter{\@author}
\end{center}\vfill
\begin{center}\hyphenpenalty=10000
\normalsize\bfseries
\large\uppercase\expandafter{\@university}\vspace*{0.2cm} \\
\large\uppercase\expandafter{\@submityear}
\end{center}
\newpage}

%Title Page Body
\@ifundefined{titlepagebody}{
\newcommand{\titlepagebody}{
\begin{center}\hyphenpenalty=10000
\large\uppercase\expandafter{{\bfseries\@author}}\\ (\textit{\expandafter{\@qualification}})
\end{center}}}{}

%Title Page Footer
\@ifundefined{titlepagefooter}{
\newcommand{\titlepagefooter}{\large\bfseries\uppercase{A Thesis submitted\\ for the Degree of \uppercase\expandafter{\@degree}\\ \uppercase\expandafter{\@department}\\ \uppercase\expandafter{\@university}\\ 
\vspace*{2cm}\number\year}}}{}

%Declaration Page
\@ifundefined{declarationpage}{
\newcommand{\declarationpage}{
\thispagestyle{empty}
\begin{center}\hyphenpenalty=10000
\large\bfseries\uppercase\expandafter{DECLARATION}
\end{center}
\vspace*{1cm}
\begin{center}\hyphenpenalty=10000
I hereby declare that the thesis is my original \\
work and it has been written by me in its entirety.\\
I have duly acknowledged all the sources of \\
information which have been used in the thesis. \\
\vspace*{0.5cm}
This thesis has also not been submitted for any \\
degree in any university previously. \\
\vspace*{2cm}
%\begin{figure}[!h]
    %\subfloat{ \includegraphics[width=0.3\textwidth]{signature} }
%\end{figure}
\vspace*{-1cm}
\begin{center}
\rule{8cm}{0.5pt}
\end{center}
\vspace*{-0.5cm}
\@author \\
\today
\end{center}\newpage}} {}

%Chapfont
% \newcommand{\chapfont}[1]{
% \noindent\textbf{\nohang\begin{Huge}#1\end{Huge}}\vspace*{1cm}\\}


\newenvironment{dedication}{
  \clearpage\null\vfill
  \begin{center}\itshape\Large
  }{
  \end{center}
  \vfill\null\clearpage
}

\newcommand{\dedicate}[1]{\begin{dedication}#1\end{dedication}}

% Convenient for short dedication

\newenvironment{acknowledgements}%
{
  \phantomsection\addcontentsline{toc}{chapter}{Acknowledgements}
  \vfill
  \begin{center}
    {\large \bfseries Acknowledgements}
    \end{center}
}
{\vfill\clearpage}


%Abstract
%\newcommand{\abstract}[1]{
%\vspace*{2.75cm}
%\chapfont{Summary}#1\vfill
%\begin{flushright}\today\end{flushright}\newpage}

\newcommand{\abstract}[1]{
\setcounter{secnumdepth}{-2}
\chapter{Abstract}
#1\vfill
\setcounter{secnumdepth}{2}
}

%Strict Compliant
\@ifundefined{@nusstrict}{}{
\chapternumberfont{\centering\mdseries\uppercase}
\chaptertitlefont{\centering\mdseries\uppercase}
\sectionfont{\raggedright}
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\appendixname}{APPENDIX}
%%% make the titles a little narrower
\titleformat{\chapter}[display]{\mdseries\Huge\setstretch{1.5}}{\chaptertitlename~\thechapter}{2em}{}{}
%\renewcommand{\chapfont}[1]{{\nohang\centering\mdseries\begin{Huge}#1\end{Huge}\vspace*{1cm}\\}}
}

\titleformat{\chapter}[display]{\mdseries\Huge\setstretch{1.5}}{\chaptertitlename~\thechapter}{2em}{}{}


%Format text referring to appendices
\crefname{appsec}{Appendix}{Appendices}
\crefname{figure}{Fig.}{Fig.}
\crefname{table}{Table}{Tables}
\crefname{equation}{}{}

%Table float box with bottom caption, box width adjusted to content
\newfloatcommand{capbtabbox}{table}[][\FBwidth]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adapted from losymbol.sty
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%losymbol.sty by gerry van dooren, may 1992, revised august 1992.
% elecgd@urc.tue.nl
%
%definition is nearly analogous to the setup for list of figures
%and list of tables; use same definition using \@starttoc,
%however default extension is now .los
%
\def\losymbolsname{List of Symbols}
\def\loabbrevname{List of Abbreviations}
\def\listofsymbolsnabbrev{
	\chapter*{\losymbolsname \@mkboth
	{\uppercase{\losymbolsname}}{\uppercase{\losymbolsname}}}
	\@starttoc{los}
	\chapter*{\loabbrevname \@mkboth
	{\uppercase{\loabbrevname}}{\uppercase{\loabbrevname}}}
	\begin{acronym}[RADAR12345]
	\@starttoc{loab}
	\end{acronym}
}
%
%command for putting text in file \jobname.loa is \addsymbol
%command that is used for actually producing text is called
%\makenicesymbolline
\def\addsymbol#1#2{%
\addtocontents{los}{\protect \makenicesymbolline{#1}{#2}}}
\def\addabbrev#1#2{%
\addtocontents{loab}{\protect \makeniceabbrevline{#1}{#2}}}
%
%physical dimensions of columns
\newdimen\@lcsym %width of left column
\@lcsym=2cm      %default 3cm
%
\newdimen\@mcsym %width of mid column (space)
\@mcsym=1cm      %default 2cm
%
\newdimen\@rcsym %width of right column
\@rcsym=\hsize   %initial width=textwidth
%
\advance\@rcsym by -\@lcsym %subtract lcsym
\advance\@rcsym by -\@mcsym %subtract mid
%
%command for producing the actual line uses standard minipages
%to cope with long definitions
%
\def\makenicesymbolline#1#2{%
\begin{minipage}[t]{\@lcsym}#1\end{minipage}%
$\hspace{\@mcsym}$%
\begin{minipage}[t]{\@rcsym}#2\end{minipage}\newline}
\def\makeniceabbrevline#1#2{%
%\begin{minipage}[t]{\@lcsym}#1\end{minipage}%
%$\hspace{\@mcsym}$%
%\begin{minipage}[t]{\@rcsym}#2\end{minipage}\newline
\acro{#1}{#2}}
%
%end of losymbol.sty
