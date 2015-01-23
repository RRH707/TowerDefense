package Towers 
{
	import Enemies.Enemy;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class TowerDefault extends Tower
	{
		private var _towerWeak:TowerArt;
		
		public function TowerDefault(_Enemys:Vector.<Enemy>) 
		{
			super(_Enemys);
			BulletType = 1;
			_towerWeak = new TowerArt();
			addChild(_towerWeak);
			shootTimer = new Timer(1000, 1);
			shootTimer.addEventListener(TimerEvent.TIMER, onShootTick);
			
		}
		
	}

}