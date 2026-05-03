%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{surao}[2024 SURAO report class]
\LoadClass[11pt]{report}



%%Preliminary definitions, needed by the options
% \RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage[acronym,nonumberlist,nopostdot,nogroupskip]{glossaries}
\RequirePackage{url}
\RequirePackage{caption} % For customizing captions
\RequirePackage{xcolor}
%\RequirePackage{fontspec}
\RequirePackage[no-math]{fontspec}

\RequirePackage{forloop}

% links visible in PDF but not when printed
\RequirePackage[
    % colorlinks=false, % Use boxes for links instead of coloring text
    % pdfborder={0 0 1}, % Define border style: width 0 for horizontal/vertical, 1 for visible border
    % linkbordercolor=blue,  % Box color for internal links (e.g., section refs)
    % citebordercolor=green,   % Box color for citations
    % urlbordercolor=red    % Box color for URLs
    colorlinks=true,
    linkcolor=blue,
    citecolor=green,
    urlcolor=violet
]{hyperref}


%\usepackage{setspace}  % For line spacing control
\RequirePackage{kvoptions} % Optional, for additional key-value parsing if needed



\RequirePackage{graphicx} % For scalebox
\RequirePackage{xstring}  % For processing individual characters

\RequirePackage{setspace}  % Line spacing package
% add "showframe" to display borders
\RequirePackage[a4paper,left=2.5cm,top=1.2cm,right=2.5cm,
bottom=1cm,includehead,includefoot, headheight=1.6cm, headsep=0ex]{geometry}
% \geometry{left=2.5cm,top=1cm,right=2.5cm,bottom=1cm,includehead,includefoot}
% \setlength{\headheight}{2cm} % Adjust this value as needed


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Global Text Variables

\newcommand{\ReportNumber}{XY} % Default value
\newcommand{\ReportYear}{20ZZ}  % Default value

