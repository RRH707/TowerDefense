package Enemies 
{
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class EnemyFast extends Enemy
	{
		private var _enemyFast:EnemyFastArt;

		public function EnemyFast() 
		{	
			
			speed = 6;
			strength = 75;
			
			
			_enemyFast = new EnemyFastArt;
			addChild(_enemyFast);  
			this.x = 40;
			this.y = 500;
			super(100);
			
		}
	
	}

}