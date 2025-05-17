# Peote UI - Samples

This repo includes the core samples for peote-ui.  
  
There are 2 ways how to use peote-ui:

## PeoteUIDisplay (extends [peote-view](https://github.com/maitag/peote-view) Display)

This is the simplest way where interactive elements can be placed 
directly by x/y values inside the Display with a given size.

Available elements you can add:
- Interactive (have no Style so its hidden and only interacts)
- UIElement (for simple buttons)
- UISlider
- UIArea
- UIDisplay (to make any peote-view Display interactive)

macro generated text elements for Font<FontStyle>:
- UITextLine<FontStyle>
- UITextPage<FontStyle>

pregenerated text elements for peote.ui.tiled.FontT (Font<FontStyleTiled>):
- UITextLineT
- UITextPageT

pregenerated text elements for peote.ui.packed.FontP (Font<FontStylePacked>):
- UITextLineP
- UITextPageP


You can also put this ui-elements into layout by using peote-layout lib,
see here for some samples: [peote-layout/samples/peote-ui](https://github.com/maitag/peote-layout/tree/main/samples/peote-ui)


## PeoteUI (TODO)

Here the PeoteUI itself and all widgets are layout-container abstracts of [peote-layout](https://github.com/maitag/peote-layout).
So you can create a userinterface where all is contained into a nesting structure to make the inner elements scalable
in depend to the outer size. This can be useful e.g. to automatically fit your UI to different display-sizes.

Available Widgets:
- Div
- TextLine
...
(more widgets will be followed soon!)