package GUI 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class HealthBar extends Sprite
	{	
		public var healtbarOutline:healthBarOutlineArt;
		public var healthbarFill:healthBarFillArt;
		public var maxHealth:int;
		private var _defaultScale:Number = 1;
		
		private var _health:int;
		
		public function HealthBar(maxLife:int) 
		{	
			healtbarOutline = new healthBarOutlineArt();
			healthbarFill = new healthBarFillArt();
			
			healtbarOutline.x = healthbarFill.x = - healthbarFill.width / 2;
			
			maxHealth = maxLife;
			Health = maxHealth;
			
			addChild(healtbarOutline);
			addChild(healthbarFill);
			
		}
		
		public function set Health(newVal:int):void
		{
			_health = newVal;
			applyHealthbarSize();
		}
		
		private function applyHealthbarSize():void
		{
			healthbarFill.scaleX = _health / maxHealth * _defaultScale;
		}
		
		public function get Health():int
		{
			return _health;
		}
		
		public function set DefaultScale(newVal:Number):void
		{
			_defaultScale = newVal;
			healtbarOutline.scaleX = newVal;
			healthbarFill.scaleX = newVal;
			healtbarOutline.x = healthbarFill.x = - healthbarFill.width / 2;
			
			applyHealthbarSize();
		}
		
		public function get DefaultScale():Number
		{
			return _defaultScale;
		}
		
	}

}