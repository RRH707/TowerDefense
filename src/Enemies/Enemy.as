package Enemies 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import GUI.HealthBar;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Enemy extends Sprite 
	{	
		public var unitVectorX:Number;
		public var unitVectorY:Number;
		public var strength:int;
		public var speed:int;
		public var cTargetX:int;
		public var cTargetY:int;
		
		private var _healthBar:HealthBar;
		private var _wayPoints:Vector.<int>;
		private var _wayPointID:int;
		private var _i:int;
		
		
		public function Enemy(maxHealth:int) 
		{	
			_i = maxHealth;
			_wayPointID = 0;
			
			_wayPoints = new Vector.<int>;
			_wayPoints.push(60, 95, 700, 105, 700, 400, 375, 400);
			calcRoute(_wayPoints[0], _wayPoints[1]);
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function createHealthbar(amt:int):void
		{
			_healthBar = new HealthBar(_i);
			_healthBar.y = -20;
			_healthBar.x = this.width / 2;
			addChild(_healthBar);
		}
		
		public function calcRoute(targetX:int, targetY:int):void
		{
			var differenceX:Number = targetX - this.x;
			var differenceY:Number = targetY - this.y;
			
			var fixedX:Number = differenceX * differenceX;
			var fixedY:Number = differenceY * differenceY;
			
			var length:Number = Math.sqrt(fixedX + fixedY);
			
			unitVectorX = differenceX / length;
			unitVectorY = differenceY / length;
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
		
			
		private function update(e:Event):void
		{
			this.x += unitVectorX * speed;
			this.y += unitVectorY * speed;
			
			if (_wayPointID + 1 < _wayPoints.length - 1)
			{
				if (calcDistance(_wayPoints[_wayPointID], _wayPoints[_wayPointID + 1]) < 30)
				{	
					_wayPointID += 2;
					calcRoute(_wayPoints[_wayPointID], _wayPoints[_wayPointID + 1]);
				}
			}
		}
		
		public function set Health(newVal:int):void
		{
			_healthBar.Health = newVal;
		}
		
		public function get Health():int
		{
			return _healthBar.Health;
		}
		
	}

}