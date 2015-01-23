package Towers 
{
	import Enemies.Enemy;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class TowerStrong extends Tower
	{
		private var _TowerStrong:TowerStrongArt;
		
		public function TowerStrong(_enemie:Vector.<Enemy>) 
		{
			super(_enemie);
			BulletType = 3;
			_TowerStrong = new TowerStrongArt();
			addChild(_TowerStrong);
			shootTimer = new Timer(3000, 1);
			shootTimer.addEventListener(TimerEvent.TIMER, onShootTick);
		}
		
	}

}