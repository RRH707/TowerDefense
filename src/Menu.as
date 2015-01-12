package  
{
	import flash.display.Sprite;
	import flash.display.Stage;
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
		
		public function Menu(s:Stage) 
		{	
			_stage = s;
			_startButton = new startButtonArt;
			addChild(_startButton);
			_startButton.x = _stage.stageWidth / 2;
			_startButton.y = _stage.stageHeight / 2;
			
			s.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			if (e.target == _startButton)
			{
				dispatchEvent(new Event("startGame", true));
				_stage.removeEventListener(MouseEvent.CLICK, onClick);
			}
		}
		
	}

}