% Allow the user to override these in their document:
\providecommand{\suReportNumber}[1]{\renewcommand{\ReportNumber}{#1}}
\providecommand{\suReportYear}[1]{\renewcommand{\ReportYear}{#1}}
\newcommand{\suShortTitle}[1]{%
  \gdef\@suShortTitle{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%% FONTS

\setmainfont{Arial}
% Tryout with external font files
% \setmainfont{ARIAL.ttf}[
%     BoldFont = ARIALBD.ttf,
%     ItalicFont = ARIALI.ttf,
%     BoldItalicFont = ARIALBI.ttf
% ]

% Tryout with Helvetica (for pdflatex)
% \RequirePackage{helvet}
% \renewcommand{\familydefault}{\sfdefault}
%
% MAth fonts 
%
% Trying to find a math font compatible with Arial
% see examples here: https://tex.stackexchange.com/questions/425098/which-opentype-math-fonts-are-available

% instead of Arial
\RequirePackage{fontspec}
\usepackage{unicode-math}
\setmathfont[Path=fonts/]{NotoSansMath-Regular.ttf}
%\setmathfont{Noto Sans Math}

% The only working font on overleaf
% However hard to distinguish from the text font and some symbols
% looks ugly.
%\setmathfont{Fira Math}

% These must be uploaded and has yet to be tested
%\setmathfont{GFSNeohellenicMath.otf}[Path=fonts/]
%\setmathfont{texgyreherosmath.otf}[Path=fonts/]



\renewcommand{\normalsize}{\fontsize{11}{12}\selectfont}
\newcommand{\fontsizeHeaderStart}{\fontsize{14}{16}\selectfont}

% Set globally
\setlength{\parindent}{0pt} 
\setlength{\parskip}{8pt} % Space below paragraph (sets space between paragraphs)
\setstretch{1.15}  % Set line spacing to 1.15

\newcommand{\suparagraph}{
    \setstretch{1.15}  % Set line spacing to 1.15
    \setlength{\parskip}{8pt} % Space below paragraph (sets space between paragraphs)
    \setlength{\parindent}{0pt}  % Optional: remove paragraph indentation (adjust as needed)

    % Custom command to add space above paragraphs
    \makeatletter
    \renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}{6pt}{8pt}{\normalfont\normalsize\bfseries}}
    \makeatother
}

% Set fonts in table of contents
\RequirePackage{tocloft}  % For customizing ToC

% Customize chapter/section level font size in ToC
\renewcommand{\cftchapfont}{\fontsize{12}{13}\fontseries{b}\selectfont}       % Chapter font size in ToC  (FIX 1)
\renewcommand{\cftchappagefont}{\fontsize{12}{13}\fontseries{b}\selectfont}   % Chapter page number font size (FIX 1)


% Customize section level font size
\renewcommand{\cftsecfont}{\fontsize{12}{13}\selectfont}       % Section font size in ToC
\renewcommand{\cftsecpagefont}{\fontsize{12}{13}\selectfont}   % Section page number font size
\renewcommand{\cfttoctitlefont}{\fontsizeHeaderStart\bfseries\headlinecolor} % Set font, size, and color for ToC title

% Set different indents for chapter/section, subsection, subsubsection in the ToC
\cftsetindents{chapter}{0em}{0.78cm}         % Chapter indent (FIX 1)

\cftsetindents{section}{0em}{0.78cm}         % No indent for sections, 2em for section number
\cftsetindents{subsection}{0.39cm}{1.55cm}      % 1em indent for subsections, 3em for subsection number
\cftsetindents{subsubsection}{0.5cm}{2.3cm}   % 2em indent for subsubsections, 4em for subsubsection number
% Set paragraph spacing above each ToC entry
\setlength{\cftbeforechapskip}{0.21cm}   % Space above chapter entries (FIX 1)
\setlength{\cftbeforesecskip}{0.21cm}   % Space above section entries
\setlength{\cftbeforesubsecskip}{0.21cm} % Space above subsection entries
\setlength{\cftbeforesubsubsecskip}{0.21cm} % Space above subsubsection entries

\renewcommand{\contentsname}{Content}



% Define the smallcaps macro
\newcommand{\smallcaps}[1]{%
  \begingroup
  \def\mystring{#1}%
  \StrLen{x\mystring}[\stringlen]%
  % \newcounter{stringindex}%
  \@ifundefined{c@stringindex}{\newcounter{stringindex}}{}%
  \setcounter{stringindex}{1}%
  \loop
    \StrChar{\mystring}{\value{stringindex}}[\currentchar]%
    \IfSubStr{abcdefghijklmnopqrstuvwxyzěščřžýáíéóůúťďäöñ}{\currentchar}{%
      % Character is lowercase, convert to uppercase and scale down
      \scalebox{0.85}{\MakeUppercase{\currentchar}}%
    }{%
      % Character is not lowercase, output as is
      \currentchar%
    }%
    \stepcounter{stringindex}%
  \ifnum\value{stringindex}<\stringlen
  \repeat
  \endgroup
}



% Colors
\newcommand{\headlinecolor}{\normalcolor}
\definecolor{suGreen}{RGB}{0,102,53}
\renewcommand{\headlinecolor}{\color{suGreen}}

%%This parts handles the options passed to the class.
% \DeclareOption{onecolumn}{\OptionNotUsed}
% \DeclareOption{green}{\renewcommand{\headlinecolor}{\color{suGreen}}}
% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% \ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bibliography
% \usepackage{xparse}
% \usepackage{relsize}

% \ExplSyntaxOn
% \cs_new_protected:Npn \faux_smallcaps_bib:n #1
%   {
%     \tl_set:Nn \l_tmpa_tl { #1 }
%     \tl_set:Nx \l_tmpb_tl { \tl_head:N \l_tmpa_tl } % first char
%     \tl_set:Nx \l_tmpc_tl { \tl_tail:N \l_tmpa_tl } % rest

%     % First letter: normal size uppercase
%     % Rest: smaller uppercase (always smaller, even in bibliography font context)
%     \tl_if_blank:VTF \l_tmpc_tl
%       { }
%       { {\scalebox{0.78}{\text_uppercase:n { \l_tmpc_tl }}} }
%   }
% \NewDocumentCommand{\fauxscbib}{m}{\faux_smallcaps_bib:n{#1}}
% \ExplSyntaxOff



\RequirePackage[
% style=authoryear,
% style=bwl-FU,
backend=biber, style=iso-authoryear,
uniquelist=false,
backend=biber,
giveninits=true,
% mincitenames=1, % citenames does not work for techreports
% maxcitenames=1, % controls how many author names appear in citations in text
minnames=1,
maxnames=2, 
minbibnames=99,
maxbibnames=99, % controls how many author names appear in the bibliography
uniquename=false % fully disable biblatex names disambiguation 
% - if there are two citations with the same family name and year, it will be ambiguous
]{biblatex}

% difference between parenthetical citations and textual citations in biblatex:
% \parencite{key} → Hoffmann et al., 2007
% \textcite{key} → Hoffmann et al. (2007)
% let \cite behave like \textcite
\let\cite\textcite

% Titles not italic (article, book, report, etc.)
% \DeclareFieldFormat{title}{#1}
% \DeclareFieldFormat[article,inbook,incollection,inproceedings]{title}{#1}
% \DeclareFieldFormat[book,collection,proceedings,report,thesis,techreport,manual,misc]{title}{#1}

% \DeclareFieldFormat*{title}{#1}
% % \DeclareFieldFormat*{journaltitle}{#1}
% \DeclareFieldFormat*{journal}{#1}
% \DeclareFieldFormat*{booktitle}{#1}
% \DeclareFieldFormat*{maintitle}{#1}
% \DeclareFieldFormat*{issuetitle}{#1}
% \DeclareFieldFormat*{eventtitle}{#1}

% \renewcommand*{\labelnamepunct}{\addcolon\space}
\AtEveryBibitem{%
  \clearfield{month}%
  \clearfield{note}%
  \ifboolexpr{
    test {\ifentrytype{book}}
    or test {\ifentrytype{article}}
    or test {\ifentrytype{collection}}
    or test {\ifentrytype{incollection}}
    or test {\ifentrytype{inproceedings}}
  }{%
    \clearfield{url}%
    \clearfield{urlyear}
  }{}
}

\DeclareDelimFormat[cite]{multinamedelim}{\addcomma\space}%
\DeclareDelimFormat[cite]{finalnamedelim}{\addspace\bibstring{and}\space}%
\DeclareDelimFormat[textcite]{finalnamedelim}{\addspace\bibstring{and}\space}%

\AtBeginBibliography{%
  % author name delimiter
  \DeclareDelimFormat[bib]{multinamedelim}{\addcomma\space}%
  % last author name delimiter
  \DeclareDelimFormat[bib]{finalnamedelim}{\addcomma\space}%
  % delimiter betwen authors and year
  \DeclareDelimFormat[bib]{nameyeardelim}{\addspace}%
  % switch of italics in titles/journal titles etc.
  \renewcommand*{\mkbibemph}[1]{#1}%

% year in parentheses (covers both plain year and year+extrayear like 2012a)
  % \DeclareFieldFormat{labelyear}{\mkbibparens{#1}}%
  % \DeclareFieldFormat{labelyear+extrayear}{\mkbibparens{#1}}%
  
  % Open parenthesis right before the year/date
  \DeclareDelimFormat[bib]{nameyeardelim}{\addspace\bibopenparen}%
  % Close parenthesis + ":" right after the year/date (before the title)
  \DeclareDelimFormat[bib]{nametitledelim}{\bibcloseparen\addcolon\space}%
  % Put ":" after the year (before the title)
  % \DeclareDelimFormat[bib]{nametitledelim}{\addcolon\space}%
  
  % Override the actual name format used in the bibliography
  \DeclareNameFormat{family-given}{%
    \usebibmacro{name:delim}{#1}%
    % \usebibmacro{name:hook}{#1}{#2}%
    \nameparts{#1}%
    \smallcaps{\namepartfamily}%
    \ifblank{\namepartgiven}{}{%
      \space\mkbibnamegiven{\namepartgiveni}%
    }%
    % \addcomma\space
    \usebibmacro{name:andothers}%
  }%
}

% \AtBeginBibliography{%
%   \renewcommand*{\mkbibnamefamily}[1]{\fauxscbib{#1}}%
%   \renewcommand*{\mkbibnamelast}[1]{\fauxscbib{#1}}%
% }

% \AtBeginBibliography{%
%   \renewcommand*{\bibnamedelima}{\addcomma\space}%
%   \renewcommand*{\bibnamedelimb}{\addcomma\space}%
%   \renewcommand*{\bibnamedelimc}{\addcomma\space}%
%   \renewcommand*{\bibnamedelimd}{\addcomma\space}%
%   \renewcommand*{\finalnamedelim}{\addcomma\space}%
% }

% \renewcommand*{\multinamedelim}{\addcomma\space}%
% \renewcommand*{\finalnamedelim}{\addcomma\space}%
% \renewcommand*{\andothersdelim}{\addcomma\space}%
% \renewcommand*{\bibnamedelima}{\addcomma\space}%
%   \renewcommand*{\bibnamedelimb}{\addcomma\space}%
%   \renewcommand*{\bibnamedelimc}{\addcomma\space}%
%   \renewcommand*{\bibnamedelimd}{\addcomma\space}%
%   \renewcommand*{\finalnamedelim}{\addcomma\space}%

% \AtBeginBibliography{%
%   \DeclareDelimFormat{multinamedelim}{\addcomma\space}%
%   % \DeclareDelimFormat{finalnamedelim}{\addcomma\space}%
%   % \DeclareDelimFormat{andothersdelim}{\addcomma\space}%
%   % \DeclareDelimFormat[bib]{multinamedelim}{\addcomma\space}
%   % \DeclareDelimFormat[bib]{finalnamedelim}{\addcomma\space}
  
%   % Override the actual name format used in the bibliography
%   \DeclareNameFormat{family-given}{%
%     \usebibmacro{name:delim}{#1}%
%     % \usebibmacro{name:hook}{#1}{#2}%
%     \nameparts{#1}%
%     % \fauxscbib{\namepartfamily}%
%     \smallcaps{\namepartfamily}%
%     \ifblank{\namepartgiven}{}{%
%       \space\mkbibnamegiven{\namepartgiveni}%
%     }%
%     % \addcomma\space
%     \usebibmacro{name:andothers}%
%   }%
% %   % \renewcommand*{\bibnamedelima}{\addcomma\space}%
% %   % \renewcommand*{\bibnamedelimb}{\addcomma\space}%
% %   % \renewcommand*{\bibnamedelimc}{\addcomma\space}%
% %   % \renewcommand*{\bibnamedelimd}{\addcomma\space}%
% %   % \renewcommand*{\finalnamedelim}{\addcomma\space}%
% %   % \DeclareDelimFormat{multinamedelim}{\addcomma\space}%
% %   % \DeclareDelimFormat{finalnamedelim}{\addcomma\space}%
% %   % \DeclareDelimFormat{andothersdelim}{\addcomma\space}%
% }

%   % % Make sure the bibliography uses this format for the relevant name lists
%   \DeclareNameAlias{author}{family-given}%
%   \DeclareNameAlias{editor}{family-given}%
%   \DeclareNameAlias{labelname}{family-given}%
% }

% \AtBeginBibliography{%

%   \DeclareDelimFormat{multinamedelim}{\addcomma\space}%
%   \DeclareDelimFormat{finalnamedelim}{\addcomma\space}%
%   \DeclareDelimFormat{andothersdelim}{\addcomma\space}%
%   \renewcommand*{\multinamedelim}{\addcomma\space}%
%   \renewcommand*{\finalnamedelim}{\addcomma\space}%
%   \renewcommand*{\andothersdelim}{\addcomma\space}%
% }

% \AtBeginBibliography{%

%   \DeclareDelimFormat{multinamedelim}{\addcomma\space}%
%   \DeclareDelimFormat{finalnamedelim}{\addcomma\space}%
%   \DeclareDelimFormat{andothersdelim}{\addcomma\space}%
%   \renewcommand*{\multinamedelim}{\addcomma\space}%
%   \renewcommand*{\finalnamedelim}{\addcomma\space}%
%   \renewcommand*{\andothersdelim}{\addcomma\space}%
  
%   % Override the actual name format used in the bibliography
%   \DeclareNameFormat{family-given}{%
%     \nameparts{#1}%
%     \fauxscbib{\namepartfamily}%
%     \ifblank{\namepartgiven}{}{%
%       \space\mkbibnamegiven{\namepartgiveni}%
%     }%
%     \usebibmacro{name:andothers}%
%   }%

%   % Make sure the bibliography uses this format for the relevant name lists
%   \DeclareNameAlias{author}{family-given}%
%   \DeclareNameAlias{editor}{family-given}%
%   \DeclareNameAlias{labelname}{family-given}%
% }

% Use comma between all names, including the last one (no "and")
% \AtBeginBibliography{%
%   \renewcommand*{\multinamedelim}{\addcomma\space}%
%   \renewcommand*{\finalnamedelim}{\addcomma\space}%
% }

% Small caps for family names (do this globally, not only at begin-bibliography)
% \renewcommand*{\mkbibnamefamily}[1]{\fauxscbib{#1}}

% Make author list use the family-given format
% \DeclareNameAlias{author}{family-given}

% % Redefine family-given to: FAMILY GivenInitials
% \DeclareNameFormat{family-given}{%
%   \nameparts{#1}%
%   \mkbibnamefamily{\namepartfamily}%
%   \ifblank{\namepartgiven}{}{%
%     \space\mkbibnamegiven{\namepartgiveni}%
%   }%
%   \usebibmacro{name:andothers}%
% }

% \DeclareNameFormat{author}{%
%   \nameparts{#1}%
%   \ifblank{\namepartfamily}
%     {}
%     {\mkbibnamefamily{\textsc{\namepartfamily}}, }%
%   \ifblank{\namepartgiven}
%     {}
%     {\mkbibnamegiven{\textsc{\namepartgiven}}}%
%   \ifblank{\namepartprefix}
%     {}
%     { \mkbibnameprefix{\textsc{\namepartprefix}}}%
%   \ifblank{\namepartsuffix}
%     {}
%     { \mkbibnamesuffix{\textsc{\namepartsuffix}}}%
% }
% \DeclareFieldFormat[article]{volume}{\mkbibbold{#1}}
\DeclareFieldFormat[article]{number}{\mkbibparens{#1}}
\DeclareFieldFormat{doi}{%
  \newline
  \mkbibacro{DOI}\addcolon\space
    \ifhyperref
      {\href{http://dx.doi.org/#1}{\nolinkurl{#1}}}%
      {\nolinkurl{#1}}}
\DeclareFieldFormat{url}{%
  \newline
  \mkbibacro{URL}\addcolon\space
   \href{#1}{\nolinkurl{#1}}%
   }
% Ensure "et al." is used for long name lists
%\DeclareDelimFormat{finalnamedelim}{\addspace\bibstring{and}\space}
%\DeclareDelimFormat{multinamedelim}{\addcomma\space}
%\DeclareDelimAlias{finalnamedelim:etal}{finalnamedelim}
%\DeclareDelimAlias{multinamedelim:etal}{multinamedelim}
% Adjust spacing between bibliography items
\setlength{\bibitemsep}{0.5\baselineskip} % Adjust this value as needed



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Chapter/Section headings

% % --- Chapter heading color fix (FIX 2) ---
% \renewcommand{\@makechapterhead}[1]{%
%   \vspace*{50\p@}%
%   {\parindent \z@ \raggedright \normalfont \headlinecolor
%    \ifnum \c@secnumdepth >\m@ne
%      \huge\bfseries \@chapapp\space \thechapter
%      \par\nobreak
%      \vskip 20\p@
%    \fi
%    \interlinepenalty\@M
%    \Huge\bfseries #1\par\nobreak
%    \vskip 40\p@
%   }}
% \renewcommand{\@makeschapterhead}[1]{%
%   \vspace*{50\p@}%
%   {\parindent \z@ \raggedright \normalfont \headlinecolor
%    \interlinepenalty\@M
%    \Huge\bfseries #1\par\nobreak
%    \vskip 40\p@
%   }}
% --- Chapter heading: number + space + title on one line (no "Chapter") ---
\renewcommand{\@makechapterhead}[1]{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont \headlinecolor
   \interlinepenalty\@M
   \ifnum \c@secnumdepth >\m@ne
     \Huge\bfseries \thechapter\hspace{0.75em}#1\par\nobreak
   \else
     \Huge\bfseries #1\par\nobreak
   \fi
   \vskip 40\p@
  }%
}

\renewcommand{\@makeschapterhead}[1]{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont \headlinecolor
   \interlinepenalty\@M
   \Huge\bfseries #1\par\nobreak
   \vskip 40\p@
  }%
}

% Sections
\renewcommand{\section}{%
    % \newpage
    \@startsection
    % {section}{1}{0pt}{0.53cm plus -1ex minus -.2ex}%
    {section}{1}{0pt}{0.53cm plus -0.2ex}%
    {1.5ex plus .2ex}%  0.42cm according to Word template
    {\setlength{\parskip}{0pt}\fontsize{17}{19}\selectfont\bfseries\headlinecolor}%
}
\renewcommand{\subsection}{%
    \@startsection
    {subsection}{1}{0pt}{0.53cm plus -0.2ex}%
    {1.5ex plus .2ex}%  0.42cm according to Word template
    {\setlength{\parskip}{0pt}\fontsize{15}{17}\selectfont\bfseries\headlinecolor}%
}
\renewcommand{\subsubsection}{%
    \@startsection
    {subsubsection}{1}{0pt}{0.53cm plus -0.2ex}%
    {1.5ex plus .2ex}%  0.42cm according to Word template
    {\setlength{\parskip}{0pt}\fontsize{13}
    {15}\selectfont\bfseries\headlinecolor}%
}

% % Define keywords command
% \newcommand{\suKeywords}[1]{%
%   \gdef\@suKeywords{#1}}
% \newcommand{\suAbstract}[1]{%
%   {\fontsizeHeaderStart\setstretch{1.15}%
%   \gdef\@suAbstract{#1}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Page styles

% Macro for the default page style (header and centered page number)
\newcommand{\DefaultPageStyle}{
    \pagestyle{fancy}
    \fancyhf{} % Clear header/footer
    \fancyhead[L]{%
        \parbox[t][1.5cm][t]{0.7\textwidth}{%
            \fontsize{10}{11}\fontshape{it}\selectfont
            \textcolor{gray}{\@suShortTitle}
        }
    }
    \fancyhead[R]{%
        \parbox[t][1.5cm][t]{0.3\textwidth}{%
            \fontsize{10}{11}\fontshape{it}\selectfont
            \hfill \textcolor{gray}{TZ \ReportNumber}
        }
    }
    \fancyfoot[C]{\thepage} % Page number at center of footer
    \renewcommand{\headrulewidth}{0pt} % No line in header
    \renewcommand{\footrulewidth}{0pt} % No line in footer
}

% Macro for the logo-only footer (no header or page number)
\newcommand{\LogoFooterPageStyle}{
    \pagestyle{fancy}
    \fancyhf{} % Clear header/footer
    \fancyfoot[L]{%
      \includegraphics[width=2.47cm]{surao_template/logo.jpg} % SURAO
      \hspace{2em}
      % Organization logo in footer
      \includegraphics[height=0.7cm]{graphics/tul_zkratka_colour_RGB.png} %
    }%
    \renewcommand{\headrulewidth}{0pt} % No line in header
    \renewcommand{\footrulewidth}{0pt} % No line in footer
}

% Macro for simple footer with page number (no header)
\newcommand{\SimpleFooterPageStyle}{
    \pagestyle{fancy}
    \fancyhf{} % Clear header/footer
    \fancyfoot[C]{\thepage} % Page number at center of footer
    \renewcommand{\headrulewidth}{0pt} % No line in header
    \renewcommand{\footrulewidth}{0pt} % No line in footer
}



% % Default page style setup
% \pagestyle{fancy}
% \fancyhf{} % Clear header/footer
% \fancyhead[L]{
%   \parbox[t][2cm][t]{0.3\textwidth}{%
%     % \vspace{-10pt}
%     \fontsize{10}{11}\fontshape{it}\selectfont
%     \textcolor{gray}{\@suShortTitle}
%   }
% } % Example: set a common header
% \fancyhead[R]{
%     \parbox[t][2cm][t]{0.3\textwidth}{%
%     % \vspace{-10pt}
%     \fontsize{10}{11}\fontshape{it}\selectfont
%     \hfill \textcolor{gray}{TZ \ReportNumber}
%   }
% }% Example: set a common header
% \fancyfoot[C]{\thepage} % Page number at center of footer

% \renewcommand{\headrulewidth}{0pt} % No line in header
% \renewcommand{\footrulewidth}{0pt} % No line in footer


\newcommand{\startHeader}[1]{
    {
        \vspace{18pt}
        
        \fontsizeHeaderStart\bfseries\headlinecolor
        \noindent #1

        \vspace{10pt}
    }
}
% Define abstract environment
\newenvironment{suAbstractEnv}[1]%
{
    {
        \vspace{18pt}
        \fontsizeHeaderStart\bfseries\headlinecolor
        \noindent #1
    }
    \noindent\setlength{\parindent}{0pt} % Set paragraph indentation to zero
    \quotation
}%
{\endquotation}

% Custom style definition
\newglossarystyle{glossaryAbbStyle}{
  % The glossary style type (base this on an existing style)
  \setglossarystyle{list}% % \setlength{\itemsep}{0pt}

  % Modify the way each entry is displayed
  \renewcommand*{\glossentry}[2]{%
    \item[\glsentryitem{##1}\glstarget{##1}{\normalfont \glossentryname{##1}}]
    \hfill \parbox[t]{0.9\linewidth}{\glossentrydesc{##1}\glspostdescription\space ##2}
  }
  % \renewcommand*{\glossentry}[2]{%
  %   \item[\glsentryitem{##1}\glstarget{##1}{\normalfont \glossentryname{##1}}]%
  %   \hfill \parbox[t]{0.9\linewidth}{\begin{spacing}{1.15}\glossentrydesc{##1}\glspostdescription\space ##2\end{spacing}}%
  % }%
}
\newglossarystyle{glossaryTermsStyle}{
  % The glossary style type (base this on an existing style)
  \setglossarystyle{list}%
  % Modify the way each entry is displayed
  \renewcommand*{\glossentry}[2]{%
    % Adjust list parameters
    % \setlength{\itemindent}{0pt} % No indentation for items
    % \setlength{\labelwidth}{0pt} % No space for labels
    % \setlength{\leftmargin}{0pt} % Align list with the left margin of the document
    \item[\glsentryitem{##1}\glstarget{##1}{\textbf{\glossentryname{##1}}}] % Term in bold
    \mbox{}
    \smallskip
    \newline
    \glossentrydesc{##1}
    \glspostdescription\space ##2 % Description follows
  }
}
\AtBeginDocument{\makeglossaries}  % Ensure glossaries are ready to be used when the document begins


% Don't reset counters at each chapter
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

% TABLE customization
\captionsetup[table]{
    position=above,
    labelfont=it,
    textfont=it,
    labelsep=period,
    justification=raggedright,
    singlelinecheck=false,
    skip=5pt,
    format=plain
}
\renewcommand{\tablename}{Tab.}
\captionsetup[figure]{
    position=bottom,
    labelfont=it,
    textfont=it,
    labelsep=period,
    justification=raggedright,
    singlelinecheck=false,
    skip=5pt,
    format=plain
}
\renewcommand{\figurename}{Fig.}

%%Body of the class, most of the declarations appear here.
%\renewcommand{\maketitle}{%
    % 
    % % {   % REPORT INFO PAGE
    %     \newpage
    %     \thispagestyle{fancy} % Apply fancy page style
    %     \fancyhf{} % Clear all header/footer fields
    %     \fancyfoot[L]
    %     {
    %         \includegraphics[width=2.47cm]{surao_template/logo.jpg}
    %     }

    %     \mbox{}
    %     \cleardoublepage
        
    %     % \thispagestyle{empty} % Optional: prevents page numbers and headers from appearing on this page
    %     \normalsize
    %     \begingroup
    %     \suparagraph

    %     % \newpage
    %     % \cleardoublepage
        
    %     \noindent
    %     \textbf{REPORT NAME:} 
    %     Sensitivity-Optimized Design of Experiment for EDZ Characterization
        
    %     \textbf{PROJECT NAME:} Influence of Radionuclide Transport in Rock by Disposal Tunnels and EDZ\\
    %     (Ovlivnění transportu radionuklidů v hornině ukládacími chodbami a EDZ.)
        
    %     \textbf{PROJECT IDENTIFICATION:}\\
    %     Ongoing report
        
    %     \textbf{CONTRACT NUMBER:} \textit{SO2021-053-06}
        
    %     \textbf{Bibliographical record:} Březina J., Exner P., Stebel J. (2024) Pore Pressure Experiment Design Report, SURAO Report No.\ReportNumber
        
    %     \textbf{RESEARCHERS:}\\
    %     Faculty of Mechatronics, Informatics and Interdisciplinary Studies,\\
    %     Technical University of Liberec
    %     % Institution 1\textsuperscript{1},
    %     % Institution 2\textsuperscript{2},
    %     % Institution 3\textsuperscript{3}

    %     \noindent
    %     \textbf{TEAM OF AUTHORS:}
    %     Březina J., Exner P., Stebel J.
    %     % Author 1\textsuperscript{1},
    %     % Author 2\textsuperscript{3}
    %     % (format for author names – Surname F.)\\
    %     % The superscripts after the authors' names refer to the list of institutions above. 

    %     \vspace{12cm}
    %     \noindent
    %     ~
    %     \begin{minipage}[t][2.5cm][t]{0.49\textwidth}
    %         \vfil
    %         \suparagraph
    %         \normalsize
    %         \textbf{Ondrej Mikláš}
            
    %         Project manager (SÚRAO)
            
    %         %DD/MM/YYYY
    %     \end{minipage}
    %     \begin{minipage}[t][2.5cm][t]{0.49\textwidth}
    %         \vfil
    %         \suparagraph
    %         \normalsize
    %         \textbf{Jan Březina}
            
    %         Project manager (TUL)
            
    %         %DD/MM/YYYY
    %     \end{minipage}
        
    %     \endgroup
        
    %     \newpage
    %     \mbox{}
    %     \cleardoublepage
    %     % \fancyhf{}
    %     % \fancyhead[C]{Common header}
    % }



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Title page

\SetupKeyvalOptions{
    family=TitlePageKeys, % Define a separate keyval group for TitlePage
    prefix=titlepage@     % Prefix to avoid name clashes
}

% Define keys with local defaults for \TitlePage
\DeclareStringOption[Default Title]{title}
\DeclareStringOption[Default Subtitle]{subtitle}
\DeclareStringOption[Default Author]{author}
\DeclareStringOption[Default Institution]{institution}
\DeclareStringOption[Default Date]{date}
    
\newcommand{\TitlePage}[1]{
    \begingroup
    \setkeys{TitlePageKeys}{#1} % Parse key-value options
    \newgeometry{left=2.5cm,top=2cm,right=2.5cm,bottom=2cm} % Adjust margins

    \begin{titlepage}
        % Background image with TikZ
        \begin{tikzpicture}[remember picture,overlay]
            \node[opacity=1,anchor=west,inner sep=0pt,outer sep=0pt] 
                at (current page.west){\includegraphics[height=1.01\paperheight]{surao_template/title.jpg}};
        \end{tikzpicture}

        % Technical report number
        {
            \hfill
            \fontsize{11}{12}\fontseries{b}\selectfont
            Technical report \ReportNumber
        }

        % Title
        \vspace{2.71cm}
        \hfill
        \begin{minipage}[t][8.52cm][t]{11.05cm}
            \suparagraph
            \vfil
            \raggedleft
            \fontsize{22}{24}\selectfont
            \headlinecolor
            \smallcaps{\titlepage@title}
        \end{minipage}

        % Authors
        \vspace{2.71cm}
        \hfill
        \begin{minipage}[t][1.68cm][t]{9cm}
            \vfil
            \raggedleft
            \hfill
            \normalsize
            Authors: \titlepage@author
        \end{minipage}

        % Footer with location and year
        \vfill
        {
            \hfill
            \fontsize{11}{12}\fontseries{b}\selectfont
            Liberec, \ReportYear
        }
    \end{titlepage}
    \restoregeometry
    \LogoFooterPageStyle
    \newpage
    \ 
    \newpage
    \endgroup
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Report Info

% Define the key-value interface
\SetupKeyvalOptions{
    family=ReportInfoKeys, % Define a separate keyval group for \ReportInfo
    prefix=reportinfo@     % Prefix to avoid name clashes
}

% Define keys with local defaults for \ReportInfo
\DeclareStringOption[Default Report Name]{reportname}
\DeclareStringOption[Default Project Name]{projectname}
\DeclareStringOption[Default Project ID]{projectid}
\DeclareStringOption[Default Contract Number]{contractnumber}
\DeclareStringOption[Default Bibliographical Record]{bibrecord}
\DeclareStringOption[Default Researchers]{researchers}
\DeclareStringOption[Default Authors]{authors}
\DeclareStringOption[Default Manager 1]{managernameone}
\DeclareStringOption[Default Affiliation 1]{manageraffiliationone}
\DeclareStringOption[Default Manager 2]{managernametwo}
\DeclareStringOption[Default Affiliation 2]{manageraffiliationtwo}

\newcommand{\ReportInfo}[1]{
    % Save original options and allow overriding with command-specific ones
    \begingroup
    \setkeys{ReportInfoKeys}{#1}
    % Generate the Report Info page
    \LogoFooterPageStyle
    \newpage
    %
    \normalsize
    \suparagraph
    \noindent
    \textbf{REPORT NAME:} \reportinfo@reportname \par
    \textbf{PROJECT NAME:} \reportinfo@projectname \par
    \textbf{IDENTIFICATION WITHIN THE PROJECT:} \reportinfo@projectid \par
    \textbf{CONTRACT NUMBER:} \textit{\reportinfo@contractnumber} \par
    \textbf{BIBLIOGRAPHICAL RECORD:} \reportinfo@bibrecord \par
    \textbf{PARTICIPATING ORGANIZATIONS:} \reportinfo@researchers \par
    \textbf{TEAM OF AUTHORS:} \reportinfo@authors \par

    \vspace{12cm}
    \noindent
    \begin{minipage}[t][2.5cm][t]{0.49\textwidth}
        \vfil
        \suparagraph
        \normalsize
        \textbf{\reportinfo@managernameone}
        \par Project manager (\reportinfo@manageraffiliationone)
        \par
    \end{minipage}
    \begin{minipage}[t][2.5cm][t]{0.49\textwidth}
        \vfil
        \suparagraph
        \normalsize
        \textbf{\reportinfo@managernametwo}
        \par Project manager (\reportinfo@manageraffiliationtwo)
        \par
    \end{minipage}
    \clearpage
    \newpage
    \ 
    \newpage
    \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Table of Content

\newcommand{\TableOfContents}{
    \begingroup    
    \SimpleFooterPageStyle
    \newpage
    {   % TABLE OF CONTENTS
        \fancyhf{}
        % \thispagestyle{fancy} % Apply fancy page style
        % \fancyhead[C]{Table of Contents} % Custom header for ToC
        \normalsize
        \begingroup
        \setstretch{1.15} % "above spaceing set using tocloft"
        \tableofcontents
        % \fancyhead[C]{General Header} % Reset to general header after ToC
    
        % {
        %     \vspace{18pt}
        %     \startHeader{List of Annexes}
            
        %     \noindent
        %     The "List of Annexes" heading is formatted as a SÚRAO heading, i.e. Arial Bold font, size 14 pt, dark green SÚRAO – RGB (0,102,53), CMYK (91,12,92,44). The indent before paragraphs is 18 pt.
            
        %     \vspace{10pt}
        %     \par\noindent \textbf{Reference Examples:}
        %     \vspace{10pt}
            
        %     \noindent The "Reference Examples" heading is formatted as SÚRAO Normal bold, i.e. Arial Bold font, size 11 pt, black. The indent before paragraphs is 10 pt.
        % }
        \endgroup
        \clearpage
    }

    {   % LIST OF  ABBREVIATIONS AND GLOSSARY
        \begingroup
        \setstretch{1.15}
        \setglossarystyle{glossaryAbbStyle}
        \printglossary[type=\acronymtype,title={\fontsizeHeaderStart List of abbreviations:\medskip}, toctitle=List of abbreviations]

        \vspace{18pt}
        \setglossarystyle{glossaryTermsStyle}
        \printglossary[title={\fontsizeHeaderStart Explanation of terms:\medskip}, toctitle=Explanation of terms]
        \endgroup
        \clearpage
    }
    \newpage
    \endgroup
    %\restoregeometry
}

%     {   % ABSTRACT
%         % \fancyhf{}
%         % \cfoot{\thepage} % Page number at center of footer
%         {
%             % \vspace{6pt}
%             \startHeader{Abstract}
%             \suparagraph
%             \@suAbstract
%             % \vspace{8pt}
%         }
%         {
%             % \vspace{6pt}
%             \startHeader{Keywords}
%             \suparagraph
%             \@suKeywords
%             % \vspace{8pt}
%         }
%         % \begin{suAbstractEnv}{Abstract}
%         % % \noindent\setlength{\parindent}{0pt} % Set paragraph indentation to zero
%         % % \setlength{\leftmargin}{0pt} % Align list with the left margin of the document
%         %   \noindent\@suAbstract
%         % \end{suAbstractEnv}
%         % \begin{suAbstractEnv}{Keywords}
%         %   \noindent\@suKeywords
%         % \end{suAbstractEnv}
%         \vfill
%         \clearpage
%     }   
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Abstract

% Define key-value interface for Abstract
\SetupKeyvalOptions{
    family=AbstractKeys,
    prefix=abstractkeys@
}

% Define keys with defaults
\DeclareStringOption[Default Abstract]{abstract}
\DeclareStringOption[Default Keywords]{keywords}
\DeclareStringOption[en]{lang}

\newcommand{\surao@setabstractheaders}{%
  % default (English)
  \def\surao@AbstractTitle{Abstract}%
  \def\surao@KeywordsTitle{Keywords}%

  % Czech variants: cs, cz, czech
  \IfStrEq{\abstractkeys@lang}{cs}{%
    \def\surao@AbstractTitle{Abstrakt}%
    \def\surao@KeywordsTitle{Klíčová slova}%
  }{}%
  \IfStrEq{\abstractkeys@lang}{cz}{%
    \def\surao@AbstractTitle{Abstrakt}%
    \def\surao@KeywordsTitle{Klíčová slova}%
  }{}%
  \IfStrEq{\abstractkeys@lang}{czech}{%
    \def\surao@AbstractTitle{Abstrakt}%
    \def\surao@KeywordsTitle{Klíčová slova}%
  }{}%
}

\newcommand{\MakeAbstract}[1]{%
  \begingroup
  \DefaultPageStyle
  \setkeys{AbstractKeys}{#1}% Parse key-value options

  \surao@setabstractheaders % decide headers based on lang

  % Abstract Section
  {%
    \startHeader{\surao@AbstractTitle}%
    \suparagraph
    \abstractkeys@abstract
    % \vspace{2pt}%
  }%

  % Keywords Section
  {%
    \startHeader{\surao@KeywordsTitle}%
    \suparagraph
    \abstractkeys@keywords
  }%

  \vfill
  \endgroup
  \DefaultPageStyle
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Last Page


\newcommand{\makeLastPage}{%
    \fancyhf{}
    
    \newpage
    \thispagestyle{empty}
    \mbox{}
    \clearpage

    \newpage
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture,overlay]
        \node[opacity=1,anchor=center, inner sep=0pt,outer sep=0pt] at (current page.center){\includegraphics[width=1.01\paperwidth,height=1.01\paperheight]{surao_template/back.jpg}};
    \end{tikzpicture}
    \clearpage
}

% \setlength{\textwidth}{16cm}
% \setlength{\textheight}{27.7cm}
% \setcounter{secnumdepth}{0}
