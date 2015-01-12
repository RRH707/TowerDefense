package  
{
	import adobe.utils.CustomActions;
	import Enemies.EnemyFast;
	import Enemies.EnemyStrong;
	import Enemies.EnemyWeak;
	import flash.display.Sprite;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Game extends Sprite
	{	
		private var _Road:RoadArt;
		private var _stage:Stage;
		private var _background:BackgroundArt;
		private var _enemyWeak:EnemyWeak;
		private var _enemyFast:EnemyFast;
		private var _enemyStrong:EnemyStrong;
		
		public function Game(s:Stage) 
		{
			_stage = s;
			createMap();
			createEnemies();
			
		}
		
		private function createMap():void
		{
			_Road = new RoadArt;
			_background = new BackgroundArt;
			
			addChild(_background);
			addChild(_Road);
			_Road.x = 35; 
			_Road.y = 60;
		}
		
		private function createEnemies():void
		{
			_enemyWeak = new EnemyWeak(_stage);
			_enemyFast = new EnemyFast(_stage);
			_enemyStrong = new EnemyStrong(_stage);
			addChild(_enemyWeak);
			addChild(_enemyFast);
			addChild(_enemyStrong);
		}
		
	}

}