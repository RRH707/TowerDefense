package Engines {
	import Enemies.Enemy;
	import Enemies.EnemyFast;
	import Enemies.EnemyStrong;
	import Enemies.EnemyWeak;
	import flash.display.Sprite;
	import flash.display.Stage;
	import Towers.Bullet;
	import Towers.Castle;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Engine extends Sprite
	{
		private var _Game:Game;
		private var _enemies:Vector.<Enemy>;
		private var _bullets:Vector.<Bullet>;
		private var _castle:Castle;
		
		public function Engine(game:Game,enemies:Vector.<Enemy>, bullets:Vector.<Bullet>, castle:Castle) 
		{	
			_Game = game;
			_enemies = enemies;
			_bullets = bullets;
			_castle = castle;
		}
		
		public function checkCollision():void
		{	
			//collision check between bullets and enemies
			for (var i:int = _bullets.length -1; i >= 0; i--)
			{	
				for ( var k:int = _enemies.length -1; k >= 0; k--)
				{	
					if (_enemies[k].hitTestPoint(_bullets[i].x, _bullets[i].y, true))
					{
						_enemies[k].Health -= _bullets[i].damage;
						if (_enemies[k].Health <= 0)
						{
							if (_enemies[k] is EnemyWeak)
							{
								_Game.removeChild(_enemies[k]);
								_enemies[k] = null;
								_enemies.splice(k, 1);
								dispatchEvent(new Event("addGold"));
							}
							
							else if (_enemies[k] is EnemyFast)
							{
								_Game.removeChild(_enemies[k]);
								_enemies[k] = null;
								_enemies.splice(k, 1);
								dispatchEvent(new Event("addGoldFast"));
							}
							
							else if (_enemies[k] is EnemyStrong)
							{
								_Game.removeChild(_enemies[k]);
								_enemies[k] = null;
								_enemies.splice(k, 1);
								dispatchEvent(new Event("addGoldStrong"));
							}
							
						}
					
						_Game.removeChild(_bullets[i]);
						_bullets[i] = null;
						_bullets.splice(i, 1);
						break;
					}
				}
			}
			
			if (_enemies.length > 0)
			{
				for (var i:int = _enemies.length -1; i >= 0; i--)
				{
					if (_castle.hitTestObject(_enemies[i]))
					{
						_castle.Health -= _enemies[i].strength;
						_Game.removeChild(_enemies[i]);
						_enemies.splice(i, 1);
					}
					
				}
			}
			
		}
		
	}

}