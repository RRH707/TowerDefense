package Towers 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class BulletWeak extends Bullet
	{
		private var _bulletweak:projectileArt;
		
		public function BulletWeak() 
		{
			
			_bulletweak = new projectileArt();
			addChild(_bulletweak);
			damage = 50;
		}
		
	}

}