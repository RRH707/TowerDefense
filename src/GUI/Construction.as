package GUI 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Construction extends Sprite
	{
		public var buildButton:BuildButtonArt;
		public var towerButtonWeak:TowerButtonWeakArt;
		public var towerButtonFast:TowerButtonFastArt;
		public var towerButtonStrong:TowerButtonStrongArt;
		public var _stage:Stage;
		
		public function Construction(s:Stage) 
		{
			_stage = s;
			
			_stage.addEventListener(MouseEvent.CLICK, onClick);
			
			buildButton = new BuildButtonArt();
			towerButtonWeak = new TowerButtonWeakArt();
			towerButtonFast = new TowerButtonFastArt();
			towerButtonStrong = new TowerButtonStrongArt();
			
			buildButton.x = 150;
			buildButton.y = 550;
			towerButtonWeak.x = buildButton.x;
			towerButtonWeak.y = 550;
			towerButtonFast.x = towerButtonWeak.x + towerButtonFast.width + 10;
			towerButtonFast.y = 550;
			towerButtonStrong.x = towerButtonFast.x + towerButtonFast.width + 10;
			towerButtonStrong.y = 550;
			
			towerButtonWeak.visible = false;
			towerButtonFast.visible = false;
			towerButtonStrong.visible = false;
			
			addChild(buildButton);
			addChild(towerButtonWeak);
			addChild(towerButtonFast);
			addChild(towerButtonStrong);
			
		}
		
		public function onClick(e:MouseEvent):void
		{
			if (e.target == buildButton)
			{
				buildButton.visible = false;
				towerButtonWeak.visible = true;
				towerButtonFast.visible = true;
				towerButtonStrong.visible = true;
			}
			else if (e.target == towerButtonWeak)
			{
				dispatchEvent(new Event("spawnTowerWeak", true));
			}
			else if (e.target == towerButtonFast)
			{
				dispatchEvent(new Event("spawnTowerFast", true));
			}
			else if (e.target == towerButtonStrong)
			{
				dispatchEvent(new Event("spawnTowerStrong", true));
			}
			
			
			
		}
		
	}

}