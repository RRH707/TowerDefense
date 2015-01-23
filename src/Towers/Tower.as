package Towers 
{
	import Enemies.Enemy;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Tower extends Sprite
	{
		public var createBulletFunction:Function;
		public var Baddies:Vector.<Enemy>;
		public var Placed:Boolean = false;
		public var BulletType:int;
		public var shootTimer:Timer;
		
		private var _canShoot:Boolean = true;
		
		
		
		
		public function Tower(enemies:Vector.<Enemy>) 
		{	
			Baddies = enemies;
			
		}
		
		public function placeTower():void
		{
			if (Placed == true) return;
			Placed = true;
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		protected function onShootTick(e:TimerEvent):void 
		{
			_canShoot = true;
		}
		
		public function calcDistance(targetX:int, targetY:int):Number
		{
			var differenceX:Number = targetX - this.x;
			var differenceY:Number = targetY - this.y;

			var fixedX:Number = differenceX * differenceX;
			var fixedY:Number = differenceY * differenceY;
			
			var length:Number = Math.sqrt(fixedX + fixedY);
			
			
			return length;
		}
		
		public function getEnemyDistance():Enemy
		{	
			var closestDist:int = 300;
			var closestEnemyId:int = -1;
			
			for (var i:int = Baddies.length - 1; i >= 0; i--)
			{
				if (calcDistance(Baddies[i].x, Baddies[i].y) < closestDist)
				{
					closestDist = calcDistance(Baddies[i].x, Baddies[i].y);
					closestEnemyId = i;
				}
			}
			
			if (closestEnemyId == -1)
			{
				return null;
			}
			return Baddies[closestEnemyId];
		}
		
		public function update(e:Event):void
		{	
			var closestEnemy:Enemy = getEnemyDistance();
			
			if (closestEnemy != null)
			{
				if (_canShoot)
				{
					_canShoot = false;
					shootTimer.start();
					
					
					
					createBulletFunction(BulletType, this.x, this.y, closestEnemy.x, closestEnemy.y);
					
					
				}
				
			}
		}
		
	}

}