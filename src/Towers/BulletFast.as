package Towers 
{
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class BulletFast extends Bullet
	{
		private var _bulletFast:projectileFastArt;
		
		public function BulletFast() 
		{
			_bulletFast = new projectileFastArt();
			addChild(_bulletFast);
			damage = 25;
		}
		
	}

}