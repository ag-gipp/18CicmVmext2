## Introduction

Wikimedia has invested heavily in lowering the burden for contributors, by developing a visual editor.
Unlike many other WYSIWYG editors, Wikimedia's editor produces very clean an minimalistic markup.
Thus, traditional contributors can continue changing the wikitext markup rather than using the new visual editor.
However, the math editing feature of the visual editor is limited as it only provides a list of LaTeX templates rather than allowing to edit the formula layout visually.
Also, Wikidata, Wikimedia's language independent central knowledgebase, also allows to store and edit mathematical formulae.
In Wikidata only the source code of the formula can be edited.
Nonetheless, due to a large number of items and relations between the items Wikdiata already contains a significant fraction of world knowledge in machine-readable form.
Outside of Wikimedia, there are a few visual editors for MathML, of which some support the generation of content MathML, most notable 'formulator`~[@Formulator] and the WIRS editor~[@Marques2006].
Moreover, there are various standards for representing Mathematical Knowledge~[@Lange2013].
Also, active-documents for mathematical content~[@Kohlhase11] make use of semantically rich formulae.

## Goal and Vision

Editing mathematical formulae using standard \LaTeX{} macros is efficient for reproducing printing material on the screen.
However, we argue that better editors for both Wikipedia and Wikidata will facilitate the creation of semantically rich mathematical expressions.
Semantically augmented mathematical expressions have significant advantages over presentation only formulae~[@dis].
For instance, they are better searchable, computable and can interactively support the reader with disambiguation and explanation tasks.
Consequently, we need a Math editing tool that fulfills the following requirements:

* The tool must not disturb current editing workflows.
* It must allow the user to augment the formulae in terms of Wikidata items.
* The content must be editable without changing the layout.
* It should produce standard compatible, MathML output.
* The tool and it's source code must be available under a MediaWiki compatible licence.

Among the available tools, only the WIRS editor seems to be actively maintained and widely used.
However, the editor is not open source and content MathML is only supported as an alternative to presentation MathML.
While for most use cases the determination of the presentation from content form is highly desirable, for Wikimedia use the backwards compatibility is  condicio sine qua non.
Thus, the content editor must provide semantics as add on without changing the presentation form.

## Implementation
VMEdit attempts to fill this gap taking advantage of the VMEXT visualization~[@vmext17].
The workflow is as follows:

1. A user starts from a traditional LaTeX formulae and an item in the knowledge base
2. The initial tree representation is generated via LaTeXML and visualized using the VMEXT visualization.
3. The user know might link individual symbols to wikidata items
4. The user might reorder the tree or change the MathML field directly.
5. If the user is satisfied with the result, she submits the result
6. If the semantics can be modelled by changing properties of the item the change is directly inserted into Wikidata to be edited, otherwise a bug report is created
7. If a bug report was created the tool maintainers are notified. The user has the oppertunity to add additional comments on his intended change.

### Technology

The implementation is done in pure javascript with node and brunch. 

The bug report  

## Conclusion and Outlook

VMEdit is now in a gioi

### Non Wikimedia use
