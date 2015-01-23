package Enemies 
{
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class EnemyStrong extends Enemy
	{
		private var _enemyStrong:enemyStrongArt;
		
		public function EnemyStrong() 
		{	
			speed = 2;
			strength = 250;
			
			_enemyStrong = new enemyStrongArt;
			addChild(_enemyStrong);
			this.x = 40;
			this.y = 500;
			
			super(350);
		}
	}

}