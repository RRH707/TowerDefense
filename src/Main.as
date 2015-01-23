package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Main extends Sprite 
	{
		private var _Menu:Menu;
		private var _Game:Game;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener("startGame", startGame);
			
			createMenu();
			
		}
		
		private function endGame(e:Event):void 
		{
			if (_Game != null)
			{
				removeChild(_Game);
				_Game = null;
				createMenu();
			}
			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function createMenu():void
		{
			_Menu = new Menu(stage);
			addChild(_Menu);
		}
		
		private function startGame(e:Event):void
		{
			removeChild(_Menu);
			_Menu = null;
			_Game = new Game(stage);
			_Game.addEventListener("endGame", endGame);
			addChild(_Game);
		}
	}
	
}