\typeout{Document Class `etri' V1.5 <26-July-2001>}
\typeout{Read the source comments for docs.}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{etri}[2002/11/05]

\newif\if@tmptwocolumn  \@tmptwocolumnfalse
\newif\if@draftversion  \@draftversionfalse
\newif\if@draftclsmode  \@draftclsmodefalse
\newif\if@technote      \@technotefalse

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% letterpaper
%\setlength\paperheight{11in}
%\setlength\paperwidth{8.5in}

% legalpaper
%\setlength\paperheight{14in}
%\setlength\paperwidth{8.5in}

\hoffset=-2.54cm
\voffset=-2.54cm

\newdimen\@ETRImarginA
\newdimen\@ETRImarginB

\textheight        23.1cm
\textwidth         17.4cm  
\columnsep          4mm

%\topmargin        -46.0pt
\topmargin         2.3cm
\@ETRImarginA 22mm
\footskip 14.5mm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\def\@ptsize{10}
\@namedef{ds@9pt}{\def\@ptsize{9}}
\@namedef{ds@10pt}{\def\@ptsize{10}}
\@namedef{ds@11pt}{\def\@ptsize{11}}
\@namedef{ds@12pt}{\def\@ptsize{12}}
\@namedef{ds@twoside}{\@twosidetrue \@mparswitchtrue}
\@namedef{ds@draft}{\global\@draftversiontrue \global\@draftclsmodetrue} 
\@namedef{ds@draftcls}{\global\@draftclsmodetrue} 
\@namedef{ds@final}{\global\@draftversionfalse \global\@draftclsmodefalse}
\@namedef{ds@technote}{\global\@technotetrue}
\@namedef{ds@twocolumn}{\global\@tmptwocolumntrue}
\@options



\def\@tempa{9}\ifx\@ptsize\@tempa
\typeout{-- This is a 9 point document}

\def\@normalsize{\@setsize\normalsize{11.1pt}\ixpt\@ixpt
\abovedisplayskip 1em plus2pt minus5pt\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip \z@ plus3pt\belowdisplayshortskip .6em plus3pt minus3pt}

\def\small{\@setsize\small{9.12pt}\viiipt\@viiipt}
\def\footnotesize{\@setsize\footnotesize{9.12pt}\viiipt\@viiipt}
\def\scriptsize{\@setsize\scriptsize{8.15pt}\viipt\@viipt}
\def\tiny{\@setsize\tiny{8pt}\vipt\@vipt}
\def\large{\@setsize\large{12pt}\xpt\@xpt}
\def\Large{\@setsize\Large{14pt}\xiipt\@xiipt}
\def\LARGE{\@setsize\LARGE{18pt}\xivpt\@xivpt}
\def\huge{\@setsize\huge{22pt}\xviipt\@xviipt}
\def\Huge{\@setsize\Huge{25pt}\xxpt\@xxpt}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@tempa{10}\ifx\@ptsize\@tempa
\typeout{-- This is a 10 point document}
\def\@normalsize{\@setsize\normalsize{11.50pt}\xpt\@xpt		% text
\abovedisplayskip 1em plus2pt minus5pt\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip \z@ plus3pt\belowdisplayshortskip .6em plus3pt minus3pt}
\def\tiny{\@setsize\tiny{6pt}\vpt\@vpt}
\def\footnotesize{\@setsize\footnotesize{8.5pt}\viipt\@viipt}	% thanks
\def\scriptsize{\@setsize\scriptsize{8.8pt}\viiipt\@viiipt}
\def\small{\@setsize\small{8.8pt}\viiipt\@viiipt}		% foot
\def\large{\@setsize\large{12pt}\xiipt\@xiipt}			% section
\def\Large{\@setsize\Large{18pt}\xivpt\@xivpt}
\def\LARGE{\@setsize\LARGE{22pt}\xviipt\@xviipt}
\def\huge{\@setsize\huge{28pt}\xxvpt\@xxvpt}			% title
\def\Huge{\@setsize\Huge{28pt}\xxvpt\@xxvpt}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@tempa{11}\ifx\@ptsize\@tempa
\typeout{-- This is an 11 point document}

\def\@normalsize{\@setsize\normalsize{13.6pt}\xipt\@xipt
\abovedisplayskip 1em plus2pt minus5pt\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip \z@ plus3pt\belowdisplayshortskip .6em plus3pt minus3pt}

\def\small{\@setsize\small{12pt}\xpt\@xpt}
\def\footnotesize{\@setsize\footnotesize{11pt}\ixpt\@ixpt}
\def\scriptsize{\@setsize\scriptsize{9.5pt}\viiipt\@viiipt}
\def\tiny{\@setsize\tiny{7pt}\vipt\@vipt}
\def\large{\@setsize\large{14pt}\xiipt\@xiipt}
\def\Large{\@setsize\Large{18pt}\xivpt\@xivpt}
\def\LARGE{\@setsize\LARGE{22pt}\xviipt\@xviipt}
\def\huge{\@setsize\huge{25pt}\xxpt\@xxpt}
\def\Huge{\@setsize\Huge{30pt}\xxvpt\@xxvpt}
\fi
\def\@tempa{12}\ifx\@ptsize\@tempa
\typeout{-- This is a 12 point document}

\def\@normalsize{\@setsize\normalsize{14pt}\xiipt\@xiipt
\abovedisplayskip 1em plus3pt minus6pt\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip \z@ plus3pt\belowdisplayshortskip .6em plus4pt minus4pt}

\def\small{\@setsize\small{11.4pt}\xpt\@xpt}
\def\footnotesize{\@setsize\footnotesize{10pt}\ixpt\@ixpt}
\def\scriptsize{\@setsize\scriptsize{9pt}\viiipt\@viiipt}
\def\tiny{\@setsize\tiny{8pt}\vipt\@vipt}
\def\large{\@setsize\large{18pt}\xivpt\@xivpt}
\def\Large{\@setsize\Large{22pt}\xviipt\@xviipt}
\def\LARGE{\@setsize\LARGE{25pt}\xxpt\@xxpt}
\def\huge{\@setsize\huge{30pt}\xxvpt\@xxvpt}
\let\Huge=\huge
\fi

\renewcommand{\normalsize}{\@normalsize}
\normalsize


\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{ptm}
\renewcommand{\ttdefault}{pcr}


\setlength{\@ETRImarginB}{\paperwidth}
\addtolength{\@ETRImarginB}{-2in}
\addtolength{\@ETRImarginB}{-1\textwidth}
\addtolength{\@ETRImarginB}{-1\@ETRImarginA}

\def\overrideETRImargins{\if@draftclsmode\relax\else 
 \if@twoside
 \oddsidemargin\@ETRImarginB
 \evensidemargin\@ETRImarginA
 \else
 \oddsidemargin\@ETRImarginB
 \evensidemargin\@ETRImarginB
 \fi
\fi}

\oddsidemargin    \@ETRImarginA
\evensidemargin   \@ETRImarginA


\parindent        1.0em
\headsep          0pt
\headheight       0pt
\lineskip           1pt
\normallineskip     1pt
\def\baselinestretch{1.15}

\parskip 0pt

\if@draftclsmode 
\topmargin       -5.0mm
\oddsidemargin       0mm
\evensidemargin      0mm
\textheight     223.5mm
\textwidth      161.0mm
\def\baselinestretch{1.2} 
\fi                       
                          
                          

\marginparsep      0pt
\marginparwidth    0pt
\marginparpush     0pt



\abovedisplayskip       0pt plus2pt minus5pt
\belowdisplayskip       \abovedisplayskip
\abovedisplayshortskip  0pt plus3pt
\belowdisplayshortskip  0pt plus3pt minus3pt


\topsep           1.3ex

\partopsep          \z@

\parsep             \z@

\itemsep            \z@

\itemindent         -1em

\leftmargin         2em

\leftmargini        2em
\leftmarginii       1em
\leftmarginiii    1.5em
\leftmarginiv     1.5em
\leftmarginv      1.0em
\leftmarginvi     1.0em
\labelsep           5pt  
\labelwidth         \z@


\def\@listI{\leftmargin\leftmargini}
\def\@listi{\leftmargin\leftmargini \topsep 0.3ex plus 1pt minus 1pt}
\let\@listI\@listi
\def\@listii{\leftmargin\leftmarginii\labelwidth\leftmarginii
    \advance\labelwidth-\labelsep \topsep 0.3ex}
\def\@listiii{\leftmargin\leftmarginiii\labelwidth\leftmarginiii
    \advance\labelwidth-\labelsep \topsep 0.3ex}
\def\@listiv{\leftmargin\leftmarginiv\labelwidth\leftmarginiv
    \advance\labelwidth-\labelsep \topsep 0.3ex}
\def\@listv{\leftmargin\leftmarginv\labelwidth\leftmarginv
    \advance\labelwidth-\labelsep \topsep 0.3ex}
\def\@listvi{\leftmargin\leftmarginvi\labelwidth\leftmarginvi
    \advance\labelwidth-\labelsep \topsep 0.3ex}


\def\labelenumi{\theenumi)}     \def\theenumi{\arabic{enumi}}

\def\labelenumii{\theenumii)}  \def\theenumii{\alph{enumii}}

\def\labelenumiii{\theenumiii)} \def\theenumiii{\roman{enumiii}}

\def\labelenumiv{\theenumiv)}   \def\theenumiv{\Alph{enumiv}}

\def\p@enumii{\theenumi}
\def\p@enumiii{\theenumi(\theenumii)}
\def\p@enumiv{\p@enumiii\theenumiii}

\def\labelitemi{$\scriptstyle\bullet$}
\def\labelitemii{\textbf{--}}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}


\def\ETRItransversionmajor{1}
\def\ETRItransversionminor{5}


\newdimen\ETRIilabelindentA
\ETRIilabelindentA \parindent

\newdimen\ETRIilabelindentB
\ETRIilabelindentB 1.3\parindent
\newdimen\ETRIilabelindent
\ETRIilabelindent \ETRIilabelindentA


\newdimen\ETRIelabelindent
\ETRIelabelindent \parindent

\newdimen\ETRIdlabelindent
\ETRIdlabelindent \parindent

\newdimen\labelindent
\labelindent \parindent

\def\ETRIlabelindentfactori{1.0}   
\def\ETRIlabelindentfactorii{0.75} 
\def\ETRIlabelindentfactoriii{0.0} 
\def\ETRIlabelindentfactoriv{0.0}
\def\ETRIlabelindentfactorv{0.0}
\def\ETRIlabelindentfactorvi{0.0}

\def\labelindentfactor{1.0}

\newdimen\ETRIiednormlabelsep
\ETRIiednormlabelsep 0.6em

\newdimen\ETRIiedmathlabelsep
\ETRIiedmathlabelsep 1.2em


\newdimen\ETRIiedtopsep
\ETRIiedtopsep 0.3ex


\def\iedlistdecl{\relax}

\def\calcleftmargin#1{\setlength{\leftmargin}{#1}
\addtolength{\leftmargin}{\labelwidth}
\addtolength{\leftmargin}{\labelsep}}

\def\setlabelwidth#1{\settowidth{\labelwidth}{#1}}

\def\usemathlabelsep{\setlength{\labelsep}{\ETRIiedmathlabelsep}}

\newif\ifnocalcleftmargin
\nocalcleftmarginfalse

\newif\ifnolabelindentfactor
\nolabelindentfactorfalse


\newcount\@iedjustify \@iedjustify=0


\def\iedlabeljustifyl{\@iedjustify=0} 
\def\iedlabeljustifyc{\@iedjustify=1} 
\def\iedlabeljustifyr{\@iedjustify=2} 

\newdimen\@iedtopsep
\newdimen\@iedlabelwidth
\newdimen\@iedlabelsep
\newdimen\@iedleftmargin
\newdimen\@iedpartopsep
\newdimen\@iedparsep
\newdimen\@ieditemsep
\newdimen\@iedrightmargin
\newdimen\@iedlistparindent
\newdimen\@ieditemindent

\def\@savelistparams{\@iedtopsep\topsep
\@iedlabelwidth\labelwidth
\@iedlabelsep\labelsep
\@iedleftmargin\leftmargin
\@iedpartopsep\partopsep
\@iedparsep\parsep
\@ieditemsep\itemsep
\@iedrightmargin\rightmargin
\@iedlistparindent\listparindent
\@ieditemindent\itemindent}

\def\@restorelistparams{\topsep\@iedtopsep
\labelwidth\@iedlabelwidth
\labelsep\@iedlabelsep
\leftmargin\@iedleftmargin
\partopsep\@iedpartopsep
\parsep\@iedparsep
\itemsep\@ieditemsep
\rightmargin\@iedrightmargin
\listparindent\@iedlistparindent
\itemindent\@ieditemindent}

\def\itemize{\relax}
\let\enditemize =\relax
\def\enumerate{\relax}
\let\endenumerate =\relax
\def\description{\relax}
\let\enddescription =\relax

\renewenvironment{itemize}[1][\relax]
               {\ifnum \@itemdepth >3 \@toodeep\else
                \ifnum \@listdepth >5 \@toodeep\else
                \advance\@itemdepth\@ne 
                \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}
                
                \advance\@listdepth\@ne 
                \edef\labelindentfactor{\csname ETRIlabelindentfactor\romannumeral\the\@listdepth\endcsname}
                \advance\@listdepth-\@ne 
                \@iedjustify=2 
                
                \nocalcleftmarginfalse
                \nolabelindentfactorfalse
                \topsep \ETRIiedtopsep
                \labelindent\ETRIilabelindent
                \labelsep\ETRIiednormlabelsep
                \partopsep 0ex
                \parsep 0ex
                \itemsep 0ex
                \rightmargin 0em
                \listparindent 0em
                \itemindent 0em
                
                
                
                \settowidth{\labelwidth}
                {\csname labelitem\romannumeral\the\@itemdepth\endcsname}
                \@savelistparams 
                \list{\csname\@itemitem\endcsname}{
                \@restorelistparams 
                                    
                \iedlistdecl 
                #1
                
                
                \ifnolabelindentfactor \relax
                \else \labelindent =\labelindentfactor\labelindent
                \fi
                
                
                
                
                \ifnocalcleftmargin \relax
                \else \calcleftmargin{\labelindent} 
                \fi
                
                \let\makelabel\@iedmakelabelright 
                                                  
                \ifnum \@iedjustify =0 \let\makelabel\@iedmakelabelleft \fi
                \ifnum \@iedjustify =1 \let\makelabel\@iedmakelabelcenter \fi
}\fi\fi}
{\endlist}

\renewenvironment{enumerate}[1][\relax]
               {\ifnum \@enumdepth >3 \@toodeep\else
                \ifnum \@listdepth >5 \@toodeep\else
                \advance\@enumdepth\@ne
                \edef\@enumctr{enum\romannumeral\the\@enumdepth}
                
                \advance\@listdepth\@ne 
                \edef\labelindentfactor{\csname ETRIlabelindentfactor\romannumeral\the\@listdepth\endcsname}
                \advance\@listdepth-\@ne 
                \@iedjustify=2 
                
                \nocalcleftmarginfalse
                \nolabelindentfactorfalse
                \topsep \ETRIiedtopsep
                \labelindent\ETRIelabelindent
                \labelsep\ETRIiednormlabelsep
                \partopsep 0ex
                \parsep 0ex
                \itemsep 0ex
                \rightmargin 0em
                \listparindent 0em
                \itemindent 0em
                
                
                
                
                \settowidth{\labelwidth}{9)}
                \@savelistparams 
                \list{\csname label\@enumctr\endcsname}{
                \usecounter{\@enumctr}
                \@restorelistparams 
                                    
                \iedlistdecl 
                #1
                
                
                \ifnolabelindentfactor \relax
                \else \labelindent =\labelindentfactor\labelindent
                \fi
                
                
                
                
                \ifnocalcleftmargin \relax
                \else \calcleftmargin{\labelindent} 
                \fi          
                
                \let\makelabel\@iedmakelabelright 
                                                  
                \ifnum \@iedjustify =0 \let\makelabel\@iedmakelabelleft \fi
                \ifnum \@iedjustify =1 \let\makelabel\@iedmakelabelcenter \fi
}\fi\fi}
{\endlist}

\renewenvironment{description}[1][\relax]
               {\ifnum \@listdepth >5 \@toodeep\else
                
                \advance\@listdepth\@ne 
                \edef\labelindentfactor{\csname ETRIlabelindentfactor\romannumeral\the\@listdepth\endcsname}
                \advance\@listdepth-\@ne 
                \@iedjustify =0 
                
                \nocalcleftmarginfalse
                \nolabelindentfactorfalse
                \topsep \ETRIiedtopsep 
                \labelindent\ETRIdlabelindent
                
                \labelsep\ETRIiednormlabelsep
                \partopsep 0ex
                \parsep 0ex
                \itemsep 0ex
                \rightmargin 0em
                \listparindent 0em
                \itemindent 0em
                
                
                
                
                
                
                
                \settowidth{\labelwidth}{Hello}
                \@savelistparams  
                \list{}{\@restorelistparams 
                                            
                \iedlistdecl 
                #1 
                
                
                \ifnolabelindentfactor \relax
                \else \labelindent =\labelindentfactor\labelindent
                \fi
                
                
                
                
                \ifnocalcleftmargin \relax
                \else \calcleftmargin{\labelindent} 
                \fi
                
                \let\makelabel\@iedmakelabelleft   
                                                   
                \ifnum \@iedjustify =1 \let\makelabel\@iedmakelabelcenter \fi
                \ifnum \@iedjustify =2 \let\makelabel\@iedmakelabelright \fi}
\fi}
{\endlist}

\newcommand*\@iedmakelabelleft[1]{\makebox[\labelwidth][l]{\normalfont #1}}
\newcommand*\@iedmakelabelright[1]{\makebox[\labelwidth][r]{\normalfont #1}}
\newcommand*\@iedmakelabelcenter[1]{\makebox[\labelwidth][c]{\normalfont #1}}


\def\verse{\let\\=\@centercr
    \list{}{\itemsep\z@ \itemindent -1.5em \listparindent \itemindent
    \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist
\def\quotation{\list{}{\listparindent 1.5em \itemindent\listparindent
    \rightmargin\leftmargin \parsep 0pt plus 1pt}\item[]}
\let\endquotation=\endlist
\def\quote{\list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist


\newif\if@restonecol
\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \else \newpage \fi \thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

\arraycolsep     5pt
\tabcolsep       6pt
\arrayrulewidth .4pt
\doublerulesep   2pt
\tabbingsep\labelsep

\skip\footins 10pt plus 4pt minus 2pt
\footnotesep 7pt
\skip\@mpfootins = \skip\footins
\fboxsep = 3pt \fboxrule = .4pt
\long\def\@makefntext#1{\parindent .8em\indent$^{\@thefnmark}$#1}

\if@technote
   \setcounter{secnumdepth}{3}
\else
   \setcounter{secnumdepth}{4}
\fi


\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]


\def\theequation{\arabic{equation}}                          
\def\thesection{\Roman{section}}                             
\def\thesubsection{\thesection-\arabic{subsection}}          
\def\thesubsubsection{\thesubsection.\arabic{subsubsection}} 
\def\theparagraph{\thesubsubsection.\alph{paragraph}}        

\def\thesectiondis{\Roman{section}.}               
\def\thesubsectiondis{{}\arabic{subsection}.}        
\def\thesubsubsectiondis{\arabic{subsubsection})}  
\def\theparagraphdis{\alph{paragraph})}            


\def\@pnumwidth{1.55em}
\def\@tocrmarg{2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{3}

\def\tableofcontents{\section*{Contents}\@starttoc{toc}}
\def\l@section#1#2{\addpenalty{\@secpenalty} \addvspace{1.0em plus 1pt}
    \@tempdima 2.75em \begingroup \parindent \z@ \rightskip \@pnumwidth
    \parfillskip-\@pnumwidth {\bfseries\leavevmode #1}\hfil\hbox to\@pnumwidth{\hss #2}
    \par \endgroup}
\def\l@subsection{\@dottedtocline{2}{2.75em}{3.75em}}
\def\l@subsubsection{\@dottedtocline{3}{6.5em}{4.5em}}
\def\l@paragraph{\@dottedtocline{4}{6.5em}{5.5em}}
\def\l@subparagraph{\@dottedtocline{5}{6.5em}{6.5em}}
\def\listoffigures{\section*{List of Figures}\@starttoc{lof}}
\def\l@figure{\@dottedtocline{1}{0em}{2.75em}}
\def\listoftables{\section*{List of Tables}\@starttoc{lot}}
\let\l@table\l@figure

\newdimen\@maxsep
\newdimen\@dblmaxsep
\floatsep 12pt plus 2pt minus 2pt     \dblfloatsep 12pt plus 2pt minus 2pt
\textfloatsep 20pt plus 2pt minus 4pt \dbltextfloatsep 20pt plus 2pt minus 4pt
\@maxsep 20pt                         \@dblmaxsep 20pt
\@fptop 0pt plus 1fil                 \@dblfptop 0pt plus 1fil
\@fpsep 8pt plus 2fil                 \@dblfpsep 8pt plus 2fil
\@fpbot 0pt plus 1fil                 \@dblfpbot 0pt plus 1fil
\def\topfraction{1.0}                 \def\dbltopfraction{1.0}
\def\floatpagefraction{0.8}           \def\dblfloatpagefraction{0.8}
\setcounter{topnumber}{2}             \setcounter{dbltopnumber}{4}
\intextsep 12pt plus 2pt minus 2pt
\setcounter{bottomnumber}{2}
\def\bottomfraction{.4}
\setcounter{totalnumber}{4}
\def\textfraction{.2}


\newif\ifcenterfigcaptions
\centerfigcaptionsfalse

\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname ext@#1\endcsname}{#1}{
   \protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}
   \begingroup \@parboxrestore \tiny
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}{#1}\par
   \endgroup}

\def\tablestring{table}
\def\figurestring{figure}

\newlength{\captionindent}
\long\def\@makecaption#1#2#3{
%\ifx\figurestring#3
%    \vskip 5pt
%    
%    \setbox\@tempboxa\hbox{\footnotesize #1.~~ #2}
%    \ifdim \wd\@tempboxa >\hsize
%       
%       \setbox\@tempboxa\hbox{\footnotesize #1.~~ }
%       \setlength\captionindent{\wd\@tempboxa} \divide\captionindent by 2
%       \captionindent 0em 
%       
%       \parbox[t]{\hsize}{\footnotesize \hangindent \captionindent \hangafter=1
%       \unhbox\@tempboxa#2}
%      
%      
%      
%      \else
%        \ifcenterfigcaptions \hbox to\hsize{\footnotesize\hfil\box\@tempboxa\hfil}
%        \else \hbox to\hsize{\footnotesize\box\@tempboxa\hfil}
%        \fi
%    \fi
%\else
    \begin{center}{\small #1. #2}\end{center}
%\fi}
}

\newcounter{figure}
\def\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{Fig.~\thefigure}
\def\figure{\@float{figure}}
\let\endfigure\end@float
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}
\newcounter{table}
\def\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{Table~\thetable}
\def\table{\@float{table}}
\let\endtable\end@float
\@namedef{table*}{\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}

\if@twoside
 \if@technote
   \def\ps@headings{
       \def\@oddhead{}
       \def\@evenhead{}
       \if@draftclsmode
       \def\@oddfoot{\scriptsize Submitted to the \textit{ETRI Journal}
       			\hfil \thepage}
       \def\@evenfoot{\scriptsize Submitted to the \textit{ETRI Journal}
       			\hfil \thepage}
       \else
       \def\@oddfoot{\scriptsize Submitted to the \textit{ETRI Journal}
       			\hfil \thepage}
       \def\@evenfoot{\scriptsize Submitted to the \textit{ETRI Journal}
       			\hfil \thepage}
       \fi}
 \else 
 \def\ps@headings{
       \def\@oddhead{}
       \def\@evenhead{}
       \if@draftclsmode
       \def\@oddfoot{\small\textsf{\footinst\hfil\footauthor}\quad{\sffamily\bfseries\thepage}}
       \def\@evenfoot{\small{\sffamily\bfseries\thepage}\quad\textsf{\footauthor\hfil\footinst}}
       \else
       \def\@oddfoot{\small\textsf{\footinst\hfil\footauthor}\quad{\sffamily\bfseries\thepage}}
       \def\@evenfoot{\small{\sffamily\bfseries\thepage}\quad\textsf{\footauthor\hfil\footinst}}
       \fi}
 \fi
\else 
\def\ps@headings{
    \def\@oddhead{}
    \def\@evenhead{}
    \if@draftclsmode
       \def\@oddfoot{\small\textsf{\footinst\hfil\footauthor}\quad{\sffamily\bfseries\thepage}}
       \def\@evenfoot{\small{\sffamily\bfseries\thepage}\quad\textsf{\footauthor\hfil\footinst}}
    \else
       \def\@oddfoot{\small\textsf{\footinst\hfil\footauthor}\quad{\sffamily\bfseries\thepage}}
       \def\@evenfoot{\small{\sffamily\bfseries\thepage}\quad\textsf{\footauthor\hfil\footinst}}
    \fi}
\fi
\def\ps@titlepagestyle{
    \def\@oddhead{}
    \def\@evenhead{}
    \if@draftclsmode
       \def\@oddfoot{\small\textsf{\footinst\hfil\footauthor}\quad{\sffamily\bfseries\thepage}}
       \def\@evenfoot{\small{\sffamily\bfseries\thepage}\quad\textsf{\footauthor\hfil\footinst}}
    \else
       \def\@oddfoot{\small\textsf{\footinst\hfil\footauthor}\quad{\sffamily\bfseries\thepage}}
       \def\@evenfoot{\small{\sffamily\bfseries\thepage}\quad\textsf{\footauthor\hfil\footinst}}
    \fi}
\def\rightmark{}\def\leftmark{}


\def\markboth#1#2{\def\leftmark{\uppercase{#1}}\def\rightmark{\uppercase{#2}}}
\def\footernote#1{\markboth{#1}{#1}}

\def\today{\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space\number\day, \number\year}

\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
\def\@citea{}\@cite{\@for\@citeb:=#2\do {\@citea\def\@citea{],
[}\@ifundefined {b@\@citeb}{{\bfseries ?}\@warning {Citation `\@citeb' on
page \thepage \space undefined}}
{\csname b@\@citeb\endcsname}}}{#1}}

\def\@cite#1#2{[{#1\if@tempswa, #2\fi}]}

\let\@internalcite\cite
\def\cite{\def\citename##1{##1}\@internalcite}
\def\shortcite{\def\citename##1{}\@internalcite}
\def\@biblabel#1{\def\citename##1{##1}[#1]\hfill}

\def\thebibliography#1{\section*{REFERENCES}\bgroup
  \normalsize\list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}
    \topsep=0mm \parsep=0mm \itemsep=1mm \partopsep=0mm}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m}
