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
		private var _stage:Stage;
		private var _wayPoints:Vector.<int>;
		private var _wayPointID:int;

		public function EnemyFast(s:Stage) 
		{	
			_speed = 6;
			_health = 50;
			_strength = 3;
			
			_wayPointID = 0;
			_stage = s;
			
			_stage.addEventListener(Event.ENTER_FRAME, update);
			
			_enemyFast = new EnemyFastArt;
			addChild(_enemyFast);
			this.x = 40;
			this.y = 500;
			
			_wayPoints = new Vector.<int>;
			_wayPoints.push(60, 105, 700, 105, 700, 400, 375, 400);
			calcRoute(_wayPoints[0], _wayPoints[1]);
		}
		
		private function update(e:Event):void
		{
			
			this.x += _unitVectorX * _speed;
			this.y += _unitVectorY * _speed;
			
			if (_wayPointID + 1 < _wayPoints.length - 1)
			{
				if (calcDistance(_wayPoints[_wayPointID], _wayPoints[_wayPointID + 1]) < 10)
				{	
					_wayPointID += 2;
					calcRoute(_wayPoints[_wayPointID], _wayPoints[_wayPointID + 1]);
				}
			}
		}
	}

}