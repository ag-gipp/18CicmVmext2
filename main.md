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

## Our MathML Interface Approach

As motivated in Section 1, we need a math editing tool that fulfills the following requirements: The tool
                              
  * must allow the user to augment the formulae with Wikidata items.
  * should allow to edit semantics without changing the layout.
  * and its source code must be available under a MediaWiki compatible license.
  * must not disturb current editing workflows.

  
\noindent To take advantage of the related works regarding math editing, we suggest that MathML should be used as the communication standard to store and retrieve formula data from Wikidata.
In addition to the existing Wikidata endpoints, that allow to access store and retrieval data from Wikidata in XML, RDF and JSON(p) forms, we will establish a new interface that sends and retrieves MathML for Wikidata items with mathematical content.
Therefore, we introduced an implicit content dictionary (wikidata) that allows to use any Wikidata item as content MathML symbol.
Based on this interface, we designed a content MathML editor that uses standard conform MathML extended by the special Wikdiata content dictionary.

\input{figVis}


For the content MathML editor, we extend our content MathML visualization (VMEXT)~[@vmext17] so that the tree structure of the expression can not only be displayed but also be modified.
However, we do not intend to hide the MathML format, thus we use four interlinked visualizations for a single formulae.
VMEXT has two visual representations of the traditional presentation rendering and the expression tree representation of the content MathML.
In this new version VMEXT2, we added interlinked source code editors for presentation and content MathML.
To make this representation more explicit, we made the apply free form, which replaces the explicit display of apply nodes by the first child, optional.
In particular, by clicking on the apply node the first child is expanded.
By doing do the user experiences a one to one mapping between content MathML elements  
Any change in one representation automatically updates the other representations.
As visualized in Figure 2 hovering over elements, in the screenshot the probability $P$, results in the highlighting of this elements in all three remaining representations.
In addition popups display additional semantics.
For csymbol elements this is label and description from Wikdiata element.
Especially for the Wikidata items, whose unique identifiers don't carry human readable semantics, the popup and auto completion features in the visual and source code prevent the obfuscation of the semantics by the Wikidata item ids.


## Implementation

For the implementation, we followed the approach to take advantage of well established open source technology and use the APIs in order to extend the functionality according to our needs.
In the following we will describe the individual modules of VMEXT2 and describe the connection to existing technology.
VMEXT consists of the following modules:

* ***vmext*** The parent [node.js](https://nodejs.org) module that bundles the components and presents the demo. We strive to implement everything in isomorphic JavaScript and use [brunch](https://brunch.io) to bring node modules to the browser. 
* ***mathml*** MathML is the core  module that allows to load modify and render MathML input. It is based on the XML processing node module [xtraverse](https://www.npmjs.com/package/xtraverse).
* ***[cytoscape](https://js.cytoscape.org/)-mathml*** cytoscape MathML is a plugin to the graph visualization cytoscape with the [dagre](http://doi.org/10.5281/zenodo.1211727)-plugin and provides the interactivity with the MathML tree.
* ***[codemirror](http://codemirror.net/)-mathml*** is a plugin for codemirror. It extends the CodeMirror XML autocompletion plugin and provides auto completion for MathML
* ***[codemirror](http://codemirror.net/)-wikidata*** is a plugin for codemirror. It provides autocompletion for Wikidata entities and tooltips for Wikidata elements.

 

\noindent Please refer to [vmext.formulasearchengine.com](https://vmext.formulasearchengine.com) for detailed information on the used versions and up to date install instructions.

## Conclusion and Outlook

With VMEXT2, we transformed a tree visualization for the content MathML expression tree that was only capable to visualize the MathML expression tree into a content MathML editor.
Moreover, we linked presentation and content more closely together and created directs mappings between the visualization and the code representation. 
By doing so, ' is a first step towards semantic formulae in the Wikimedia projects.
The future will show, if the tool is used by the community.

\paragraph*{Non-Wikimedia use}

Technically, the tool can also be used with another knowledgebase or for editing MathML without a dedicated knowledgebase.
We plan to integrate it to the DRMF website which uses a different LaTeX dialect, but also a Wikibase knowledge base.
