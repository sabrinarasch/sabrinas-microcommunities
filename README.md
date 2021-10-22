# Sabrina's microbial community project


\documentclass{article}

\title{READ ME}
\author{Sabrina Rasch}
\date{\today}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{lmodern}
\usepackage{parskip}
\usepackage[english]{babel} %to set the language
\usepackage{a4wide}
\usepackage{graphicx} 
\usepackage{float} %placing of pictures/tables
\usepackage{rotating} %rotating a figure
\usepackage{array} %costomize the size of tables
\usepackage{ragged2e} %flashleft/right
\usepackage{tabularx}
\usepackage{longtable} %use this if you got a table that can be longer than one page
\usepackage{array} %for tables with fixed length 
\usepackage{tabularew}
\usepackage{rotating}
\usepackage{pdflscape}
\usepackage{amsmath} %for math environment \begin{align} \end{align}

\usepackage{color}   %May be necessary if you want to color links
\usepackage{hyperref}
\hypersetup{
    colorlinks=false, %set true if you want colored links
    linktoc=all,     %set to all if you want both sections and subsections linked
    %linkcolor=blue,  %choose some color if you want links to stand out
}




\begin{document}
\maketitle
\tableofcontents
\newpage

\section{First Data}
    \begin{itemize}
        \item Contains Data and R Code that was used to solve the fist Steps (see R Notebook ''Step--by--step.Rmd'' for more Information on the Steps)
        \item Original Files
        \begin{itemize}
            \item alltogether\_modified.prt
            \item alltogether\_modified.gen.fasta.gen
            \item alltogether\_modified.lst.txt
            \item FixedMutations\_OverTime.txt
            \item FixedMutations\_over\_time.pdf
            \item FixedMutation\_over\_time\_Mado.pdf
            \item allSNPs\_w\_gene\_position.tsv
        \end{itemize}
        \item Files manipulated in Visual Studio Code
        \begin{itemize}
            \item allSNPs\_w\_gene\_position\_spaced.tsv
            \item alltogether\_modified.gen.fasta -- not nicely.gen
            \item alltogether\_modified.gen.fasta.AGTU.gen
            \item Error.txt
        \end{itemize}
        \item Outputs from R Notebook
        \begin{itemize}
            \item Result\_sorted.csv
        \end{itemize}
        \item Other Files
        \begin{itemize}
            \item By Hand.xlsx: Counted the nucleotides by hand to find the SNP reference from the gen.fasta data. This is where I found the Error
            \item Confusion.xlsx: Excel table of not nicely search for the reference nucleotide from the gen.fasta data for the SNPs. 
        \end{itemize}
        \item Code: Step-by-step.Rmd
    \end{itemize}
    
    
\section{Infos}
    \begin{itemize}
       \item Contains documents that have an informational purpose.
        \item Introduction paper: the first paper Mado gave me, that explains a lot about my data and why I do this project.
        \item Meetings: Notes from meetings with Mado
        \item Presentation in Labmeeting 23.09. (Mado): PPP from Mado about her talk in the Labmeeting
    \end{itemize}
    
    
\section{Papers}
    \begin{itemize}
        \item Contains papers that could be useful.
        \item N.Surname -- Year -- Title
    \end{itemize}




\end{document}
