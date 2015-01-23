package Towers 
{
	import Enemies.Enemy;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class TowerFast extends Tower
	{
		private var _TowerFast:TowerFastArt;
		
		public function TowerFast(_Enemies:Vector.<Enemy>) 
		{	
			super(_Enemies);
			BulletType = 2;
			_TowerFast = new TowerFastArt();
			addChild(_TowerFast);
			shootTimer = new Timer(500, 1);
			shootTimer.addEventListener(TimerEvent.TIMER, onShootTick);
		}
		
	}

}