package  
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Menu extends Sprite
	{
		private var _startButton:startButtonArt;
		private var _stage:Stage;
		private var _fullScreenButton:fullScreenButtonArt;
		private var _mainScreen:mainMenuArt;
		private var _instructionButton:instructionsButtonArt;
		private var _instructionScreen:instructionScreenArt;
		private var _backButton:backButtonArt;
		
		public function Menu(s:Stage) 
		{	
			_stage = s;
			_startButton = new startButtonArt();
			_fullScreenButton = new fullScreenButtonArt();
			_instructionButton = new instructionsButtonArt();
			_mainScreen = new mainMenuArt();
			_instructionScreen = new instructionScreenArt();
			_backButton = new backButtonArt();
			
			_startButton.x = _stage.stageWidth / 2;
			_startButton.y = _stage.stageHeight / 2;
			_fullScreenButton.x = _startButton.x;
			_fullScreenButton.y = _startButton.y + 100;
			_instructionButton.x = _fullScreenButton.x;
			_instructionButton.y = _fullScreenButton.y + 100;
			_backButton.x = 500;
			_backButton.y = 500;
			
			
			addChild(_mainScreen);
			addChild(_startButton);
			addChild(_fullScreenButton);
			addChild(_instructionButton);
			addChild(_instructionScreen);
			addChild(_backButton);
		
			_instructionScreen.visible = false;
			_backButton.visible = false;
			
			
			s.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			if (e.target == _startButton)
			{
				dispatchEvent(new Event("startGame", true));
				_stage.removeEventListener(MouseEvent.CLICK, onClick);
			}
			
			if (e.target == _fullScreenButton)
			{
				_stage.displayState = StageDisplayState.FULL_SCREEN;
			}
			
			if (e.target == _instructionButton)
			{
				_mainScreen.visible = false;
				_startButton.visible = false;
				_fullScreenButton.visible = false;
				_instructionButton.visible = false;
				_instructionScreen.visible = true;
				_backButton.visible = true;
			}
			
			if (e.target == _backButton)
			{
				_mainScreen.visible = true;
				_startButton.visible = true;
				_fullScreenButton.visible = true;
				_instructionButton.visible = true;
				_instructionScreen.visible = false;
				_backButton.visible = false;
			}
		}
		
	}

}