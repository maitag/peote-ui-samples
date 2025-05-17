package;

import lime.app.Application;
import lime.ui.Window;

import peote.view.PeoteView;
import peote.view.Color;

import peote.text.Font;

import peote.layout.Size;

import peote.ui.PeoteUIDisplay;
import peote.ui.interactive.*;
import peote.ui.layout.*;
import peote.ui.event.*;
import peote.ui.config.*;
import peote.ui.style.*;



class TestLayout extends Application
{
	var peoteView:PeoteView;
		
	override function onWindowCreate():Void
	{
		switch (window.context.type)
		{
			case WEBGL, OPENGL, OPENGLES:
				try startSample(window)
				catch (_) trace(haxe.CallStack.toString(haxe.CallStack.exceptionStack()), _);
			default: throw("Sorry, only works with OpenGL.");
		}
	}

	public function startSample(window:Window)
	{
		peoteView = new PeoteView(window);
		
		// load the FONT:
		new Font<FontStyleTiled>("assets/fonts/tiled/hack_ascii.json").load( onFontLoaded );
	}
	
	@:access(peote.layout.LayoutContainer)
	public function onFontLoaded(font:Font<FontStyleTiled>)
	{
		var myStyle = new RoundBorderStyle();
		myStyle.color = Color.GREY1;
		myStyle.borderColor = Color.GREY5;
		myStyle.borderSize = 4.0;
		myStyle.borderRadius = 40.0;

		
		var fontStyleTiled = new FontStyleTiled();
		fontStyleTiled.height = 25;
		fontStyleTiled.width = 25;
		fontStyleTiled.color = Color.WHITE;
		

		var uiDisplay = new PeoteUIDisplay(20, 20, window.width-40, window.height-40, Color.GREY1);
		peoteView.addDisplay(uiDisplay);

		
		var child1 = new LayoutBox( myStyle, { left:10, right:10, height:100 } );
		
		var root = new LayoutBox( myStyle, {width:Size.limit(100, 250)} , [child1] );
		//var root = new LayoutBox( myStyle, {width:Size.limit(100, 250)} );
		//root.add(child1);
		uiDisplay.addLayout(root);
		//root.add(child1);
		
		uiDisplay.updateLayout();
				
		
		peoteView.onResize = function (w:Int, h:Int) {
			uiDisplay.width  = w-40;
			uiDisplay.height = h-40;
			uiDisplay.updateLayout();
		}
		
		
		#if android
		ui.mouseEnabled = false;
		#end
		PeoteUIDisplay.registerEvents(window); // to fetch all input events
		
	}


}
