\def\currversion{Feb 16, 2011}
%% wileysev.cls
%% (identical to wileysix.cls except for page size and cropmarks)

  %****************************************************************%
  %*                                                              *%
  %*     Prepared by Amy Hendrickson, TeXnology Inc.              *%
  %*                                                              *%
  %*     TeXnology Inc.                                           *% 
  %*     www.texnology.com                                        *%
  %*     amyh@texnology.com                                       *%
  %*                                                              *%
  %****************************************************************%

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Macro Contents:
  %% Dimensions
  %% Global Parameters
  %% Listing
  %% Title Pages, Preface, Introduction
  %% Part, Chapter, and Appendix Commands 
  %% Counters
  %% Header Level Names
  %% Section Commands 
  %% Verse, Quote, Extract 
  %% Math
  %% Figure and Table Captions 
  %% Table of Contents, List of Figures, LOT 
  %% Bibliography, References 
  %% Footnotes
  %% Running Heads
  %% Fonts for Specific Places
  %% Algorithm
  %% Glossary
  %% Index
  %% Multiple Indices
  %% Draft line
  %% Problem set
  %% Exercises
  %% Solutions
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\typeout{^^J^^J
Wiley Book Style, Design No.: SD 001C^^J
and SD 004B^^J
^^J
Written by Amy Hendrickson, TeXnology, Inc.^^J
^^J
This version is dated \currversion^^J^^J}



\expandafter\ifx\csname mathunderscore\endcsname\relax
\def\mathunderscore{\leavevmode\kern.06em\vbox{\hrule width.3em}}
\def\mathellipsis{\mbox {$\m@th{\,.\,.\,.}\,$}}\fi
\global\newdimen\phspace

\parindent=1pc
\parskip=0pt %plus .1pt

%% to make the 6 1/8 by 9 1/4 trim size
%\textheight=45pc \textwidth=28pc

%% to make the 7 by 10 in size
\textheight = 49pc
\textwidth 30pc

\topmargin.75in
\headheight 12pt
\headsep 18pt
\topskip  10pt
\footskip 18pt

\columnsep 10pt
\columnseprule 0pt

\footnotesep 6.65pt
\skip\footins 18pt 

\floatsep 12pt plus 2pt minus 2pt
\textfloatsep 20pt plus 2pt minus 4pt
\intextsep 12pt plus 2pt minus 2pt

\dblfloatsep 12pt plus 2pt minus 2pt
\dbltextfloatsep 20pt plus 2pt minus 4pt

\@fptop 0pt plus 1fil
\@fpsep 8pt plus 2fil
\@fpbot 0pt plus 1fil
\@dblfptop 0pt plus 1fil
\@dblfpsep 8pt plus 2fil
\@dblfpbot 0pt plus 1fil

\maxdepth=4pt %% 

\oddsidemargin-18pt
\advance\oddsidemargin-.5in
\evensidemargin-6pt
\oddsidemargin=0pt

\advance\oddsidemargin-.5in
\evensidemargin=0pt
\advance\evensidemargin-.5in
\marginparwidth .75in

\if@twocolumn
 \setlength\marginparsep {10\p@}
\else
  \setlength\marginparsep{7\p@}
\fi
\setlength\marginparpush{5\p@}

\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

%%%
\setcounter{topnumber}{10}
\def\topfraction{.9}
\setcounter{bottomnumber}{10}
\def\bottomfraction{.9}
\setcounter{totalnumber}{20}
\def\textfraction{.1}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}
%%%

\setlength\arraycolsep{5\p@}
\tabcolsep 6pt

\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}

%%%%%%%%%%%%%%% <<== end dimensions

%%% Global parameters ==>>

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

%% to make left and right page position differently.
\@twosidetrue  \@mparswitchtrue
\@twocolumnfalse

\newif\if@openbib
\@openbibfalse
\newif\if@openright
\newif\if@mainmatter 
\newif\if@restonecol
\newif\if@titlepage
\newif\ifdraft

%% Start new chapter on right side
\newif\if@openright
\@openrighttrue


\newcommand{\contentsname}{CONTENTS}
\newcommand{\listfigurename}{List of Figures}
\newcommand{\listtablename}{List of Tables}
\newcommand{\bibname}{Bibliography}
\newcommand{\indexname}{INDEX}
\newcommand{\figurename}{Figure}
\newcommand{\tablename}{Table}
\newcommand{\partname}{PART}
\newcommand{\chaptername}{Chapter}
\newcommand{\appendixname}{Appendix}

%%% <== end global parameters

\ProcessOptions


\NeedsTeXFormat{LaTeX2e}

\newcommand{\@ptsize}{}

