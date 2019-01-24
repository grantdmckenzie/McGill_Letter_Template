
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mcgill_letter}
\RequirePackage{graphicx}
\RequirePackage{epstopdf}
\RequirePackage{epsfig}
\RequirePackage{ifthen}
\DeclareGraphicsExtensions{.png}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass[letterpaper]{letter}

\newboolean{logofound}
\IfFileExists{mcgill-logo.png}
    {\setboolean{logofound}{true}}
    {\setboolean{logofound}{false}}

\setlength{\textwidth}{6.875in}
\setlength{\textheight}{7.8in}
\setlength{\topskip}{-1.0in}
\setlength{\footskip}{0.7in}
\setlength{\oddsidemargin}{-0.25in}
\setlength{\evensidemargin}{-0.25in}
\setlength{\topmargin}{-1.10in}

\DeclareFixedFont{\xcmrbn}{OT1}{cmr}{b}{n}{10}
\DeclareFixedFont{\xcmrmn}{OT1}{cmr}{m}{n}{10}
\DeclareFixedFont{\ixcmrmn}{OT1}{cmr}{m}{n}{10}

\newsavebox{\departmenthead}
\newsavebox{\departmentfoot}
\newsavebox{\emptyfoot}

\sbox{\departmenthead}{
    \begin{tabular*}{\textwidth}
                    {@{}l@{\extracolsep{0.0in}}@{\extracolsep{0.125in}}l@{}}
    \parbox{2.5in}{\raggedright
	    {\hspace*{-2mm}\epsfig{file=mcgill-logo.jpg, height=0.472in, width=2in}\vspace*{4mm}}
    } 
\\
    \parbox[t]{2.7in}{\raggedright \footnotesize Department of Geography\\McGill University\\805 Sherbrooke St. West\\Montreal, QC, Canada H3A 0B9}
    \parbox[t]{2.7in}{\raggedright \footnotesize D\'epartement de g\'eographie\\Universit\'e McGill\\805, rue Sherbrooke Ouest\\Montr\'eal, QC, Canada H3A 0B9}
    \parbox[t]{2.5in}{\raggedright \footnotesize Tel: 514-398-4111\\Fax: 514-398-7437}
    \end{tabular*}
}


\savebox{\departmentfoot}[\textwidth][t]{\small
	\centering
   \hfill YOUR NAME $\cdot$ YOUR EMAIL $\cdot$  YOUR WEBSITE\hfill}


% header and footer should be placed only on the first page
\renewcommand{\ps@firstpage}{

    \setlength{\headheight}{1.375in}
    \setlength{\headsep}{0.5in}
    \renewcommand{\@oddhead}{\usebox{\departmenthead}}
    \renewcommand{\@oddfoot}{\usebox{\departmentfoot}}
    \renewcommand{\@evenhead}{}
    \renewcommand{\@evenfoot}{}
}

\renewcommand{\ps@empty}{
    \setlength{\headheight}{1.375in}
    \setlength{\headsep}{0.5in}
    \renewcommand{\@oddhead}{}
    \renewcommand{\@oddfoot}{\usebox{\emptyfoot}}
    \renewcommand{\@evenhead}{}
    \renewcommand{\@evenfoot}{\usebox{\emptyfoot}}
}

\providecommand{\@evenhead}{}
\providecommand{\@oddhead}{}
\providecommand{\@evenfoot}{}
\providecommand{\@oddfoot}{}

\pagestyle{empty}


% we push closing to the right
\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
    \stopbreaks
    \noindent
    \hspace*{0.8\textwidth}\parbox{0.4\textwidth}{\raggedright
    \ignorespaces #1\\[2\medskipamount]%
    \ifx\@empty\fromsig
        \fromname
    \else \fromsig 
    \fi\strut}%
    \par
}