## Introduction

Scientific papers in Mathematics, Engineering and Science as well was data in Wikis like Wikipedia concerning science-related topics, contain a high density of mathematical formulae.
Therefore, computer-related processing of this data requires specific approaches. Editing mathematical formulae using standard \LaTeX{} macros is efficient for the production of printing media.
Nevertheless, semantically-augmented mathematical expressions, e.g. in content MathML, have significant advantages over presentation only formulae~[@dis].
They are better searchable and computable and can interactively support the reader in disambiguation and explanation tasks.
There are a few visual editors for MathML. Some of them support the generation of content MathML, most notable 'formulator`~[@Formulator] and the WIRS editor~[@Marques2006].
From the available tools, only the WIRS editor seems to be maintained and widely used.
However, the editor is not open source, and it supports content MathML only as an alternative to presentation MathML.
While for most use cases, determining the presentation from the content form is highly desirable, for Wikimedia use, the backward compatibility is a condicio sine qua non.
Thus, the content editor must provide semantics as an add-on, without changing the presentation form.
Also, active-documents for mathematical content~[@Kohlhase11] make use of semantically-rich formulae.

Wikimedia is making a lot of effort to facilitate contributors to create and edit content in Wikipedia.
Especially, the development of a visual editor eased the process for many contributors while still enabling. contributors to change the wikitext markup rather than use the new visual editor, as the editor produces very clean and minimalistic markup.
However, the visual editor is still unsatisfactory for content with mathematical expressions. It provides a list of LaTeX templates rather than allowing to edit the formula layout visually.

Wikidata, Wikimedia's language-independent central, contains a significant fraction of world knowledge in machine-readable form knowledgebase, due to a large number of items and links between the items.
It allows to store and edit mathematical formulae.
Nevertheless, only the presentation form of the formula can be edited in Wikidata. 

We have the vision of an extension of the visual editor in Wikimedia that allows contributors to semantically enrich mathematical expressions.
The added data as well as the formulae can be stored in Wikidata.
A visual expression tree will be provided for the formulae.
Thus, the user of the editor can add content to every element of the mathematical expression.
Therefore, better editors for both, Wikipedia and Wikidata, will facilitate the creation of semantically-rich mathematical expressions.

## Requierements
Consequently, we need a math editing tool that fulfills the following requirements:
The tool

* must not disturb current editing workflows.
* must allow the user to augment the formulae in terms of Wikidata items.
* should allow to edit semantics without changing the layout.
* produces standard compatible MathML output.
* and its source code must be available under a MediaWiki compatible license.


## Implementation
VMEdit attempts to fill this gap taking advantage of the VMEXT visualization~[@vmext17].
The workflow is as follows:

1. A user starts from a traditional LaTeX formula and an item in the knowledge base
2. The initial tree representation is generated via LaTeXML and visualized using the VMEXT visualization.
3. The user might link individual symbols to wikidata items
4. The user might reorder the tree or change the MathML field directly.
5. If the user is satisfied with the result, the result can be submitted.
6. If the semantics can be modeled by changing properties of the item, the change is directly inserted into Wikidata to be edited. Otherwise, a bug report is created.
7. If a bug report was created, the tool maintainers are notified. The user has the opportunity to add additional comments on his intended change.

### Technology

The implementation is done in javascript with [node](https://nodejs.org) and [brunch](https://brunch.io).
For details, please refer to our git repository.
Since all user input is stored in the bug report, it is possible to apply the changes at a later time.

### Linking of symbols
To link a content symbol a popup opens that let the user choose the appropriate wikidata symbol.

### Changing of the structure
The content MathML structure can be changed by drag and drop.


## Conclusion and Outlook

VMEdit is a first step towards semantic formulae in the Wikimedia projects.
The future will show, if the tool is used by the community.

\paragraph*{Non Wikimedia use}

Technically, the tool can also be used with another knowledgebase or for editing MathML without a dedicated knowledgebase.
We plan to integrate it to the DRMF website which uses a different LaTeX dialect, but also a Wikibase knowledge base.