\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist\egroup}

\def\authorinfo#1{\vskip7mm\noindent
\hangindent=32mm \hangafter=-7
\bgroup\normalsize{\bfseries #1 }\ignorespaces}
\def\endauthorinfo{\vskip0mm\egroup \ignorespaces}

\def\authorinfonopic#1{\vskip7mm\noindent
%\hangindent=32mm \hangafter=-7
\bgroup\normalsize{\bfseries #1 }\ignorespaces}
\def\endauthorinfonopic{\vskip0mm\egroup \ignorespaces}

\def\maketitle{\par
  \begingroup
  \def\thefootnote{} 
  \if@twocolumn
     \if@technote
        \newpage\global\@topnum\z@ \@maketitle
     \else\twocolumn[\@maketitle]\fi
  \else\newpage\global\@topnum\z@ \@maketitle \fi
  \thispagestyle{titlepagestyle}\@thanks
  \endgroup
  \setcounter{footnote}{0}\let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}
  \let\thanks\relax
  \if@draftclsmode \vfil\mbox{}\newpage\fi}

\newlength{\len}
\def\@maketitle{\newpage\if@draftclsmode\mbox{}\vfil\fi\begin{center}
    \if@technote
      {\textbf{\large\@title}\par}\vskip 1.3em{\lineskip .5em\begin{flushright}\@author\end{flushright}\@specialpapernotice\par}
    \else
      \vskip1.5cm\lineskip5mm\textsf{\huge\@title}\par\vskip1.5cm
      \if@draftclsmode\vfil\fi
      {\lineskip.5em\normalsize\begin{flushright}\settowidth{\len}{\textsf{\@author}}\rule{\len}{0.5mm}\\[-1mm]\gdef\@thanks{}\textsf{\@author}\end{flushright}}
    \fi
    \end{center}
    \if@technote
    \par\normalfont\normalsize\vskip 1\baselineskip plus 2ex minus 1ex
    \else
%    \par\normalfont\normalsize\vskip 4.55\baselineskip plus 2ex minus 1ex
    \par\normalfont\normalsize\vskip1.8cm
    \fi}

\def\abstract{
    \if@twocolumn
     \normalsize
    \else
     
     \quotation\small
    \fi}
\def\endabstract{\vspace{0.6em}\par\if@twocolumn\else\endquotation\fi
    \normalfont\normalsize}

\def\keywords{
    
    \if@twocolumn
      
      \small\bfseries\textit{Index Terms}---$\!$
    \else
      
      \begin{center}\small\bfseries Index Terms\end{center}\quotation\small
    \fi}
\def\endkeywords{\if@technote\vspace{0.6em}\else\vspace{0.3em}\fi
    \par\if@twocolumn\else\endquotation\fi
    \normalsize\normalfont}


\gdef\@punct{:\ \,}  
                     
                     
\def\@sect#1#2#3#4#5#6[#7]#8{
  \ifnum #2>\c@secnumdepth
     \def\@svsec{}
  \else
     \refstepcounter{#1}\edef\@svsec{
     
     
     \ifnum #2=1\thesectiondis\fi\ifnum #2=2\thesubsectiondis\fi
     \ifnum #2>2{\csname the#1dis\endcsname}\fi \hskip .5em}
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@   
     \begingroup #6\relax  
       \parindent=0pt
      \noindent 
       \@hangfrom{\relax\@svsec}{\interlinepenalty \@M #8\par}
%       \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}
       %\relax{\relax\@svsec}{\interlinepenalty \@M #8\par}
%       \relax{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}
     \endgroup
     
     
     \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth\else
               \protect\numberline{\csname the#1\endcsname}\fi#7}
  \else 
     
     
     \def\@svsechd{#6\hskip #3\@svsec #8\@punct\mbox{} 
     \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth \else
               \protect\numberline{\csname the#1\endcsname}\fi#7}}
  \fi 
  \@xsect{#5}}
  
\def\@ssect#1#2#3#4#5{\@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
     \begingroup #4\@hangfrom{}{\interlinepenalty \@M #5\par}\endgroup
%     \begingroup #4\@hangfrom{\hskip #1}{\interlinepenalty \@M #5\par}\endgroup
     %\begingroup \noindent #4\relax{\hskip #1}{\interlinepenalty \@M #5\par}\endgroup
  
  \else \def\@svsechd{#4\hskip #1\relax #5\@punct\mbox{}}\fi
  \@xsect{#3}}


\def\section{\@startsection{section}{1}{\z@}{3.5ex plus 1.5ex minus 1.5ex}
{3mm}{\normalfont\large\scshape}}
\def\subsection{\@startsection{subsection}{2}{\z@}{3.5ex plus 1.5ex minus 1.5ex}
{3mm}{\normalfont\normalsize}}
\def\subsubsection{\@startsection{subsubsection}{3}{\parindent}{0ex plus 0.1ex minus 0.1ex}
{0ex}{\normalfont\normalsize\itshape}}
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}
{0ex}{\normalfont\normalsize\itshape}}


\newdimen\tmpitemindent
\def\QED{\mbox{\rule[0pt]{1.5ex}{1.5ex}}}
\def\proof{\noindent\hspace{2em}{\itshape Proof: }}
\def\endproof{\hspace*{\fill}~\QED\par\endtrivlist\unskip}
\def\@begintheorem#1#2{\tmpitemindent\itemindent\topsep 0pt\rmfamily\trivlist
    \item[\hskip \labelsep{\indent\itshape #1\ #2:}]\itemindent\tmpitemindent}
\def\@opargbegintheorem#1#2#3{\tmpitemindent\itemindent\topsep 0pt\rmfamily \trivlist
    \item[\hskip\labelsep{\indent\itshape #1\ #2\rmfamily---#3:}]\itemindent\tmpitemindent}
\def\@endtheorem{\endtrivlist\unskip}

\ps@headings
\pagenumbering{arabic}

\if@twoside\else\raggedbottom\fi
\if@tmptwocolumn \twocolumn \sloppy \flushbottom \fi




\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\endgroup

\let\@ppendixsavesection\section

\def\@processthesectionargument#1{
\@ifmtarg{#1}{
\@ppendixsavesection*{Appendix \thesectiondis}
\addcontentsline{toc}{section}{Appendix \thesection}}{
\@ppendixsavesection*{Appendix \thesectiondis \\* #1}
\addcontentsline{toc}{section}{Appendix \thesection: #1}}}

\def\@destroythesectionargument#1{\typeout{WARNING: Ignoring useless
\protect\section {\noexpand#1} in Appendix.}}



\def\appendix{\relax}
\renewcommand{\appendix}[1][]{\par
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    \setcounter{paragraph}{0}
    \def\thesection{}
    \def\thesectiondis{}  
    \def\thesubsection{\arabic{subsection}}
    \refstepcounter{section} 
    \@ifmtarg{#1}{\@ppendixsavesection*{Appendix}
                  \addcontentsline{toc}{section}{Appendix}}{
             \@ppendixsavesection*{Appendix \\* #1}
             \addcontentsline{toc}{section}{Appendix: #1}}
    
    
    \def\section{\@ifstar{\@ppendixsavesection*}{
                    \@destroythesectionargument}}
                                                 
}



\newif\ifuseRomanappendices
\useRomanappendicestrue


\def\appendices{\par
    \setcounter{section}{-1} 
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    \setcounter{paragraph}{0}
    \ifuseRomanappendices
     \def\thesection{\Roman{section}}
    \def\thesectiondis{\Roman{section}}
    \else
    \def\thesection{\Alph{section}}
    \def\thesectiondis{\Alph{section}}
    \fi
    \refstepcounter{section} 
    \setcounter{section}{0} 
    
    
    \def\section{\@ifstar{\@ppendixsavesection*}{
                    \refstepcounter{section} 
                    \@processthesectionargument}}
                                                 
}




\def\CMPARstart#1#2{\begingroup\def\par{\endgraf\endgroup\lineskiplimit=0pt}
    \setbox2=\hbox{\uppercase{#2} }\newdimen\tmpht \tmpht \ht2
    \advance\tmpht by \baselineskip\font\hhuge=cmr10 at \tmpht
    \setbox1=\hbox{{\hhuge #1}}
    \count7=\tmpht \count8=\ht1\divide\count8 by 1000 \divide\count7 by\count8
    \tmpht=.001\tmpht\multiply\tmpht by \count7\font\hhuge=cmbx10 at \tmpht
    \setbox1=\hbox{{\hhuge #1}} \noindent \hangindent1.05\wd1
    \hangafter=-2 {\hskip-\hangindent \lower1\ht1\hbox{\raise1.0\ht2\copy1}
    \kern-0\wd1}\copy2\lineskiplimit=-1000pt}

\def\PARstart#1#2{\begingroup\def\par{\endgraf\endgroup\lineskiplimit=0pt}
    \setbox2=\hbox{\uppercase{#2} }\newdimen\tmpht \tmpht \ht2
    \advance\tmpht by 1.1\baselineskip\font\hhuge=ptmr at \tmpht
    \setbox1=\hbox{{\hhuge #1}}
    \count7=\tmpht \count8=\ht1\divide\count8 by 1000 \divide\count7 by\count8
    \tmpht=.001\tmpht\multiply\tmpht by \count7\font\hhuge=ptmb at \tmpht
    \setbox1=\hbox{{\hhuge #1}} \noindent \hangindent1.05\wd1
    \hangafter=-2 {\hskip-\hangindent \lower1\ht1\hbox{\raise1.0\ht2\copy1}
    \kern-0\wd1}\copy2\lineskiplimit=-1000pt}

\if@technote\def\PARstart#1#2{#1#2}\def\CMPARstart#1#2{#1#2}\fi     
\if@draftclsmode\def\PARstart#1#2{#1#2}\def\CMPARstart#1#2{#1#2}\fi 

\newenvironment{biography}[2][]{
\addcontentsline{toc}{section}{Biography}
\footnotesize\unitlength 1in\bigskip\parskip=0pt\par
\rule{0pt}{1.54in}\vspace{-1.54in}\par
\noindent
\def\@tempbiographybox{\hbox{\framebox(1,1.25){\parbox[][\height][c]{0.9in}{\centering PLACE\\ PHOTO\\ HERE}}}}
\@ifmtarg{#1}{\relax}{
\def\@tempbiographybox{\hbox{
\begin{minipage}[b][1.25in][c]{1in}
\centering
#1
\end{minipage}
}}
}
\setbox0\@tempbiographybox
\ht0=1.45in\count10=\ht0\divide\count10 by\baselineskip
\global\hangindent1.14in\global\hangafter-\count10
\hskip-1.12in\setbox0\hbox to 1.12in {\raise-1.2in\box0\hss}
\dp0=0in\ht0=0in\box0\noindent{\bfseries#2}\rmfamily}{\par
\ifnum \prevgraf <\count10 
    \count11=\count10
    \advance\count11 by -\prevgraf 
    \dimen10=\baselineskip 
    \multiply\dimen10 by \count11
    \noindent\rule{0pt}{\dimen10} 
\fi
\par\normalfont}


\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


\def\@specialpapernotice{\relax}
 
\def\specialpapernotice#1{\def\@specialpapernotice{
\\*[1.5ex]\textit{#1}\vspace*{-2ex}}}



\let\@normalbaselineskipsave\baselineskip

\def\@pubid{\relax}

\def\pubid#1{\def\@pubid{#1} \thispagestyle{pubidtitlepagestyle}
\enlargethispage{-1.3\@normalbaselineskipsave}}

\def\pubidadjcol{\if@twocolumn\enlargethispage{-1.3\@normalbaselineskipsave}\fi}


\def\ps@pubidtitlepagestyle{
    \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}
    \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}
    \if@draftclsmode
         \def\@oddfoot{\scriptsize \@date\hfil DRAFT}
         \def\@evenfoot{\scriptsize DRAFT\hfil \@date}
    \else
         \footskip 0pt
         \def\@oddfoot{\hss\normalfont\footnotesize\raisebox{1.5ex}[1.5ex]{\@pubid}\hss}
         \def\@evenfoot{\hss\normalfont\footnotesize\raisebox{1.5ex}[1.5ex]{\@pubid}\hss}
    \fi}


\endinput



