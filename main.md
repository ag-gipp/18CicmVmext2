## Introduction

Publications in science, technology, engineering and mathematics as well was science-related content in other formats, e.g. Wikipedia, contain a high density of mathematical formulae.
Therefore, computer-related processing of this data requires specific approaches.
While editing mathematical formulae using standard LaTeX macros is efficient for the production of printing media, semantically-augmented mathematical expressions, e.g. in content MathML, have significant advantages over presentation only formulae~[@dis].
Semantically-augmented mathematical formulae are better searchable and computable.
They can interactively support the reader in disambiguating terms or single identifiers and give additional explanations to the reader.
One implementation of this are active-documents for mathematical content~[@Kohlhase11].
They use MathML to implement semantically rich formulae, which they generate from the LaTeX-dialect sTeX.
To edit MathML (directly without LaTeX) a few visual editors exist.
Some of the visual editors, most notable 'formulator`~[@Formulator] and the WIRS editor~[@Marques2006], support the generation of content MathML.
From the available tools, only the WIRS editor seems to be maintained and widely used.
However, the editor is not open source, and it supports content MathML only as an alternative to presentation MathML.
For most use cases, determining the presentation from the content form is highly desirable.
Nevertheless, for exiting large exiting presentation based digital libraries such as Wikipedia, the backward compatibility is a condicio sine qua non.
Thus, the content editor must provide semantics as an add-on, without changing the presentation form.


Wikimedia invested significantly to become more inclusive and allow everyone to create and edit content in Wikipedia.
Especially, the development of the VisualEditor eased the process for many contributors, since knowledge of the syntax of wikitext markup is no longer needed.
Nonetheless, in contrast to other WYSIWYG editors, the VisualEditor still enables users to  conveniently edit the wikitext markup, as the editor produces very clean and minimalistic markup.
This way, the huge existing editor group is not antagonized.
However, the VisualEditor is still unsatisfactory for content with mathematical expressions, as it provides a list of LaTeX templates rather than allowing to edit the formula layout visually as shown in Figure~\ref{fig.overview}.

Our goal is to extend the VisualEditor to allow contributors to semantically enrich mathematical expressions.
The semantic enrichments should be grounded on the knowledgebase Wikidata.
Wikidata, Wikimedia's language-independent central knowledgebase, contains a significant fraction of world knowledge in machine-readable form and is used for many other semantic enrichments in Wikipedia in particular in interlanguage links, authority control for persons and other bibliographic data as well as the management of social, economic and geographic fact data.

 
In the following, we will describe our Approach in Section 2, present the current state of our Implementation in Section 3 and describe the next steps in Section 4.

## Approach



Therefore, a visual expression tree will be provided for the formulae.
Thus, the user of the editor can add content to every element of the mathematical expression.
The formulae as well as the added data can be stored in Wikidata.
Thus, better editors for both, Wikipedia and Wikidata, will facilitate the creation of semantically-rich mathematical expressions.


Consequently, we need a math editing tool that fulfills the following requirements:
The tool

* must allow the user to augment the formulae with Wikidata items.
* should allow to edit semantics without changing the layout.
* produces standard compatible MathML output.
* and its source code must be available under a MediaWiki compatible license.
* must not disturb current editing workflows.


## Implementation
\input{figVis}
VMEdit attempts to fill this gap taking advantage of the VMEXT visualization~[@vmext17].
The workflow is as follows:

1. A user starts from a traditional LaTeX formula and an item in Wikidata
2. The initial tree representation is generated via LaTeXML and visualized using the VMEXT visualization.
3. The user might link individual symbols to wikidata items.
4. The user might reorder the tree or change the MathML field directly.
5. If the user is satisfied with the result, the result can be submitted.
6. If the semantics can be modeled by changing properties of the item, the change is directly inserted into Wikidata to be edited.
Otherwise, a bug report is created.
7. If a bug report was created, a notification is sent to the tool maintainers.
Therefore, the user can add additional comments on his intended change.

### Technology

The implementation is done in javascript with [node](https://nodejs.org) and [brunch](https://brunch.io).
For the code editor, we use [CodeMirror](http://codemirror.net/) and for the graph visualization [cytoscape](https://js.cytoscape.org/) with the [dagre](http://doi.org/10.5281/zenodo.1211727)-plugin.
For details, please refer to our git repository.
Since all user input is stored in the bug report, it is possible to apply the changes later.

### Linking of symbols
To link a content symbol to Wikidata, a popup opens that let the user choose the appropriate Wikidata item.

### Changing of the structure
The content MathML structure can be changed by drag and drop.

\clearpage
## Conclusion and Outlook

VMEdit is a first step towards semantic formulae in the Wikimedia projects.
The future will show, if the tool is used by the community.

\paragraph*{Non-Wikimedia use}

Technically, the tool can also be used with another knowledgebase or for editing MathML without a dedicated knowledgebase.
We plan to integrate it to the DRMF website which uses a different LaTeX dialect, but also a Wikibase knowledge base.
