package Towers 
{
	import Enemies.Enemy;
	import flash.display.Stage;
	import Towers.Tower;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class TowerFactory
	{
		private var _enemy:Vector.<Enemy>	
		
		public function addTower(_game:Game, type:int, x:int, y:int, enemy:Vector.<Enemy>):Tower
		{
			_enemy = enemy;
			var newTower:Tower = towerSelector(_game, type, x, y);
			return newTower;
		}
		
		private function towerSelector(_game:Game,type:int, x:int, y:int):Tower
		{
			switch (type) 
			{
				case 1:
					var newTower:Tower = new TowerDefault(_enemy);
					newTower.x = x;
					newTower.y = y;
					_game.addChild(newTower);
					return newTower;
				break;
				case 2:
					var newTower:Tower = new TowerFast(_enemy);
					newTower.x = x;
					newTower.y = y;
					_game.addChild(newTower);
					return newTower;
				break;
				case 3:
					var newTower:Tower = new TowerStrong(_enemy);
					newTower.x = x;
					newTower.y = y;
					_game.addChild(newTower);
					return newTower;
				break;
				default:
				return null;
			}
			
		}
	}

}