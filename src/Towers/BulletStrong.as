package Towers 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class BulletStrong extends Bullet
	{
		private var _bulletStrong:projectileStrongArt;
		
		public function BulletStrong() 
		{	
			super();
			_bulletStrong = new projectileStrongArt();
			addChild(_bulletStrong);
			damage = 100;
		}
		
	}

}