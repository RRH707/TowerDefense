package Enemies 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Enemy extends Sprite 
	{	
		public var _unitVectorX:Number;
		public var _unitVectorY:Number;
		
		public var _health:int;
		public var _strength:int;
		public var _speed:int;
		
		public function Enemy() 
		{
			
		}
		
		public function calcRoute(targetX:int, targetY:int):void
		{
			var differenceX:Number = targetX - this.x;
			var differenceY:Number = targetY - this.y;
			
			var fixedX:Number = differenceX * differenceX;
			var fixedY:Number = differenceY * differenceY;
			
			var length:Number = Math.sqrt(fixedX + fixedY);
			
			_unitVectorX = differenceX / length;
			_unitVectorY = differenceY / length;
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
		
	}

}