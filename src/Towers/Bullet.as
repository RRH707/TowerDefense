package Towers 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Bullet extends Sprite
	{	
		private var _bullet:projectileArt;
		private var _velocityX:int = 0;
		private var _velocityY:int = 0;
		public var speed:Number = 40;
		public var damage:Number;
		
		public function Bullet() 
		{
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function setTarget(targetX:int, targetY:int):void
		{
			var offsetX:Number = targetX - this.x;
			var offsetY:Number = targetY - this.y;
				
			var length:Number = Math.sqrt(Math.pow(offsetX, 2) + Math.pow(offsetY, 2));
			
			var stepX:Number = offsetX / length;
			var stepY:Number = offsetY / length;
			
			_velocityX = stepX * speed;
			_velocityY = stepY * speed;
			
			
		}
		
		public function update(e:Event):void
		{
			this.x += _velocityX;
			this.y += _velocityY;
		}
	}

}