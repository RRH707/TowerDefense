package Towers 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import GUI.HealthBar;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Castle extends Sprite
	{
		private var _Castle:CastleArt;
		private var _stage:Stage;
		private var _healthBar:HealthBar;
		
		
		
		public function Castle(s:Stage) 
		{	
			
			_stage = s;
			_Castle = new CastleArt();
			_healthBar = new HealthBar(1000);
			_healthBar.DefaultScale = 2;
			_healthBar.y = + _Castle.height / 2 + 10;
			
			this.x = _stage.stageWidth / 2 ;
			this.y = 400;
			
			addChild(_Castle);
			addChild(_healthBar);
			
		}
		
		public function set Health(newVal:int):void
		{
			_healthBar.Health = newVal;
			
			if (newVal <= 0)
			{
				dispatchEvent(new Event("dead"));
			}
		}
		
		public function get Health():int
		{
			return _healthBar.Health;
		}
		
	}

}