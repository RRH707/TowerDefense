package Enemies 
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Rishaad Hausil
	 */
	public class EnemyFactory 
	{
		
		public function addEnemy(mainStage:Stage, enemyType:int):Enemy
		{
			var newEnemy:Enemy = enemySelector(enemyType, mainStage);
			return newEnemy;
		}
		
		public function enemySelector(enemyType:int, s:Stage):Enemy
		{
			switch (enemyType) 
			{
				case 1 : 
				return new EnemyWeak();
				break;
				
				case 2 :
				return new EnemyFast();	
				break;
				
				case 3 :
				return new EnemyStrong();	
				break;
			default:
				throw(new Error("invalid type specified"));
			}
		}
		
	}

}