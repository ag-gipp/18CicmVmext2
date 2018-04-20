\section{Introduction}
Wikimedia has invested heavily in lowering the burden for contributors, by developing a visual editor.
Unlike many other WYSIWYG editors, Wikimedia's editor produces very clean an minimalistic markup.
Thus, traditional contributors can continue changing the wikitext markup rather than using the new visual editor.
However, the math editing feature of the visual editor is limited as it only provides a list of LaTeX templates rather than allowing to edit the formula layout visually.
Also, Wikidata, Wikimedia's language independent central knowledgebase, also allows to store and edit mathematical formulae.
In Wikidata only the source code of the formula can be edited.
Nonetheless, due to a large number of items and relations between the items Wikdiata already contains a significant fraction of world knowledge in machine-readable form.
Outside of Wikimedia, there are a few visual editors for MathML, of which some support the generation of content MathML, most notable 'formulator` and the WIRS editor~\cite{Formulator, Marques2006}.
Moreover, there are various standards for representing Mathematical Knowledge~\cite{Lange2013}.
Also, active-documents for mathematical content~\cite{Kohlhase11} make use of semantically rich formulae.
\section{Goal and Vision}
Editing mathematical formulae using standard \LaTeX{} macros is efficient for reproducing printing material on the screen.
However, we argue that better editors for both Wikipedia and Wikidata will facilitate the creation of semantically rich mathematical expressions.
Semantically augmented mathematical expressions have significant advantages over presentation only formulae~\cite{dis}.
For instance, they are better searchable, computable and can interactively support the reader with disambiguation and explanation tasks.
Consequently, we need a Math editing tool that fulfills the following requirements:
\begin{enumerate}
\item The tool
\end{enumerate}
\section{Implementation}
VMEdit attempts to fill this gap taking advantage of the VMEXT visualization~\cite{vmext17}.
\section{Conclusion and Outlook}
