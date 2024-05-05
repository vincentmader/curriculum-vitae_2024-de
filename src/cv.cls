\ProvidesClass{cv}
\LoadClass[a4paper, 11pt]{article}

% PACKAGES

    \RequirePackage{enumitem}
    \RequirePackage{fontawesome5}
    \RequirePackage[margin=1cm]{geometry}
    \RequirePackage{graphicx}
    \RequirePackage[hidelinks]{hyperref}
    \RequirePackage{multicol}
    \RequirePackage{tabularx}
    \RequirePackage{titlesec}
    \RequirePackage{xcolor}
    \RequirePackage{xstring}

% CONFIGURATION

    % \setlength{\footskip}{4.08003pt}
    \setlength\parindent{0pt}
    \renewcommand{\familydefault}{\sfdefault}
    \fontfamily{\familydefault}\selectfont
    \pagenumbering{gobble}

% COMMANDS FOR SETTING VARIABLES

    \newcommand*{\setImagePath}[1]{\def\@imagePath{#1}}

    \newcommand*{\setName}[3]{\def\@firstName{#1}\def\@middleName{#2}\def\@lastName{#3}}
    \newcommand*{\setDateOfBirth}[1]{\def\@dateOfBirth{#1}}
    \newcommand*{\setPlaceOfBirth}[2]{\def\@cityOfBirth{#1}\def\@countryOfBirth{#2}}
    \newcommand*{\setNationality}[1]{\def\@nationality{#1}}

    \newcommand*{\setMailAddress}[1]{\def\@mailAddress{#1}}
    \newcommand*{\setPhoneNumber}[1]{\def\@phoneNumber{#1}}
    \newcommand*{\setUrlToGitHub}[1]{\def\@urlToGitHub{#1}}
    \newcommand*{\setUrlToLinkedIn}[1]{\def\@urlToLinkedIn{#1}}
    \newcommand*{\setUrlToWebSite}[1]{\def\@urlToWebSite{#1}}
    \newcommand*{\setUrlToYouTube}[1]{\def\@urlToYouTube{#1}}

    \definecolor{lightGray}{rgb}{0.725, 0.725, 0.725}
    \definecolor{darkGray}{rgb}{0.450, 0.450, 0.450}
    \definecolor{blue}{rgb}{0.22, 0.45, 0.70}
    \newcommand{\basecolor}{blue}

% UTILITIES

    \renewcommand*{\fbox}{\fcolorbox{\basecolor}{white}}
    % \renewcommand*{\faPhoneSquare}{\faPhoneSquare}
    \newcommand*{\ExtractFirstChar}[1]{%
    \StrRemoveBraces{#1}[\FirstChar]%
    \StrChar{\FirstChar}{1}[\FirstChar]%
    \FirstChar
}

% COMMANDS FOR RENDERING

    \newcommand*{\image}{
        \parbox{2.75cm}{\fbox{\includegraphics[width=2.75cm]{\@imagePath}}}
    }
    \newcommand{\personalLinks}{
        \parbox[c][2.75cm]{7cm}{
            \begin{tabular}{p{0.2cm} p{4cm}}
                \textcolor{\basecolor}{\faPhoneSquare} & \href{\@phoneNumber}{\@phoneNumber} \\
                \textcolor{\basecolor}{\faEnvelopeSquare} & \href{mailto:\@mailAddress}{\@mailAddress} \\
                \textcolor{\basecolor}{\faGithubSquare} & \href{\@urlToGitHub}{\@urlToGitHub} \\
                \textcolor{\basecolor}{\faLinkedin} & \href{\@urlToLinkedIn}{\@urlToLinkedIn} \\
                \textcolor{\basecolor}{\faYoutubeSquare} & \href{\@urlToYouTube}{\@urlToYouTube} \\
                \textcolor{\basecolor}{\faGlobe} & \href{\@urlToWebSite}{\@urlToWebSite} \\
            \end{tabular}
        }
    }
    \newcommand{\titleName}{
        \parbox[c][2.75cm]{10.4cm}{
            \begin{flushright}
                \Huge
                \textcolor{lightGray}{\@firstName\ \ExtractFirstChar{\@middleName}.}\ % 
                \textcolor{darkGray}{\@lastName}
                \\ \Large
                \textit{\textcolor{darkGray}{Curriculum Vitae}}
            \end{flushright}
            \vspace*{1.3cm}
        }
    }

    \newcommand{\header}{
        \image\ 
        \begin{tabular}{p{5cm} p{10.4cm}}
            \personalLinks 
            & \titleName
        \end{tabular}
    }

    \newcommand{\foo}[1]{\item\begin{tabular}{p{3.5cm} l}#1\end{tabular}\vspace{-0.25cm}}
    \newcommand{\personalDetails}{\vspace*{-4mm}
        \begin{multicols}{2}
            \begin{itemize}[leftmargin=*, labelsep=0mm]
                \foo{\textbf{Full Name}     & \@firstName\ \@middleName\ \@lastName}
                \foo{\textbf{Date of Birth} & \@dateOfBirth}
            \end{itemize}\vspace*{-4mm}
            \begin{itemize}[leftmargin=*, labelsep=0mm]
                \foo{\textbf{City of Birth} & \@cityOfBirth, \@countryOfBirth}
                \foo{\textbf{Nationality}   & \@nationality}
            \end{itemize}
        \end{multicols}
        \vspace*{-7mm}
        % \begin{itemize}
        %     % \foo{\textbf{Name}           & \@firstName\ \@middleName\ \@lastName}
        %     \item a
        % \end{itemize}
        % \begin{tabular}{l l}
        %     \textbf{Name}           & \@firstName\ \@middleName\ \@lastName \\
        %     \textbf{City of Birth}  & \@cityOfBirth \\
        %     \textbf{Date of Birth}  & \@dateOfBirth \\
        %     \textbf{Nationality}    & \@nationality
        % \end{tabular}\vspace*{-4mm}
    }

    \titleformat{\section}{
        \vspace{-4pt}\scshape\raggedright\large\color{\basecolor}\bfseries
    }{}{0em}{}[\color{\basecolor}\titlerule \vspace{-7pt}]

    % \renewcommand\labelitemi{\tiny$\bullet$}
    \renewcommand\labelitemi{}

\newcommand{\resumeSubheading}[4]{\item
    \begin{tabular*}{0.98\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{#1} & \textit{\footnotesize{#4}}
    \end{tabular*} \\
    \begin{tabular*}{0.98\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textit{\footnotesize{#3}} & \footnotesize{#2}
    \end{tabular*}
}
\newcommand{\resumeSubHeadingListStart}{
    \begin{itemize}[leftmargin=*, labelsep=0mm]\itemsep-1mm
}
\newcommand{\resumeSubHeadingListEnd}{
    \end{itemize}\vspace{-8mm}
}
\newcommand{\resumePOR}[3]{\vspace{0.5mm}\item
    \begin{tabular*}{0.97\textwidth}[t]{l@{\extracolsep{\fill}}r}
        \textbf{#1}\hspace{0.3mm}#2 & \textit{\small{#3}} 
    \end{tabular*}
}
