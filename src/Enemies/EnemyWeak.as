package Enemies 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class EnemyWeak extends Enemy
	{
		private var _enemyWeak:EnemyArt;
		
		public function EnemyWeak() 
		{		
			speed = 3;
			strength = 100;
			
			_enemyWeak = new EnemyArt;
			addChild(_enemyWeak);
			this.x = 40;
			this.y = 500;
			
			super(150);
			
		
		}
	}

}