\renewcommand{\normalsize}{%
\ifdraft
   \@setfontsize\normalsize\@xpt\@xviipt
\else
   \@setfontsize\normalsize\@xpt\@xiipt
\fi
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand{\small}{%
\ifdraft
   \@setfontsize\small\@ixpt{17}%
\else
   \@setfontsize\small\@ixpt{11}%
\fi
   \abovedisplayskip 8.5\p@ %\@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ %\@plus2\p@
   \belowdisplayshortskip 4\p@ %\@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand{\footnotesize}{%
\ifdraft
   \@setfontsize\footnotesize\@viiipt{17}%
\else
   \@setfontsize\footnotesize\@viiipt{9.5}%
\fi
   \abovedisplayskip 6\p@ %\@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ %\@plus\p@
   \belowdisplayshortskip 3\p@ %\@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand{\xscriptsize}{\@setfontsize\scriptsize\@vipt\@viipt}
\newcommand{\scriptsize}{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
\newcommand{\large}{\@setfontsize\large\@xiipt{14}}
\newcommand{\Large}{\@setfontsize\Large\@xivpt{18}}
\newcommand{\LARGE}{\@setfontsize\LARGE\@xviipt{22}}
\newcommand{\huge}{\@setfontsize\huge\@xxpt{25}}
\newcommand{\Huge}{\@setfontsize\Huge\@xxvpt{30}}


\@maxdepth\maxdepth
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand{\mit}{\@fontswitch{\relax}{\mathnormal}}


\lineskip 1pt
\normallineskip 1pt
\def\baselinestretch{1}

\normalsize
%% <<== end font info


%% Listing ==>>

\leftmargini 20pt
\leftmarginii 15pt
\leftmarginiii 36pt
\leftmarginiv 17pt
\leftmarginv 10pt
\leftmarginvi 10pt

\def\@listI{\leftmargin\leftmargini
            \parsep 4\p@ \@plus2\p@ \@minus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    2\p@ \@plus\p@  \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}



\leftmargin\leftmargini
\labelsep 5pt
\labelwidth\leftmargini\advance\labelwidth-\labelsep


\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

\renewcommand{\theenumi}{\arabic{enumi}}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\theenumiii}{\roman{enumiii}}
\renewcommand{\theenumiv}{\Alph{enumiv}}
\newcommand{\labelenumi}{\theenumi.}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}
\def\sqbullet{\raise2pt\hbox{\vrule width 2.5pt depth0pt height 2.5pt}}
\newcommand{\labelitemi}{\sqbullet}
%\newcommand{\labelitemi}{$\m@th\bullet$}
\newcommand{\labelitemii}{\normalfont\bfseries --}
\newcommand{\labelitemiii}{$\m@th\ast$}
\newcommand{\labelitemiv}{$\m@th\cdot$}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}


\newcommand*{\descriptionlabel}[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

%%% <<=== end of listing commands 

%% Title Pages, Preface, Introduction==>>

\def\preface{\startonoddpage
\chapter*{Preface}
\global\titletrue
\markboth{PREFACE}{PREFACE}
\addcontentsline{toc}{schapter}{Preface}}

\def\prefacefirst{\startonoddpage
\chapter*{Preface to the First Edition}
\global\titletrue
\markboth{PREFACE TO FIRST EDITION}{PREFACE TO FIRST EDITION}
\addcontentsline{toc}{schapter}{\protect\numberline{\ }\string\rlap{Preface to First Edition}}}

\let\endprefacefirst\endpreface

\def\endpreface{\newpage\markboth{}{}}

\def\prefaceauthor#1{\vskip14pt\hbox to\textwidth{\hfill\small\sc #1}}


\def\foreword{\startonoddpage
\chapter*{Foreword}
\global\titletrue
\markboth{FOREWORD}{FOREWORD}
\addcontentsline{toc}{schapter}{Foreword}}

\let\endforeword\endpreface


\def\dedication#1{\startonoddpage
\global\titletrue
\null\vskip15pc
\noindent\hfill\vtop{\hsize=.45\hsize
\leftskip=\parfillskip
\baselineskip=12pt
\parfillskip=0pt
\def\\ {\vskip.5pt}
\Large\it
\noindent#1\vskip1sp}
\thispagestyle{empty}
\newpage\markboth{}{}
}

\def\where#1{\vskip4pt\vtop{\parindent=0pt \wherefont #1}}

%%%%%%%%%%%%%%%%%%%
\def\introduction{\startonoddpage
\global\titletrue
\chapter*{Introduction}
\markboth{INTRODUCTION}{INTRODUCTION}
\renewcommand{\thechapter}{I}
\addcontentsline{toc}{schapter}{Introduction}}

\def\endintroduction{\newpage}

%%
%% introduction author, feb 10, 2012

\def\introauthor#1#2{\vskip-1in
\addcontentsline{toc}{ichapter}{#1}
\vtop to 0pt{
{\sc #1}
\chapteraffil{#2}
\vss}\global\everypar={\hskip-\parindent\everypar={}}\vskip1in}

% used
% \introauthor{Catherine Clark, PhD.}{Harvard School of Public Health\\
% Boston, MA, USA}

\def\l@ichapter#1#2{%
  \ifnum \c@tocdepth >1
    \addpenalty{-\@highpenalty}%
    \vskip -3pt \@plus\p@
     \setlength\@tempdima{2.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
\hbox{\it #1}\hfill\par
      \penalty\@highpenalty
    \endgroup
\vskip1sp
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\acknowledgments{\startonoddpage
\global\titletrue
\chapter*{Acknowledgments}
\addcontentsline{toc}{schapter}{Acknowledgments}}

\def\endacknowledgments{\newpage}

\let\acknowledgements\acknowledgments
\let\endacknowledgements\endacknowledgments

\def\authorinitials#1{\vskip12pt
\hbox to\textwidth{\hfill#1}\newpage}


%% from 2e
\newcommand{\frontmatter}{\cleardoublepage
            \@mainmatterfalse\pagenumbering{roman}}
\newcommand{\mainmatter}{\cleardoublepage
       \@mainmattertrue\pagenumbering{arabic}}
\newcommand{\backmatter}{\if@openright\cleardoublepage\else\clearpage\fi
      \@mainmatterfalse}
%%

\newif\iftitle

\def\booktitle#1{\def\thetitle{\uppercase{#1}}}
\def\subtitle#1{\def\thesubtitle{#1}}
\def\author#1{\def\theauthor{#1}}
\let\authors\author
\def\editionstatement#1{\def\theeditionstatement{#1}}

\booktitle{}
\subtitle{}
\editionstatement{}

\def\halftitlepage{\thispagestyle{empty}
  \vspace*{9pc}%
  {\parindent \z@ 
    \interlinepenalty\@M
\LARGE
\hyphenpenalty10000
\bfseries\halftitlefont 
\def\\ {\vskip1sp}
\noindent\thetitle\vskip 1sp
}
\newpage
}

\def\titlepage{\ifodd\c@page\else\thispagestyle{empty}\null\newpage\fi
\thispagestyle{empty}
\vbox to\vsize{\vspace*{36pt}%
\hrule height3pt
\vskip6pc
\parindent \z@ 
\interlinepenalty\@M
\Huge
\hyphenpenalty10000
\bfseries\titlefont 
\uppercase{\thetitle}
\ifx\subtitle\empty\else
{\vskip1pt\baselineskip22pt
\subtitlefont \vrule height2pc width0pt\thesubtitle\vskip1sp}\fi
\vskip1pc
\hrule
\ifx\theeditionstatement\empty\else
\vskip48pt
{\editionfont \theeditionstatement}\fi
\vskip6.5pc
{\frenchspacing\baselineskip=12pt
\authorfont \theauthor\vskip1sp}
\vfill
\noindent{\includegraphics[width=1.7in]{wileylogo}}
\vskip-8pt
{\wileyfont A JOHN WILEY \& SONS, INC., PUBLICATION}
\vskip24pt}\newpage}

\def\affil#1{{\affilfont #1}\vskip18pt}


\def\dotspace{\hskip5pt/\hskip5pt}

%% end Title Pages, Preface

%% Part, Chapter, and Appendix Commands ===>>>

\def\chaptermark#1{}

\newcommand{\part}{\startonoddpage
                 \thispagestyle{empty}%
                     \@tempswafalse
                 \secdef\@part\@spart}

\def\@part[#1]#2{%
\ifnum\c@part=0 \global\@mainmattertrue
\pagenumbering{arabic}\setcounter{page}{1}\fi
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}
  {
\vglue36pt
\parindent \z@ 
 \interlinepenalty\@M
\Large
{\parindent \z@ 
\partnumberfont
\partname~\Roman{part}}
\hfill\vrule depth12pt width0pt
\hrule height3pt
\vtop to23.5pc{\vfill
\hyphenpenalty10000
\raggedright
\parfillskip=0pt
\LARGE\baselineskip=24pt\boldmath\bfseries\partfont 
\uppercase{#2}\vskip1pc
\hrule height 1pt
\vskip7pc}}}


\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \reset@font
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfill\newpage
              \if@twoside
                \hbox{}%
                \thispagestyle{empty}%
                \newpage
             \fi}


\def\and{\lowercase{and}\ }

\def\eatone#1{}
\def\oldauthor[#1]#2{{\ifnum\c@chapter<1
\vskip-2pc
\else
\vskip2pc
\ifnum\c@chapter>9\leftskip=4pc\else
\leftskip=3pc\fi\fi\let\\ \newline{#2}\vskip1sp}
{\let\\ \space \let\footnote\eatone\xdef\totoc{\tocauthorfont #1}}
\addtocontents{toc}{\vskip-2.5pt{\string\noindent\hskip24pt\totoc}}
\addtocontents{toc}{\vskip6pt}
}


\newif\iffirstprologue
\def\prologue#1#2{\iffirstprologue\vskip4pt
\global\firstprologuefalse\else
\vskip12pt\fi
{\leftskip=1pc
\parindent=0pt \small
\let\\ \newline#1\vskip1sp
\hbox to\textwidth{\hfill\def\two{#2}\ifx\two\empty\else---#2\fi}
}\vskip12pt}


\newdimen\SpaceAboveChapterNumber
\SpaceAboveChapterNumber=36pt

\def\chapter{\let\thetable\savethetable
\let\thefigure\savethefigure
\global\c@footnote=0
\global\probcount=0
\global\c@chapapp=0
\global\appendfalse
\renewcommand{\thechapter}{\arabic{chapter}}
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\let\savefootnote\footnote
\let\savefootnotetext\footnotetext

\newcount\savefootnotenumber
\newcount\ftnum
\newcount\saveftnum
\def\catchfootnote#1{%
\global\advance\ftnum by1
\expandafter\gdef\csname thecatchfootnote\the\ftnum\endcsname{#1}}

\def\zfnsymbol#1{\expandafter\@zfnsymbol\csname c@#1\endcsname}

\def\@zfnsymbol#1{\ensuremath{\ifcase#1\or \dagger\or \ddagger\or
   \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger \else\@ctrerr\fi}}

\def\zzfnsymbol#1{\expandafter\@zfnsymbol\csname c@#1\endcsname}

\def\@zzfnsymbol#1{\ensuremath{\ifcase#1 \dagger\or \ddagger\or
   \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger \else\@ctrerr\fi}}

\def\@chapter[#1]#2{\startonoddpage
\global\titletrue
%% no floats on chapter title page
\global\@topnum\z@
\global\@botnum\z@
%%
\ifnum\c@chapter=0\relax \ifnum\c@part=1 \else \setcounter{page}{1}
\global\@mainmattertrue% <<===
\fi\fi
%% if using answers.sty:
\expandafter\ifx\csname Closesolutionfile\endcsname \relax
\else
\Closesolutionfile{ans}\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\lowercase{\global\savefootnotenumber=\c@footnote
\global\ftnum=0
\setbox0=\hbox{\let\thanks\catchfootnote
\let\\ \relax\let\footnote\catchfootnote#2}
{\def\thefootnote{\zfnsymbol{footnote}}
\ifnum\ftnum<1 \else
\saveftnum\ftnum
\global\advance\saveftnum by1
\ftnum=1
\loop\ifnum\saveftnum>\ftnum
\advance\c@footnote by 1
\savefootnotetext{\csname thecatchfootnote\the\ftnum\endcsname}
\global\advance\ftnum by1
\repeat
\fi}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\gdef\thepage{\csname @arabic\endcsname\c@page}
%
\refstepcounter{chapter}% <<==== moved this here instead of below mainmatter
%% when using answers.sty,
%% to open an ans<chapnum> file to be used for solutions section
\expandafter\ifx\csname Opensolutionfile\endcsname\relax\else
\Opensolutionfile{ans}[ans\the\c@chapter]\fi
\let\dolabelnow\relax
{\def\label##1{\gdef\dolabelnow{\savelabel{##1}}}%
     \global\setbox0=\hbox{\def\\ {\relax}#2}}%
\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \typeout{\@chapapp\space\thechapter.}%
\let\thanks\eatone
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
\let\thanks\eatone
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
\let\thanks\eatone
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                      \@makechapterhead{{
\def\thanks##1{$^{\zfnsymbol{footnote}}$}
\def\\ {\vskip1sp}\uppercase{#2}}}%
\dolabelnow
                      \@afterheading
                    \lowercase{\global\c@footnote\savefootnotenumber}}

\def\@makechapterhead#1{% 
\vglue10pt
\SpaceAboveChapterNumber=36pt
  {\parindent \z@ 
    \interlinepenalty\@M
\Large
\hbox to\textwidth{\hbox{\chapternumberfont CHAPTER
\the\c@chapter}\hfill\vrule depth12pt width0pt}
\hrule height3pt
\vtop to22.5pc{\vfill
\hyphenpenalty10000
\raggedright
\parfillskip=0pt
\LARGE\boldmath\bfseries\chaptertitlefont 
#1\vskip1pc
\hrule height 1pt
\vskip7pc}}
\dooffprintinfo}

\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi\global\titletrue\relax}

\def\@makeschapterhead#1{%
  \vspace*{14pc}%
\noindent{\Large\bfseries\chaptertitlefont
\uppercase{#1}}\nobreak
\vskip1pc\hrule height1pt\vskip7.5pc}

\let\title\chapter

\newcount\c@chapapp
\def\chapappendix#1{\par
\global\advance\c@chapapp by 1
  \setcounter{section}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
  \setcounter{equation}{0}%
  \renewcommand{\@chapapp}{\appendixname}%
  \renewcommand{\thechapter}{%\the\c@chapter.
\Alph{chapapp}}
\renewcommand{\thetable}{\the\c@chapter-\thechapter.\@arabic\c@table\theletter}
\renewcommand{\thefigure}{\the\c@chapter-\thechapter.\@arabic\c@figure\theletter}
\def\one{#1}\ifx\one\empty
\section*{Appendix}
\markright{APPENDIX}
\addcontentsline{toc}{schapter}{\protect\numberline{Chapter Appendix}}
\else
\section*{Appendix: #1}
\markright{APPENDIX}
\addcontentsline{toc}{schapter}{\protect\numberline{Appendix: #1}}
\fi
}


%%% <<=== end Chapter, Part, and Appendix Commands 


%%% Counters ===>>
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]

%%% <=== end counters

%%% Header Level Names ==>>
\renewcommand{\thepart}         {\Roman{part}}
\renewcommand{\thechapter}      {\arabic{chapter}}
\renewcommand{\thesection}      {\thechapter.\arabic{section}}
\renewcommand{\thesubsection}   {\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection .\arabic{subsubsection}}
\renewcommand{\theparagraph}    {\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph} {\theparagraph.\arabic{subparagraph}}
\newcommand{\@chapapp}{\chaptername}

%%% <<== End Header Level Names


%%% Section Commands ====>>>>

% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
%            optional * [ALTHEADING]{HEADING}
%    Generic command to start a section.
%    NAME       : e.g., 'subsection'
%    LEVEL      : a number, denoting depth of section -- e.g., chapter=1,
%                 section = 2, etc.
%    INDENT     : Indentation of heading from left margin
%    BEFORESKIP : Absolute value = skip to leave above the heading.
%                 If negative, then paragraph indent of text following
%                 heading is suppressed.
%    AFTERSKIP  : if positive, then skip to leave below heading, else
%                 negative of skip to leave to right of run-in heading.
%    STYLE      : commands to set style
%  If '*' missing, then increments the counter.  If it is present, then
%  there should be no [ALTHEADING] argument.
%  Uses the counter 'secnumdepth' whose value is the highest section
%  level that is to be numbered.



\newcommand{\section}{\@startsection {section}{1}{\z@}%
                                   {-22pt plus -1pt minus -6pt
}%
                                   {13pt}%
                                   {\reset@font\large\bfseries\boldmath\sectionfont}}
\newcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-16pt plus -1pt minus -3pt
}%
                                     {8pt}%
                                 {\reset@font\large\bfseries\boldmath\subsectionfont}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                     {-12pt plus -1pt minus -6pt
}%
                                     {-1em}
                           {\reset@font\normalsize\bfseries\boldmath\subsubsectionfont}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
                                    {-12pt}%
                                    {-1em}%
                               {\reset@font\normalsize\bfseries\paragraphfont}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\reset@font\normalsize\bfseries}}

%%% <<=== end section commands


%%% Verse, Quote, Extract ==>>

\newenvironment{verse}
               {\let\\=\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item[]}
               {\endlist}
\newenvironment{quotation}
               {\small
\list{}{\listparindent \parindent%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item[]}
               {\endlist}
\newenvironment{quote}
               {\small
\list{}{\rightmargin\leftmargin}%
                \item[]}
               {\endlist}
\let\extract\quotation
\let\endextract\endquotation
%% <<== end Verse, Quote, Extract 


%%% Math ===>>>

\@addtoreset{equation}{chapter}
\renewcommand{\theequation}{\thechapter.\arabic{equation}}

%%% easy way to do bold math
\def\dobold#1{\hbox{\boldmath$\displaystyle #1$\unboldmath}}
\let\mathbold\dobold

%% make box around math in equation or display environment
\def\boxit#1{{\fboxsep=6pt\ifmmode
\fbox{$\displaystyle #1$}
\else
\vskip14pt{\centerline{\fbox{\vtop{\vskip-9pt\vskip1sp\advance\hsize-41pt #1\vskip-8pt}}}\vskip14pt}\fi}}

%%% <<<=== end Math 


%%% Figure and Table Captions ==>>>
\newcounter{figure}[chapter]
\renewcommand{\thefigure}{\thechapter.%
\@arabic\c@figure\theletter}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand{\thetable}{\thechapter.\@arabic\c@table\theletter}

\let\savethetable\thetable
\let\savethefigure\thefigure


\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}

\def\xfigure{figure}

\long\def\@makecaption#1#2{%
\vskip\abovecaptionskip
{\small\hyphenpenalty10000
\ifx\@captype\xfigure
\ifcontinued\global\advance\c@figure -1\fi
\else
\ifcontinued\global\advance\c@table -1\fi
\fi%
 \sbox\@tempboxa{{\fignumfont#1 \ifcontinued (Continued)\fi
\quad \ifx\@captype\xfigure\figtextfont\else
\tabtextfont\fi\let\newline\ #2}}%
  \ifdim \wd\@tempboxa >.9\hsize \hyphenpenalty10000
\fignumfont #1 \ifcontinued (Continued)\fi\quad
\ifx\@captype\xfigure\figtextfont\else
\tabtextfont\fi#2\par
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
\ifx\@captype\xfigure
  \vskip\belowcaptionskip
\else
\vskip3pt\fi
\gdef\theletter{\relax}
\global\continuedfalse
}}


\newif\ifsettotop


\def\@xfloat#1[#2]{%
\def \@captype {#1}\def \@fps {#2}\@onelevel@sanitize \@fps 
\def \reserved@b {!}\ifx \reserved@b \@fps \@fpsadddefault \else 
\ifx \@fps \@empty \@fpsadddefault \fi \fi 
\ifhmode \@bsphack \@floatpenalty -\@Mii \else \@floatpenalty -\@Miii \fi 
\ifinner \@parmoderr \@floatpenalty \z@ 
\else \@next \@currbox \@freelist {\@tempcnta \sixt@@n 
\expandafter \@tfor \expandafter \reserved@a \expandafter :\expandafter 
=\@fps \do {\if \reserved@a h\ifodd \@tempcnta \else \advance \@tempcnta \@ne 
\fi \fi \if \reserved@a t\@setfpsbit \tw@ \global\settotoptrue\fi 
\if \reserved@a b\@setfpsbit 4\fi 
\if \reserved@a p\@setfpsbit 8\fi 
\if \reserved@a !\ifnum \@tempcnta >15 
\advance\@tempcnta -\sixt@@n\relax\fi \fi }\@tempcntb 
\csname ftype@\@captype \endcsname \multiply \@tempcntb \@xxxii \advance 
\@tempcnta \@tempcntb \global \count \@currbox \@tempcnta }\@fltovf \fi 
\global \setbox \@currbox \color@vbox \normalcolor \vbox \bgroup 
\ifx\@captype\xtable
\ifsettotop
\vglue-6pt
\fi\fi\global\settotopfalse
\hsize \columnwidth \@parboxrestore \@floatboxreset}

\let\savetabular\tabular
\def\tabular{\tablefontsize\baselineskip=12pt\savetabular}

\@namedef{tabular*}#1{\def\@halignto{to#1}
\tablefontsize\baselineskip12pt\@tabular}

\def\@array[#1]#2{%
  \if #1t\vtop \else \if#1b\vbox \else \vcenter \fi\fi
  \bgroup
  \setbox\@arstrutbox\hbox{%
    \vrule \@height\arraystretch\ht\strutbox
           \@depth\arraystretch \dp\strutbox
           \@width\z@}%
  \@mkpream{@{}#2@{}}%
  \edef\@preamble{%
    \ialign \noexpand\@halignto
      \bgroup \@arstrut \@preamble \tabskip\z@skip \cr}%
  \let\@startpbox\@@startpbox \let\@endpbox\@@endpbox
  \let\tabularnewline\\%
    \let\par\@empty
    \let\@sharp##%
    \set@typeset@protect
    \lineskip\z@skip\baselineskip\z@skip
    \ifhmode \@preamerr\z@ \@@par\fi
    \@preamble}

\def\tablenotes{\vskip2pt\footnotesize}
\let\endtablenotes\relax

%% to accomodate earlier versions of wileysix and wileysev:
\let\savehline\hline

\let\hline\savehline
\def\arraystretch{1.25}

%%%%%%%%% Lettered Captions

\def\theletter{\relax}
\newif\ifxfirsttime
\xfirsttimetrue

\def\caption{\ifx\@captype\xtable
\ifx\theletter\xrelax
\global\xfirsttimetrue\refstepcounter\@captype\else
\ifxfirsttime\global\xfirsttimefalse\refstepcounter\@captype\fi\fi
\else
\ifx\theletter\xrelax
\global\xfirsttimetrue\refstepcounter\@captype\else
\ifxfirsttime\global\xfirsttimefalse\refstepcounter\@captype\fi\fi\fi
\edef\@currentlabel{\expandafter\csname p@\@captype\endcsname%
\expandafter\csname the\@captype\endcsname}
\xdef\currcaptype{\@captype}
\@dblarg{\@caption\@captype}}

\def\letteredcaption#1{\gdef\theletter{#1}\caption}

\newif\ifcontinued
\def\continuedcaption{\global\continuedtrue\caption}

%%% <<=== end Figure and Table Captions


%%% Table of Contents, List of Figures, LOT ===>>

\newcommand{\@pnumwidth}{1.55em}
\newcommand{\@tocrmarg} {2.55em  plus .5in}
\newcommand{\@dotsep}{4.5}

\def\startonoddpage{\clearpage
\ifodd\c@page\else\null\thispagestyle{empty}\newpage\fi}

\newcommand{\tableofcontents}{%
\startonoddpage
\global\titletrue
    \chapter*{\contentsname}
        \@mkboth{\uppercase{\contentsname}}{\uppercase{\contentsname}}%
\vskip-9pt
\bgroup\parskip=0pt
\chapskip=26pt
\authorskip=-6pt
\chapheight3pt
\partskip=-8pt
{\normalsize\tocfonts\baselineskip=14pt
\hyphenpenalty=10000
    \@starttoc{toc}%
}
\egroup
    \if@restonecol\twocolumn\fi

\newpage
\markboth{}{}
    }

\def\splitintwo#1.#2*{\llap{#1}\rlap{.#2}}

\newcommand{\listoftables}{%
\startonoddpage
\global\titletrue
    \chapter*{List of Tables
        \@mkboth{\uppercase{List of Tables}}{\uppercase{List of Tables}}}%
\addcontentsline{toc}{schapter}{List of Tables}
\vskip-9pt
\bgroup\parskip=2pt
{\def\numberline##1{\def\one{##1}%
\hb@xt@\@tempdima{\expandafter\splitintwo\one*\hfil}}
\normalsize\tocfonts
\hyphenpenalty=10000
    \@starttoc{lot}%
}
\egroup
    \if@restonecol\twocolumn\fi
\newpage
\markboth{}{}
    }



\newcommand{\listoffigures}{%
\startonoddpage
\global\titletrue
    \chapter*{List of Figures
        \@mkboth{\uppercase{List of Figures}}{\uppercase{List of Figures}}}%
\addcontentsline{toc}{schapter}{List of Figures}
\vskip-9pt
\bgroup\parskip=2pt
{\def\numberline##1{\def\one{##1}%
\hb@xt@\@tempdima{\expandafter\splitintwo\one*\hfil}}
\normalsize\tocfonts
\hyphenpenalty=10000
    \@starttoc{lof}%
}
\egroup
    \if@restonecol\twocolumn\fi
\newpage
\markboth{}{}
    }

\newskip\partskip

\def\l@part#1#2{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
\vskip16pt
    \begingroup
      {\centering\leavevmode\chaptocfont
         \uppercase{Part\ \/ #1}
\vskip8pt
\vskip\partskip
}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}
    \endgroup
\vskip1sp
  \fi}

\def\l@chapter#1#2{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 10pt \@plus\p@
     \setlength\@tempdima{2.5em}%
    \begingroup
\let\numberline\xnumberline
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
\chaptocfont 
#1\nobreak\hfil \nobreak\hbox 
to\@pnumwidth{\hss\chaptocfont #2}\par
      \penalty\@highpenalty
    \endgroup
\vskip4pt
  \fi}

\def\l@schapter#1#2{%
  \ifnum \c@tocdepth >1
    \addpenalty{-\@highpenalty}%
    \vskip 3pt \@plus\p@
     \setlength\@tempdima{2.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
%\chaptocfont 
#1\nobreak\hfil \nobreak\hbox 
to\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
\vskip1sp
  \fi}


\def\l@sschapter#1#2{%
  \ifnum \c@tocdepth >1
    \addpenalty{-\@highpenalty}%
    \vskip 6pt \@plus\p@
     \setlength\@tempdima{2.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
\bf
#1\nobreak\hfil \nobreak\hbox 
to\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
\vskip1sp
  \fi}

\def\l@achapter#1#2{%
  \ifnum \c@tocdepth >0
    \addpenalty{-\@highpenalty}%
    \vskip 6pt 
     \setlength\@tempdima{2.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode 
      \advance\leftskip\@tempdima
      \hskip -\leftskip
\chaptocfont 
#1\nobreak\hfil \nobreak\hbox 
to\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
\vskip4pt
  \fi}

% \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE} :
%   Macro to produce a table of contents line with the following
%   parameters:
%     LEVEL    : If LEVEL > \c@tocdepth, then no line produced.
%     INDENT   : Total indentation from the left margin.
%     NUMWIDTH : Width of box for number if the TITLE has a
%                \numberline command.
%                As of 25 Jan 88, this is also the amount of extra indentation
%                added to second and later lines of a multiple line entry.
%     TITLE    : Contents of entry.
%     PAGE     : Page number.
%
%  Uses the following parameters, which must be set by the document style.
%  They should be defined with \def's.
%    \@pnumwidth : Width of box in which page number is set.
%    \@tocrmarg  : Right margin indentation for all but last line of
%                  multiple-line entries.
%    \@dotsep    : Separation between dots, in mu units.  Should be \def'd to
%                  a number like 2 or 1.7
%
\def\@dottedtocline#1#2#3#4#5{%
\ifnum #1>\c@tocdepth \else \vskip 1sp {\leftskip #2\relax%
\rightskip \@tocrmarg  \parfillskip -\rightskip \parindent #2\relax%
\@afterindenttrue \interlinepenalty \@M \leavevmode \@tempdima #3\relax %
\advance \leftskip \@tempdima \hbox {}\hskip -\leftskip #4%
\nobreak% \leaders \hbox {$\m@th \mkern%
% \@dotsep mu.\mkern \@dotsep mu$}
\hfill\nobreak\hbox to\@pnumwidth {\hfil #5}\par }\fi}

\newskip\tabandfigskip
\tabandfigskip=6pt plus 3pt minus 3pt
\def\l@table{\setlength\@tempdima{18pt}%
\vskip\tabandfigskip
\@dottedtocline{1}{1.5em}{3.5em}}
\def\l@figure{\setlength\@tempdima{18pt}%
\vskip\tabandfigskip
\@dottedtocline{1}{1.5em}{3.5em}}

\def\l@section{\setlength\@tempdima{18pt}%
\@dottedtocline{1}{2.5em}{3em}}%was 2.3em
\def\l@subsection{\@dottedtocline{2}{5.5em}{3.6em}}% #3 was 3.4em
\def\l@subsubsection{\@dottedtocline{3}{7em}{5.1em}} %was 4.1em
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}


%%% <<=== end TOC

%%% Bibliography, References, Acknowledgements ===>>

%%%%%% Chapter Bibliography Using BibTeX

\def\chapbibliography{%
{\let\thebibliography\thechapbibliography
\let\endthebibliography\endthechapbibliography
\@input {\jobname.bbl}}
}

\def\thechapbibliography#1{\section*{References}
\markright{REFERENCES}
\addcontentsline{toc}{schapter}{References}
\small
\labelsep 5pt
\list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m}

\def\endthechapbibliography{%
  \endlist}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\newblock{}

\let\save@lbibitem\@lbibitem
\let\save@bibitem\@bibitem
\def\@lbibitem{\def\@biblabel##1{[##1]}
\save@lbibitem}

\def\@bibitem{\labelsep=5pt\def\@biblabel##1{##1.}\save@bibitem}

\def\bibitem{\@ifnextchar[\@lbibitem\@bibitem}


%% to get rid of the extra argument used for thebibliography,
%% when redefinining thebibliography to be chapreferences:
\def\chapthebibliography#1{\chapreferences}
\let\endchapthebibliography\endchapreferences

\def\chapreferences#1{\ifvmode\vskip-\lastskip\fi
\vskip8pt\vskip1sp\section*{REFERENCES}
\addcontentsline{toc}{schapter}{References}
\bgroup
\small
\list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m
}

\def\endchapreferences{\endlist\egroup}

\def\thebibliography#1{\startonoddpage
\global\titletrue\dooffprintinfo
\chapter*{References}
\markboth{REFERENCES}{REFERENCES}
\addcontentsline{toc}{schapter}{References}
\small
\labelsep 5pt
\list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m}

\def\endthebibliography{%
  \endlist}

\def\references{\bgroup\thebibliography}
\def\endreferences{\endthebibliography\egroup}


%% end Bibliography, References and Acknowledgments


%%% Footnotes ===>>>

%  \renewcommand{\footnoterule}{%
%  \kern-3\p@
%  \hrule width .4\columnwidth
%  \kern 2.6\p@}

  \let\footnoterule\relax

\@addtoreset{footnote}{chapter}

\long\def\@makefntext#1{%
    \parindent 1em%
    \noindent
    \@makefnmark#1}

\newcount\footnum
\newcount\savefootnum
\def\endnote#1{\global\advance\footnum by 1\relax$^{\the\footnum}$%
\long\expandafter\gdef\csname foot\the\footnum\endcsname{%
\vtop{\footnotesize\hsize=\textwidth\leftskip=12pt\relax\parindent=-12pt
\indent\hbox to12pt{\the\footnum.\hfill}{#1\strut\vskip1sp}}\vskip1pt}}

\def\endnotetext#1{\global\advance\footnum by 1\relax
\long\expandafter\gdef\csname foot\the\footnum\endcsname{%
\vtop{\footnotesize\hsize=\textwidth\leftskip=12pt\relax\parindent=-12pt
\indent\hbox to12pt{\the\footnum.\hfill}{#1\strut\vskip1sp}}\vskip1pt}}

\newif\ifrefnoteused
\def\refnote{\ifrefnoteused\else\global\refnoteusedtrue
\typeout{^^J^^J!!! ===>>>^^J
Please do not use the command \string\refnote.^^J
Instead write a standard LaTeX reference and use \string\cite
^^J<<<=== !!!^^J^^J}\fi}

\def\notes{\ifnum\footnum=0\else
\savefootnum=\footnum
\footnum=0
\noindent\loop\ifnum\savefootnum>\footnum%
\global\advance\footnum by1\relax%
\csname foot\the\footnum\endcsname\relax%
\expandafter\gdef\csname foot\the\footnum\endcsname{\relax}\relax%
\repeat\global\footnum=0\relax\fi}

\def\note{\hfill}


%%% <<<=== End Footnotes



%%% Running heads ===>>>

%% unless we need these, leave these uncommented
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble

\def\ps@headings{\let\@mkboth\markboth
 \def\@oddfoot{\rlap{\ifoffprintinfo\global\offprintinfofalse%
\printoffprintinfo\fi}%
\iftitle\global\titlefalse{\hfill\foliofont\thepage}\fi}
 \def\@evenfoot{\iftitle\global\titlefalse{\foliofont\thepage\hfill}\fi
\llap{\ifoffprintinfo\global\offprintinfofalse%
\printoffprintinfo\fi}%
}
 \def\@evenhead{\iftitle\else{\foliofont \thepage}\hskip1.5pc%
\footnotesize\runningheadfont\MakeUppercase\leftmark\fi\hfill}
 \def\@oddhead{\hfill\iftitle\else{\footnotesize\runningheadfont 
\MakeUppercase\rightmark}\hskip1.5pc%
\foliofont\thepage\fi}%
 \def\chaptermark##1{\markboth {\uppercase{##1}}{}}%
 \def\sectionmark##1{\markright {\uppercase{##1}}}}

\markboth{}{}

\ps@headings

\pagestyle{headings}
\pagenumbering{roman}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% Special Use Fonts
%%

%% Computer Modern font calls. These will be redefined
%% if PostScript fonts are used.
%%
%% \documentclass{wileysix} 
%% \usepackage{w-bookps}
%%  will use PostScript fonts.

%% \documentclass{wileysix} will use Computer Modern fonts.


%% Times-Roman
\def\timesroman{cmr10 }
\def\timesbold{cmbx10 }
\def\timesitalic{cmti10 }
\def\timesbolditalic{cmbx10 }

%% Helvetica
\def\helvetica{cmss10 }
\def\helveticabold{cmssbx10 }
\def\helveticaboldoblique{cmssi10 }
\def\helveticaoblique{cmssi10 }

%% Special Use Fonts
%%
%% Table of Contents
\font\tocarttitlefont=\helveticabold at 12pt
\font\chaptocfont=\helveticabold at 10pt
\font\tocfonts=\timesroman at 10pt


%% Running heads
\font\runningheadfont=\helvetica at6,5pt
\font\foliofont=\helveticabold at 9pt

%% Book Title, Half title page

\font\halftitlefont=\helveticabold at 20pt
\font\titlefont=\helveticabold at 27pt
\font\subtitlefont=\helveticabold at 20pt
\font\editionfont=\helvetica at 14pt
\font\authorfont=\helveticabold at 11pt
\font\affilfont=\helvetica at 10pt
\font\locfont=\timesbolditalic at 7pt

\font\wileyfont=\helveticabold at 10pt
\font\imprintfont=\helvetica at 10pt

%% Part Title
\font\partfont=\helvetica at 24pt
\font\partnumberfont=\helveticabold at 14pt

%% Chapter Title 
\font\chapternumberfont=\helveticabold at 14pt
\font\chaptertitlefont=\helvetica at 18pt

%% Section heads
\font\sectionfont=\timesbold at 10pt
\font\subsectionfont=\helveticabold at 10pt
\font\subsubsectionfont=\helveticaboldoblique at 10pt
\font\paragraphfont=\helveticaoblique at 10pt

%% Caption 
\font\fignumfont=\timesbold at 9pt
\font\tabnumfont=\timesbold at 9pt
\font\figtextfont=\timesroman at 9pt
\font\tabtextfont=\timesroman at 9pt

%% Table fonts
\def\tablefontsize{\small}
\def\tablefootnotesize{\footnotesize}

%% References/Bibliography
\def\bibfontsize{\small}

%% Text fonts
\font\bit=\timesbolditalic at 8pt

%% Fake Small Caps
\font\bigscfont\timesroman at 9.5pt
\font\smscfont\timesroman at 7.5pt
\font\wherefont\timesitalic at 8pt

%% Problem Sets
\font\probfont\timesbolditalic at 10pt


%%% <=== end special use fonts

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Fake Small Caps

% To use: \fakesc some stuff*
%% \bigscfont, \smscfont are listed in font section above.

\def\fakesc#1*{\edef\stuff{#1 }%
\expandafter\pickupnewword\stuff* }
\def\saveast{*}

\def\rrelax{\relax}

\def\pickupnewlett#1{\def\letter{#1}%
\ifx\letter\saveast\unskip% 
\let\go\relax \else%  
\ifx\letter\rrelax{\bigscfont\ }%
\let\go\pickupnewword\else% 
\uppercase{\def\ucletter{#1}%  upper case letter
\ifx\letter\ucletter%
{\bigscfont#1}\else{\smscfont#1}\fi}%% 
\let\go\pickupnewlett\fi\fi\go}

\def\pickupnewword#1 {\expandafter\pickupnewlett#1\relax}
%% <== end fakesc

%% ==> glossary
\def\glossary{\startonoddpage\global\titletrue
\dooffprintinfo
\markboth{GLOSSARY}{GLOSSARY}
\chapter*{Glossary}
\addcontentsline{toc}{schapter}{Glossary}
\everypar={}
\bgroup
\leftskip=1in \parindent=-1in
\def\term##1{\vskip3pt\indent\hbox to 1in{##1\hfill}\relax}}
\def\endglossary{\vskip12pt\egroup\newpage
\markboth{}{}
}
%% <==

%% ==> acronyms
\def\acronyms{\startonoddpage\global\titletrue
\dooffprintinfo
\markboth{ACRONYMS}{ACRONYMS}
\chapter*{Acronyms}
\addcontentsline{toc}{schapter}{Acronyms}
\everypar={}
\bgroup
\normalsize
\leftskip=1pc \parindent=-1pc
\def\term##1{\vskip2pt{\bf ##1}\hskip1em\relax}}
\def\endacronyms{\vskip12pt\egroup\newpage
\markboth{}{}
}

\def\acro#1#2{\vskip4pt\hbox to\textwidth{\normalsize
\hbox to5pc{#1\hfill}\vtop{\advance\hsize by
-5pc\raggedright\noindent#2}}}

%% <==

%% ==> symbols
\def\symbols{\startonoddpage\global\titletrue
\dooffprintinfo
\markboth{LIST OF SYMBOLS}{LIST OF SYMBOLS}
\chapter*{Symbols}
\addcontentsline{toc}{schapter}{List of Symbols}
\everypar={}
\bgroup\leftskip=1pc \parindent=-1pc
\def\term##1{\vskip2pt{$##1\,$}\hskip1em\relax}}
\def\endsymbols{\vskip12pt\egroup
\newpage
\markboth{}{}
}
%% <== symbols



%%%%%%%%%%%%%%%%%%%%%%%
%% Index ===>>>

\makeindex
% latex default
%% Use \latexprintindex instead of \printindex to
%% get the default latex index.

%% Contents of makeidx.sty contained in \latexprintindex command.
%% This is because \printindex is defined in this package so
%% user doing \usepackage{makeidx} will get error message.

\providecommand*\seealso[2]{\emph{\alsoname} #1}
\providecommand*\alsoname{see also}

\newcommand\printindex{\startonoddpage
\def\see##1##2{\emph{\seename} ##1}
\def\seename{see}
\@input@{\jobname.ind}}

\def\indexname{Index}

\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\uppercase{\indexname}}%
                        {\uppercase{\indexname}}%
 \addcontentsline{toc}{schapter}{\indexname}
\global\titletrue\dooffprintinfo
\parindent\z@
    \parskip\z@ \@plus .3\p@\relax
    \let\item\@idxitem
\spaceskip=3pt plus 2pt minus 1pt\xspaceskip=\spaceskip
\footnotesize\baselineskip=10pt plus 1pt minus 1pt}
               {\pagestyle{headings}
\if@restonecol\onecolumn\else
\clearpage\fi}

\newcommand{\@idxitem}  {\par\hangindent 40\p@}
\newcommand{\subitem}   {\par\hangindent 40\p@ \hspace*{20\p@}}
\newcommand{\subsubitem}{\par\hangindent 40\p@ \hspace*{30\p@}}
\newcommand{\indexspace}{\par\vskip 10\p@ \@plus0\p@ \@minus3\p@\relax}

\def\multiprintindex#1#2{\startonoddpage
\def\see##1##2{\emph{\seename} ##1}
\def\seename{see}
\def\indexname{#2}
\markboth{#2}{#2}
\input #1.ind}

\newskip\iletterskip
\iletterskip=8pt plus .1pt minus 2pt
\def\iletter#1{\goodbreak\vskip\iletterskip{\sectionfont\uppercase{#1}\vrule depth 8pt width0pt}\nobreak}

\def\seealso#1{\hskip16pt{\it See also\ }{#1}}

\def\ltr#1{\nobreak\vskip\iletterskip
\hrule
\nobreak
\vskip3pt
{\bf#1}
\nobreak
\vskip\iletterskip}


%%%%%%%%%%%%%%
% Draft

\def\draft{\global\drafttrue
\def\@oddfoot{\vtop to 0pt{\vskip24pt\large\tt
D R A F T\hfill\today, \realtime\hfill D R A F T\global\titlefalse\vss}}
\def\@evenfoot{\@oddfoot}\normalsize}

\def\fix{\ifcase\oldtime 0\or0\or0\or%
0\or0\or0\or0\or0\or0\or0\fi}
\def\fixtiming{\ifcase\timing 0\or0\or0\or% 
0\or0\or0\or0\or0\or0\or0\fi}
\newcount\timing 
\newcount\hourcount
\newcount\oldtime 

\def\realtime{\timing=\time \oldtime=\time
\ifnum\timing>60 \divide\timing by 60
\hourcount=\the\timing
\multiply\timing by 60
\advance\oldtime by-\timing
\ifnum\hourcount<12 \number\hourcount:\fix\number\oldtime am\fi%
\ifnum\hourcount=12 \number\hourcount:\fix\number\oldtime pm\fi%
\ifnum\hourcount>12 \advance\hourcount by-12
\number\hourcount:\fix\number\oldtime pm\fi
\else12:\fixtiming\number\timing am\fi}

\newcommand{\today}{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Problem Set Macros

\newcount\probcount
\newcount\subprobcount
\newcount\c@subproblem
\def\problems{
\global\probcount=0
\global\subprobcount=0
\global\c@subproblem=0
\goodbreak\vskip12pt
\markright{PROBLEMS}
\addcontentsline{toc}{section}{\protect\numberline{}Problems}
\noindent{\sectionfont\uppercase{Problems}\vrule depth 4pt width0pt}\markright{PROBLEMS}\nobreak}

\long\def\xappendixname{\appendixname}%

\def\endproblems{\xdef\@currentlabel{\thechapter}}
\def\appendchapt{\Alph {chapter}}
\def\prob{\ifx\@chapapp\xappendixname
\let\go\aprob\else\let\go\chapprob\fi\go}
\def\subprob{\ifx\@chapapp\xappendixname
\let\go\asubprob\else\let\go\chapsubprob\fi\go}


\def\aprob{\vskip6pt
\leftskip=0pt
\global\c@subproblem=0
\global\advance\probcount by1
\xdef\@currentlabel{\Alph{chapter}.\the\probcount}
\noindent{\bf\Alph{chapter}.\the\probcount\hskip12pt\relax}}


\def\asubprob{\vskip1pt
\global\advance\c@subproblem by1
\leftskip=39pt
\xdef\@currentlabel{\Alph{chapter}.\the\probcount.\alph{subproblem}}
%
\noindent\hbox to 0pt{\hss\bf\alph{subproblem})\ \ }\relax}


\newcount\c@subproblem

\def\chapprob{\vskip6pt
\leftskip=0pt
\global\c@subproblem=0
\global\advance\probcount by1
\xdef\@currentlabel{\the\c@chapter.\the\probcount}
\noindent{\bf\the\c@chapter.\the\probcount\hskip12pt\relax}}

\def\chapsubprob{\vskip1pt
\global\advance\c@subproblem by1
\leftskip=39pt
\xdef\@currentlabel{\the\c@chapter.\the\probcount.\alph{subproblem}}
%
\noindent\hbox to 0pt{\hss\alph{subproblem})\ \ }\relax}

\def\sidebysideprob#1#2{\centerline{\vtop{\hsize=.475\textwidth
\prob #1}\hfill\vtop{\hsize=.475\textwidth \prob #2}}}

\def\sidebysidesubprob#1#2{\centerline{\vtop{\hsize=.475\textwidth
\subprob #1}\hfill\vtop{\hsize=.475\textwidth \subprob #2}}}

%%%% <<==  end of problem set macros 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Exercises


\def\exercises{\goodbreak\vskip12pt
\markright{EXERCISES}
\addcontentsline{toc}{section}{\protect\numberline{}Exercises}
\section*{EXERCISES}
\global\probcount=0
\global\subprobcount=0
\global\c@subproblem=0
\markright{EXERCISES}\nobreak}

\def\endexercises{\vskip1sp\xdef\@currentlabel{\thechapter}}

\let\exer\prob
\let\subexer\subprob
\let\sidebysideexer\sidebysideprob
\let\sidebysidesubexer\sidebysidesubprob



%%%% <<==  end of exercise macros 


\pagenumbering{roman}
\widowpenalty10000
\clubpenalty10000

%%%%%
%%%% side by side
%%%% to use: 
% \begin{figure or table} \sidebyside{}{} \end{figure or table}
%
% \begin{table} 
% \sidebyside{\caption{table caption} first table}
% {\caption{table caption} second table}
% \end{table}

% or

% \begin{figure} 
% \sidebyside{\vskip<dimen>\caption{fig caption}}
% {\vskip<dimen>\caption{fig caption}}
% \end{figure}

%% To label for cross referencing, use \label after and <outside> of
%% \caption{}

% \begin{table} 
% \sidebyside{\caption{table caption}\label{tab1}
% first table}
% {\caption{table caption}\label{tab2} second table}
% \end{table}

% or

% \begin{figure} 
% \sidebyside{\vskip<dimen>\caption{fig caption}\label{fig1}}
% {\vskip<dimen>\caption{fig caption}\label{fig2}}
% \end{figure}



\long\def\sidebyside#1#2{%
\hbox to\textwidth{\vtop{\hsize=.5\textwidth%
\advance\hsize by -.5\columnsep
\parindent=0pt
\centering
 
#1\vskip1sp}\hskip\columnsep\vtop{\hsize=.5\textwidth%
\advance\hsize by -.5\columnsep
\parindent=0pt
\centering
#2

}\hfill}}

\def\copyrightpage{\thispagestyle{empty}%
\vbox to\textheight\bgroup\vfill\obeylines\obeyspaces\xcopyrightpage}

\def\xcopyrightpage#1#2\end#3{\scriptsize\parindent=0pt
Copyright \copyright{#1} by John Wiley \& Sons, Inc. All rights reserved.
\vskip6.5pt
Published by John Wiley \& Sons, Inc., Hoboken, New Jersey.\\
Published simultaneously in Canada.
\vskip6.5pt

No part of this publication may be reproduced, stored in a retrieval
system, or transmitted in any form\\ or by any means, electronic,
mechanical, photocopying, recording, scanning, or otherwise, except
as\\ permitted under Section 107 or 108 of the 1976 United States
Copyright Act, without either the prior\\ written permission of the
Publisher, or authorization through payment of the appropriate
per-copy fee to\\ the Copyright Clearance Center, Inc., 222 Rosewood
Drive, Danvers, MA 01923, (978) 750-8400,\\ fax (978) 646-8600, or on
the web at www.copyright.com. Requests to the Publisher for
permission should\\ be addressed to the Permissions Department, John
Wiley \& Sons, Inc., 111 River Street, Hoboken, NJ\\ 07030, (201)
748-6011, fax (201) 748-6008.  \vskip10pt

Limit of Liability/Disclaimer of Warranty: While the publisher and
author have used their best efforts in\\ preparing this book, they
make no representations or warranties with respect to the accuracy
or\\ completeness of the contents of this book and specifically
disclaim any implied warranties of\\ merchantability or fitness for a
particular purpose.  No warranty may be created or extended by
sales\\ representatives or written sales materials.  The advice and strategies contained herin may not be\\
suitable for your situation. You should consult with a professional
where appropriate.  Neither the\\
publisher nor author shall be liable for any loss of profit or any other commercial damages, including\\
but not limited to special, incidental, consequential, or other damages.
\vskip10pt
For general information on our other products and services please contact our Customer Care\\ Department with the U.S. at 877-762-2974, outside the U.S. at
317-572-3993 or fax 317-572-4002.
\vskip10pt
Wiley also publishes its books in a variety of electronic formats. Some content that appears in print,\\
however, may not be available in electronic format.
\vskip10pt
{\locfont Library of Congress Cataloging-in-Publication Data:}
\vskip8pt
#2
Printed in the United States of America.\\

10\ \ 9\ \ 8\ \ 7\ \ 6\ \ 5\ \  4\ \ 3\ \ 2\ \ 1 
\vskip24pt
\egroup\let\@badend\relax\endgroup}

\let\endcopyrightpage\relax

\def\seriespage{\newpage\thispagestyle{empty}\vbox to\textheight\bgroup\vfill
\leftskip=34pt \rightskip=-34pt}
\def\endseriespage{\vskip6pt{\noindent\hskip-12pt
A complete list of the titles in this series appears at the end of this
volume.} \vskip24pt\egroup
\newpage}
\def\series#1#2{\noindent\hskip-12pt\uppercase{#1}\\
\global\setbox0=\hbox{\footnotesize#2}
\hsize=\wd0
\footnotesize#2}

\def\eds#1{\vskip6pt\footnotesize\noindent Editors: {\it #1}}

%%%%%%%%%%%%
%% Off print info

\newif\ifoffprintinfo
\def\dooffprintinfo{\global\offprintinfotrue}

\def\copyrightyear#1{\def\thecopyrightyear{#1}}

\copyrightyear{\the\year}

\def\dofnote#1#2{\vtop{\hyphenpenalty=10000
\advance\hsize -10pt \raggedright
\footnotesize{\it #1. }\\{By #2}
\noindent\hbox{\footnotesize
Copyright \copyright\ \thecopyrightyear\ John Wiley \&
Sons, Inc.}}}


\def\offprintinfo#1#2{
\def\theoffprint{\bgroup\frenchspacing
\dofnote{#1}{#2}
\egroup}}

\def\x@makefntext#1{    
\kern-3\p@
\hrule\@width.4\columnwidth
\kern2.6\p@
\vrule height 9pt width0pt \relax
#1}

\def\offprintinfoerror{\typeout{^^J^^J 
!! Please enter {\string\offprintinfo\string{(Title,
Edition)\string}\string{(Author)\string}^^J at the beginning of your 
document.!!^^J^^J}}
\bgroup
\x@makefntext{Please enter {\tt \string\offprintinfo\string{(Title,
Edition)\string}\string{(Author)\string}\newline at the beginning of your 
document.\vrule depth8pt width0pt}\egroup}}


\def\printoffprintinfo{\vtop to0pt{%
\hsize=\textwidth\footnotesize
\expandafter\ifx\csname theoffprint\endcsname\relax
\offprintinfoerror\else\theoffprint\fi\vskip1sp\vss}}

\let\c@CHAPTER\c@chapter

%% LaTeX2e Cropmark Macros
%% Copyright Amy Hendrickson, TeXnology Inc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifcropmarkson
\def\noprintcropmarks{\global\cropmarksonfalse}
\global\cropmarksontrue


\newdimen\widthofcropmarks

\widthofcropmarks=42.25pc


\newdimen\raisetopcropmarks
\raisetopcropmarks=-25pt

\newdimen\raisebottomcropmarks
%\raisebottomcropmarks-48pt

\raisebottomcropmarks-70pt % was 80pt


\newdimen\movecropmarksright
\movecropmarksright=-92pt

\def\topcropmarks{\ifcropmarkson
\vtop to0pt{\vss
\hbox to0pt{\hskip\movecropmarksright\hbox to0pt{\hss%
\hbox to2pc{\hrulefill\hskip3pt}\raise6pt\hbox{\vrule height 2pc}}%
\hskip\widthofcropmarks%
\hbox to0pt{%
\raise6pt\hbox{\vrule height 2pc}\hbox to2pc{\hskip3pt\hrulefill}\hss}\hss}%
\vskip\raisetopcropmarks}
\fi}

\def\bottomcropmarks{\ifcropmarkson
\vtop to0pt{\vskip-\raisebottomcropmarks
\hbox to0pt{\hskip\movecropmarksright\hbox to0pt{\hss%
\hbox to2pc{\hrulefill\hskip3pt}\lower6pt\hbox{\vrule depth 2pc height
0pt}}%
\hskip\widthofcropmarks%
\hbox to0pt{%
\lower6pt\hbox{\vrule depth 2pc height0pt}\hbox
to2pc{\hskip3pt\hrulefill}\hss}\hss}%
\vss}\fi}


\long\def\docropmarks{\let\saveshipout\shipout
\long\def\shipout\vbox##1{\saveshipout\vbox{\topcropmarks##1\bottomcropmarks
}}
}

% \docropmarks

\voffset-25pt
\hoffset40pt % was 48


%% new additions, as of Jan 25, 2005
\newtheorem{theorem}{Theorem}[chapter]

\newif\iffirstappendix
\global\firstappendixtrue

\newcount\c@appfootnote

\def\appthanks#1{*\gdef\realthanks{#1}}

\newif\ifappend

\def\lookatapp{\if\next[\let\go\yappendix\else
\let\go\xappendix\fi\go}

\def\appendix{\global\appendtrue
\let\thetable\savethetable
\let\thefigure\savethefigure
  \renewcommand{\@chapapp}{\appendixname}%
%% if using answers.sty:
\expandafter\ifx\csname Closesolutionfile\endcsname \relax
\else
\Closesolutionfile{ans}\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\futurelet\next\lookatapp}

\def\yappendix[#1]#2{\startonoddpage
\global\titletrue\dooffprintinfo
\global\@mainmattertrue% <<===
\gdef \thepage {\csname @arabic\endcsname \c@page }
%% To fix includeonly numbering bug: ====>> 
\if@partsw\else
\iffirstappendix\setcounter{chapter}{0}\fi
\global\firstappendixfalse\fi% 
\refstepcounter{chapter}
% <<====  end bug fix
%% when using answers.sty,
%% to open an ans<chapnum> file to be used for solutions section
\expandafter\ifx\csname Opensolutionfile\endcsname\relax\else
\Opensolutionfile{ans}[ans\Alph{chapter}]\fi
  \setcounter{section}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
  \setcounter{equation}{0}%
 \setcounter{theorem}{0}%
\def\two{#2}\ifx\two\empty
\chapter*{Appendix \Alph{chapter}}
\renewcommand{\thechapter}{\Alph{chapter}}
\addcontentsline{toc}{achapter}{\thechapter}
\else
\chapter*{\vtop{\let\thanks\appthanks
 \baselineskip=30pt \parindent=0pt
\leftskip=0pt
\Alph{chapter}\vskip4pt
 #2}}
%
\renewcommand{\thechapter}{\Alph{chapter}}
\addcontentsline{toc}{achapter}{\thechapter\hskip2pt \ \quad #1}
\fi
%
\def\one{#1}
{\let\\ \
\ifx\one\empty
\markboth{\uppercase{Appendix \thechapter}}{\uppercase{Appendix \thechapter}}
\else
\markboth{\uppercase{#1}}{\uppercase{#1}}
\fi
}
\xdef\@currentlabel{\thechapter}
\ifx\realthanks\xrelax\else
\xdef\dofoot{\realthanks}
\fi
{\ifx\realthanks\xrelax\else
\def\thefootnote{*}
\footnotetext{\dofoot}\fi}
\gdef\realthanks{\relax}
}


\let\dofoot\relax
\gdef\realthanks{\relax}
\def\xrelax{\relax}
\def\xappendix#1{\startonoddpage
\global\titletrue\dooffprintinfo
\global\@mainmattertrue% <<===
\gdef \thepage {\csname @arabic\endcsname \c@page }
%% To fix includeonly numbering bug: ====>> 
\if@partsw\else
\iffirstappendix\setcounter{chapter}{0}\fi
\global\firstappendixfalse\fi% 
\refstepcounter{chapter}
% <<====  end bug fix
%% when using answers.sty,
%% to open an ans<chapnum> file to be used for solutions section
%
\expandafter\ifx\csname Opensolutionfile\endcsname\relax\else
\Opensolutionfile{ans}[ans\Alph{chapter}]\fi
  \setcounter{section}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
  \setcounter{equation}{0}%
 \setcounter{theorem}{0}%
  \renewcommand{\@chapapp}{\appendixname}%
\def\one{#1}\ifx\one\empty
\chapter*{Appendix \Alph{chapter}}
\renewcommand{\thechapter}{\Alph{chapter}}
\addcontentsline{toc}{achapter}{\thechapter\hskip2pt \ \quad Appendix}
\else
\chapter*{\vtop{\let\thanks\appthanks
 \baselineskip=30pt 
\leftskip=0pt \parindent=0pt
 Appendix \Alph{chapter}\vskip4pt
 #1}}
\renewcommand{\thechapter}{\Alph{chapter}}
\let\thanks\eatone
\addcontentsline{toc}{achapter}{\thechapter\hskip2pt \ \quad
 #1}
\fi
\def\one{#1}
{\let\\ \ 
\ifx\one\empty
\markboth{\uppercase{Appendix \thechapter}}{\uppercase{Appendix \thechapter}}
\else
\let\thanks\eatone
\markboth{\uppercase{#1}}{\uppercase{#1}}
\fi
}
\xdef\@currentlabel{\thechapter}
\ifx\realthanks\xrelax\else
\xdef\dofoot{\realthanks}
\fi
{\ifx\realthanks\xrelax\else
\def\thefootnote{*}
\footnotetext{\dofoot}}
\fi
\gdef\realthanks{\relax}
\egroup
}


%% For square boxes for Q.E.D. symbol, used in end proof

 \newdimen\slugwidth
 \newdimen\slugheight
 \newdimen\slugdepth

 \slugwidth=4.5pt
 \slugheight=4.5pt
 \slugdepth=0pt


 \def\qed{\unskip\nobreak~~~\hfill\llap{%
 \vbox{\unskip\nobreak~~~\hfill\llap{\vrule height \slugheight width 
 \slugwidth depth\slugdepth}}}}

\def\sslug{\raise.5ex\hbox{\vrule width 4pt height4pt depth0pt}}
\def\slug{\vrule width 7pt height7pt depth0pt}
\@addtoreset{exampnum}{chapter}
\newcount\c@exampnum

%%%%%%%%%%%% Example %%%%%%%%%%%%%%%%%
\def\exbox{{\fboxsep=0pt \fboxrule =.5pt
\fbox{\vrule height 7pt width 0pt\hskip7pt}%
\hskip-5.5pt\raise 2pt\hbox{\vrule width 7.25pt height 7.25pt}
}}

\def\example{\@ifnextchar[{\xexample}{\yexample}}

\def\xexample[#1]{\goodbreak\everypar={}\vskip12pt\global\advance\c@exampnum by 1
\xdef\@currentlabel{\thechapter.\the\c@exampnum}
\noindent\vrule depth14pt width0pt\exbox\ \ {\small\bf
\uppercase{Example} \thechapter.\the\c@exampnum}\hskip1em {\bf #1}%
\vskip1sp
\bgroup\nobreak\vskip1sp
\leftskip=18pt 
\@afterindentfalse\@afterheading\nobreak}

\def\yexample{\goodbreak\everypar={}\vskip12pt\global\advance\c@exampnum by 1
\xdef\@currentlabel{\thechapter.\the\c@exampnum}
\noindent\vrule depth14pt width0pt\exbox\ \ {\small\bf \uppercase{Example} \thechapter.\the\c@exampnum}
\vskip1sp
\bgroup
\leftskip=18pt 
\@afterindentfalse\@afterheading\nobreak}

\def\endexample{\vskip1sp\egroup\vskip6pt
\global\everypar={\hskip-\parindent\everypar={}}
\leftskip=0pt
}



%% ==> Algorithm
\def\xpar{\par\leavevmode}
{\catcode`\^^M=\active % these lines must end with %
  \gdef\xobeylines{\catcode`\^^M\active \let^^M\xpar}%
}

\@addtoreset{algorithm}{chapter}
\@addtoreset{algo}{chapter}
\newtheorem{algo}{Algorithm}[chapter]
\newcount\c@algorithm

\def\algorithm{\vskip12pt
\global\advance\c@algorithm by 1
\xdef\@currentlabel{\thechapter.\the\c@algorithm}
\noindent{\bf Algorithm \arabic{chapter}.\arabic{algorithm}}
\vskip6pt
\bgroup\xobeylines\obeyspaces\def\ {\quad}
\parindent=0pt\footnotesize\tt\leftskip=1pc\vskip4pt\relax}

\def\endalgorithm{\vskip4pt\egroup}

%% <== Algorithm

\let\savelabel\label

 \def\proof{\everypar={}
 \futurelet\next\lookforbracket}

 \def\lookforbracket{\ifx\next[\let\go\usespecialterm
 \else\let\go\relax
 \ifvmode\vskip-\lastskip\fi
 \vskip8pt
 \noindent{\it Proof\/:}% 
\enskip\relax\fi\ignorespaces\go}

 \def\usespecialterm[#1]{\ifvmode\vskip-\lastskip\fi
 \vskip6pt
 \noindent%
 {\it Proof\ \ {\rm(#1):}}\ \ \relax\ignorespaces}

 \def\endproof{\qed\vskip6pt\relax}

%%%%%%%%%%%%%%%%%
%% Answers macros
%%%% Problems and Solutions, Accomodating answers.sty commands


\def\solutionchap#1{\section*{\uppercase{Solutions for Chapter} #1}
\openin1 ans#1.tex \ifeof1
\typeout{^^J^^J No file ans#1.tex! 
^^J\string\solutionchap\string{#1\string} requires ans#1.tex^^J
Please
make sure that you have entered
\string\usepackage{answers} and
\string\Newassociation\string{sol\string}\string{Solution\string}\string{ans\string}\space and then run LaTeX on your file again.}
\else
\input{ans#1}\fi}

\def\solutionappendix#1{\section*{\uppercase{Solutions for Appendix} #1}
\openin1 ans#1.tex \ifeof1
\typeout{^^J^^J No file ans#1.tex! 
^^J\string\solutionchap\string{#1\string} requires ans#1.tex^^J
Please
make sure that you have entered
\string\usepackage{answers} and
\string\Newassociation\string{sol\string}\string{Solution\string}\string{ans\string}\space and then run LaTeX on your file again.}
\else
\input{ans#1}\fi}


\def\solutions{\newpage\ifodd\c@page\else\thispagestyle{empty}
\null\newpage\fi
\chapter*{Problem Solutions}
\markboth{Problem Solutions}{Problem Solutions}
\addcontentsline{toc}{schapter}{Problem Solutions}
\expandafter\ifx\csname Closesolutionfile\endcsname \relax\else
\Closesolutionfile{ans}\fi
}

\let\savedocument\document
\let\saveenddocument\enddocument

\def\enddocument{
\expandafter\ifx\csname Closesolutionfile\endcsname \relax\else
\Closesolutionfile{ans}\fi
\saveenddocument}

\def\document{%
\savedocument
\expandafter\ifx\csname Newassociation\endcsname\relax
\def\sol{\typeout{^^J^^J To make \string\begin\string{sol\string} work, please use \string\usepackage\string{answers\string}
^^J^^J}}
\def\endsol{\typeout{^^J^^J}}
\def\Solution##1{\typeout{^^J^^J To make \string\Solution\space work, please use \string\usepackage\string{answers\string}
^^J^^J}}
\else
\Newassociation{sol}{Solution}{ans}\fi
}

\def\xnumberline#1{\hb@xt@\@tempdima{\hskip12pt\llap{#1}\hfill}}

\newcommand{\contentsinbrief}{%
\startonoddpage
\global\titletrue
\advance\chapskip-6pt
\chapheight=-12pt
\partskip=-12pt
\vglue-10.5pc
    \chapter*{Contents in Brief}
    \@mkboth{\uppercase{Contents in Brief}}{\uppercase{Contents in brief}}%
\bgroup
\let\numberline\xnumberline
\parskip=6pt
{\hyphenpenalty=10000
\parindent=0pt
\@startchaptoc{toc}
}
\egroup
    \if@restonecol\twocolumn\fi
\newpage
\setcounter{tocdepth}{2}
\markboth{}{}
    }

\def\@startchaptoc#1{%
  \begingroup
\def\l@chapter##1##2{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 12pt \@plus6\p@
     \setlength\@tempdima{2em}% was 1.5
    \begingroup\chaptocfont
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
 ##1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss ##2}\par
      \penalty\@highpenalty
    \endgroup
  \fi\vskip-6pt}
\setcounter{tocdepth}{0}
    \makeatletter
    \@input{\jobname.#1}%
    \@nobreakfalse
  \endgroup}


%%% Edited Book Macros:

\font\chapauthorfont=cmcsc10
\font\chapaffilfont=\timesroman at 9pt

\def\chapteraffil#1{\vskip6pt
\noindent{\let\affilmark\newaffilmark\chapaffilfont\ignorespaces #1\vskip1sp}}
\def\saveaffilmark#1{$^{#1}$}
\def\newaffilmark#1{\leftskip4pt\hbox to0pt{\hss\hbox to 4pt{$^{#1}$}}}
\def\eatone#1{}

\newdimen\chapskip
\chapskip=26pt
\newdimen\chapheight
\newdimen\authorskip

\def\chapterauthors#1{\vbox to0pt{\vglue-1in
\let\affilmark\saveaffilmark\chapauthorfont #1\vrule height 10pt width0pt\ }
{\let\chapteraffil\eatone\let\affilmark\eatone
\addtocontents{toc}{\string\nobreak
\vskip\authorskip
\string\noindent\vrule height 9pt width0pt\hskip\chapskip#1\hfill\vskip\chapheight}\ \vskip3pt}}

\def\contributors{\chapter*{CONTRIBUTORS}
\vskip1sp
\leftskip=10pt
\parindent-10pt
\vskip-2pt
\everypar={}
\def\footnote##1{\hskip-10pt\savefootnote{##1}\hskip10pt}
\setcounter{page}{5}
\global\titletrue
\markboth{CONTRIBUTORS}{CONTRIBUTORS}}

\def\endcontributors{\newpage\markboth{}{}}

\def\name#1{\vskip2pt\fakesc #1*\hskip10pt}

%%%%%%%%%%%%%%%%%%%%%
%% Warn against using earlier commands
\expandafter\def\csname chapreferences*\endcsname{
\typeout{^^J^^J \string\begin\string{chapreferences*\string}\space is
obsolete.^^J Please use
\string\begin\string{chapreferences\string}\string{<widest label>\string}\space instead.^^J Consult docs.pdf if you have questions.}\stop }

\expandafter\def\csname references*\endcsname{
\typeout{^^J^^J \string\begin\string{references*\string}\space is
obsolete.^^J Please use
\string\begin\string{references\string}\string{<widest label>\string}\space instead.^^J Consult docs.pdf if you have questions.}\stop }


\expandafter\def\csname namedchapreferences\endcsname{
\typeout{^^J^^J \string\begin\string{namedchapreferences\string}\space is
obsolete.^^J Please use
\string\begin\string{chapreferences\string}\string{<widest label>\string}\space instead.^^J Consult docs.pdf if you have questions.}\stop }

\expandafter\def\csname namedreferences\endcsname{
\typeout{^^J^^J \string\begin\string{namedreferences\string}\space is
obsolete.^^J Please use
\string\begin\string{references\string}\string{<widest label>\string}\space instead.^^J Consult docs.pdf if you have questions.}\stop }

\endinput










