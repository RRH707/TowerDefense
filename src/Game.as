package  
{
	import adobe.utils.CustomActions;
	import Enemies.Enemy;
	import Enemies.EnemyFactory;
	import Enemies.EnemyFast;
	import Enemies.EnemyStrong;
	import Enemies.EnemyWeak;
	import Engines.Engine;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.engine.TextBaseline;
	import flash.text.TextField;
	import flash.utils.Timer;
	import GUI.Construction;
	import Towers.Bullet;
	import Towers.BulletFast;
	import Towers.BulletStrong;
	import Towers.BulletWeak;
	import Towers.Castle;
	import Towers.Tower;
	import Towers.TowerDefault;
	import Towers.TowerFactory;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class Game extends Sprite
	{	
		private var _Road:RoadArt;
		private var _stage:Stage;
		private var _background:BackgroundArt;
		private var _enemyFactory:EnemyFactory;
		private var _enemies:Vector.<Enemy>;
		private var _towers:Vector.<Tower>;
		private var _bullets:Vector.<Bullet>;
		private var _engine:Engine;
		private var _castle:Castle;
		private var _construction:Construction;
		private var _towerFactory:TowerFactory;
		private var _draggingTower:Tower;
		private var _buttonsBackground:BkgButtonsArt;
		private var _waveTimer:Timer;
		private var _currentWave:int;
		private var _gold:int = 50;
		private var _goldText:TextField;
		private var _score:int;
		private var _scoreText:TextField;
		
		public function Game(s:Stage) 
		{
			_stage = s;
			
			_enemyFactory = new EnemyFactory();
			_towerFactory = new TowerFactory();
			_enemies = new Vector.<Enemy>();
			_bullets = new Vector.<Bullet>();
			_towers = new Vector.<Tower>();
			_castle = new Castle(_stage);
			_engine = new Engine(this, _enemies, _bullets, _castle);
			_construction = new Construction(_stage);
			_waveTimer = new Timer(5000, 0);
			_goldText = new TextField();
			_scoreText = new TextField();
			
			_scoreText.text = "Score : " + _score;
			_scoreText.x = 700;
			_scoreText.y = 36;
			_scoreText.textColor = 0xFFFFFF;
			
			_goldText.text = "Gold : " + _gold;
			_goldText.x = 700;
			_goldText.y = 9;
			_goldText.textColor = 0xFFFFFF;
			
			createMap();
			
			
			addChild(_castle);
			addChild(_construction);
			addChild(_goldText);
			addChild(_scoreText);
			this.addEventListener(Event.ENTER_FRAME, update);
			this.addEventListener("spawnTowerWeak", spawnTowerWeak);
			this.addEventListener("spawnTowerFast", spawnTowerFast);
			this.addEventListener("spawnTowerStrong", spawnTowerStrong);
			this.addEventListener(MouseEvent.CLICK, onClick);
			_castle.addEventListener("dead", onDied);
			_engine.addEventListener("addGold", addGold);
			_engine.addEventListener("addGoldFast", addGoldFast);
			_engine.addEventListener("addGoldStrong", addGoldStrong);
			_waveTimer.addEventListener(TimerEvent.TIMER, spawnWave);
			_waveTimer.start();
		}
		
		private function addGoldStrong(e:Event):void 
		{
			_gold += 30;
			_score += 100;
		}
		
		private function addGoldFast(e:Event):void 
		{
			_gold += 20;
			_score += 25;
		}
		
		private function addGold(e:Event):void 
		{
			_gold += 10;
			_score += 10;
		}
		
		private function onDied(e:Event):void 
		{
			_waveTimer.stop();
			_castle.removeEventListener("dead", onDied);
			dispatchEvent(new Event("endGame"));
		}
		
		private function spawnWave(e:TimerEvent):void 
		{	
			_currentWave += 1;
			switch (_currentWave) 
			{
				case 1:
					createEnemies(1, 0, 0);
				break;
				case 2:
					createEnemies(1, 1, 0);
				break;
				case 3:
					createEnemies(1, 1, 1);
				break;
			default:
				createEnemies(1, 1, 1);
			}
		}
		
		
		private function onClick(e:MouseEvent):void 
		{
			//placing _draggingTower
			if (_draggingTower != null)
			{
				// check for collision with black space(left and right)
				if (_draggingTower.x - _draggingTower.width / 2 < 0 || 
					_draggingTower.x + _draggingTower.width / 2 > _stage.stageWidth ||
					_draggingTower.y - _draggingTower.height / 2 < 0 ||
					_draggingTower.y + _draggingTower.height / 2 > _stage.stageHeight - _buttonsBackground.height)
				{
					return;
				}
				
				//check for collision with road
				if (_Road.hitTestPoint(_draggingTower.x, _draggingTower.y - _draggingTower.height / 2, true) ||
					_Road.hitTestPoint(_draggingTower.x + _draggingTower.width / 2, _draggingTower.y, true) ||
					_Road.hitTestPoint(_draggingTower.x, _draggingTower.y + _draggingTower.height / 2, true) ||
					_Road.hitTestPoint(_draggingTower.x - _draggingTower.width / 2, _draggingTower.y, true))
				{
					return;
				}
				
				//check for collision with other Towers
				for (var i:int = 0; i < _towers.length; i++ )
				{
					if (_towers[i].hitTestObject(_draggingTower)) return;
				}
				
				//check for collision with castle
				if (_castle.hitTestObject(_draggingTower)) return;
				
				//place tower
				_draggingTower.placeTower();
				_towers.push(_draggingTower);
				_draggingTower = null;
			}
		}
		
		private function createDragTower(type:int):void
		{	
			var newTower:Tower = _towerFactory.addTower(this, type, mouseX, mouseY, _enemies);
			newTower.createBulletFunction = createBullet;
			_draggingTower = newTower;
		}
		
		private function spawnTowerWeak(e:Event):void 
		{
			if (_gold >= 20)
			{
				_gold -= 20;
				createDragTower(1);
			}
		}
		
		private function spawnTowerFast(e:Event):void 
		{
			if (_gold >= 50)
			{
				_gold -= 50;
				createDragTower(2);
			}
		}
		
		private function spawnTowerStrong(e:Event):void 
		{
			if (_gold >= 100) 
			{
				_gold -= 100;
				createDragTower(3);
			}
		}
		
		
		private function createMap():void
		{
			_Road = new RoadArt;
			_background = new BackgroundArt;
			_buttonsBackground = new BkgButtonsArt;
			addChild(_background);
			addChild(_Road);
			addChild(_buttonsBackground);
			_Road.x = 35; 
			_Road.y = 60;
			_buttonsBackground.x = 137;
			_buttonsBackground.y = _stage.stageHeight - _buttonsBackground.height;
		}
		
		private function createEnemies(amountEnemyWeak:int, amountEnemyFast:int, amountEnemyStrong:int):void
		{	
			for (var i:int = 0; i < amountEnemyWeak; i++)
			{	
				var newEnemy:Enemy = _enemyFactory.addEnemy(_stage, 1);
				var health:int = 150 + (_currentWave * 100);
				addChild(newEnemy);
				newEnemy.createHealthbar(health);
				_enemies.push(newEnemy);
			}
			
			for (var i:int = 0; i < amountEnemyFast; i++)
			{
				var newEnemy:Enemy = _enemyFactory.addEnemy(_stage, 2);
				var health:int = 100 + (_currentWave * 100);
				addChild(newEnemy);
				newEnemy.createHealthbar(health) ;
				_enemies.push(newEnemy);
			}
			
			for (var i:int = 0; i < amountEnemyStrong; i++)
			{
				var newEnemy:Enemy = _enemyFactory.addEnemy(_stage, 3);
				var health:int = 350 + (_currentWave * 100);
				addChild(newEnemy);
				newEnemy.createHealthbar(health);
				_enemies.push(newEnemy);
			}
		}
		
		public function createBullet(type:int, startX:int, startY:int, targetX:int, targetY:int):void
		{
			var newBullet:Bullet;
			
			switch (type) 
			{
				case 1:
				newBullet =  new BulletWeak();	
				break;
				case 2:
				newBullet = new BulletFast();
				break;
				case 3:
				newBullet = new BulletStrong();	
				break;
				default:
			}
			
			newBullet.x = startX;
			newBullet.y = startY;
			newBullet.setTarget(targetX, targetY);
			addChild(newBullet);
			_bullets.push(newBullet);
		}
		
		public function update(e:Event):void
		{	
			if (_draggingTower != null)
			{
				_draggingTower.x = mouseX;
				_draggingTower.y = mouseY;
			}
			
			var l:int = _bullets.length;
			for (var i:int = l -1; i >= 0; i--) 
			{
				if (_bullets[i].x < 0 || _bullets[i].x > _stage.stageWidth || _bullets[i].y < 0 || _bullets[i].y > _stage.stageHeight)
				{
					removeChild(_bullets[i]);
					_bullets.splice(i, 1);
					
				}
			}
			
			_engine.checkCollision();
			_goldText.text = "Gold : " + _gold;
			_scoreText.text = "Score : " + _score;
			
		}
		
	}

}