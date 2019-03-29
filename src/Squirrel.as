package
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	
	
	public class Squirrel extends Entity
	{
		
		private var image:Image;
		private var spriteMap:Spritemap = new Spritemap(Assets.SPRITEMAP_CLASS,32,32);
		
		/*private var jumpVector:Number = 0;
		private var jumpTime:int = 0;
		private var isJump:Boolean = false;
		private var canJump:Boolean = false;*/
		
		private var isJump:Boolean = false;
		private var lastDirection:int;
		
		private const hitboxWidth:int = 22;
		///
		private var xSpeed:Number = 0; //текушая скорость по горизонтали
		private var ySpeed:Number = 0; //текущая скорость по вертикали
		///
		
		//private var direction:Point = new Point(0, 0);
		
		public function Squirrel():void
		{
			
			spriteMap.add("rightwalk", [0, 1, 2, 3, 4, 5, 6, 7], 20, true);
			spriteMap.add("leftwalk", [8, 9, 10, 11, 12, 13, 14, 15], 20, true);
			spriteMap.add("rightjump", [16], 20, true);
			spriteMap.add("leftjump", [17], 20, true);
			spriteMap.add("rightstand", [18], 20, true);
			spriteMap.add("leftstand", [19], 20, true);
			
			image = new Image(Assets.SQUIRREL_GRAPHIC);
			graphic = spriteMap;
			setHitbox(hitboxWidth, spriteMap.height - 5);
			originX = -5;
			originY = -5;
			type = "squirrel";
			
			
			super();
			
			GameSound.spawnSound.play();
			
			
		}
		
		
		override public function update():void 
		{ 
			
			if(!Preloader._paused){
			if (Input.check(Key.M))
			{
				FlashPunkEngine.currentLevel.gameOver( -1);
				MainMenu.currentPreloader.toMainMenu();
				
			}
			//переопределяем функцию update(), вызывается каждый кадр
			var pressed:Boolean = false; //с помощью этой переменной будем узнавать когда нужные нам клавиши нажаты (сейчас false -не нажаты)
			
			var pressedLeft:Boolean = false;
			var pressedRight:Boolean = false;
			var pressedJump:Boolean = false;
			var lk:int = Input.lastKey;
			
			if (Input.check(Key.LEFT)||Input.check(Key.A))
			{ //если нажата клавиша "стрелка влево"
				xSpeed = -Assets.PLAYER_SPEED; //уменьшаем текущую скорость по х
				pressed = true; //true - нажата
				pressedLeft = true;
				lastDirection = Key.LEFT;
				
			}
			if (Input.check(Key.RIGHT)||Input.check(Key.D))
			{ 
				//если нажата клавиша "стрелка вправо"
				xSpeed = Assets.PLAYER_SPEED; //увеличиваем текущую скорость по х
				pressed = true; //true - нажата
				pressedRight = true;
				lastDirection = Key.RIGHT;
			}
			if (collide("tile", x, y + 1))
			{
				//если произошло столкновение с любым из объектов группы"tile"
				ySpeed = 0; //обнуляем вертикальную скорость
				
				if (Input.check(Key.UP)||Input.check(Key.W))
				{ 
					//если нажата клавиша "стрелка вверх"
					ySpeed -= Assets.JUMP_POWER; //уменьшаем вертикальную скорость(прыжок вверх)
					pressedJump = true;
					GameSound.jumpSound.play();
					isJump = true;
				}
				else
				{
					isJump = false;
					
				}
			} 
			else 
			{
				ySpeed += Assets.GRAVITY; //иначе увеличиваем вертикальную скорость(прыжок вниз)
			}
			
			
			if (Math.abs(xSpeed) < 1 && !pressed)
			{ 
				//если горизонтальная скорость очень маленькая 
				xSpeed = 0; //обнуляем ее
			}
			xSpeed *= Assets.HFRICTION; //уменьшаем горизонтальную скорость из-за силы трения
			ySpeed *= Assets.VFRICTION; //уменьшаем вертикальную скорость из-за силы трения
			adjustXPosition(); //функции проверяющие столкновения по осям x и y
			adjustYPosition();
			
			
			
			if (!pressedRight)
			{
				if (pressedJump && pressedLeft)
				{
					spriteMap.play("leftjump");
				}
				else if (pressedJump)
				{
					
				}
				else if (pressedLeft && !isJump)
				{
					spriteMap.play("leftwalk");
				}
				else
				{
					switch(lastDirection)
					{
						case Key.A:
							{
								
							}
						case Key.LEFT:
							{
								if (!isJump)
								{
									spriteMap.play("leftstand");
								}
								break;
							}
						
						case Key.D:
							{
								
							}
						case Key.RIGHT:
							{
								spriteMap.play("rightstand");
								break;
							}
						
						case Key.W:
							{
								
							}
						case Key.UP:
							{
								break;
							}
					}
				}
			}
			else
			{
				if (pressedJump)
				{
					spriteMap.play("rightjump");
				}
				else if (!isJump)
				{
					spriteMap.play("rightwalk");
				}
			}
			}
			
		}
		
		private function adjustXPosition():void 
		{
			for (var i:int = 0; i < Math.abs(xSpeed); i++) 
			{
				//перебираем все значение от 0 до текущей скорости по оси x
				if (! collide("tile", x + FP.sign(xSpeed), y)) 
				{ 
					//Если перемещяя игрока на 1 пиксель (FP.sign возвращает 1 если число положительное,) 
					x+=FP.sign(xSpeed); //и -1 если отрицательное) игрок не сталкивается с стеной, то перемещаем игрока в этом направлении на 1 px
				} 
				else 
				{ 
					//иначе
					xSpeed=0; //не перемещаем
					break;
				}
			}
		}
		
		private function adjustYPosition():void 
		{
			if (y > FP.screen.height)
			{
				y = FP.screen.height;
				
				GameSound.dieSound.play();
				Tile.apocalypsis = true;
				
				FlashPunkEngine.currentLevel.gameOver(0);
			}
			if (y < 0)
			{
				y = 0;
			}
			if (x > FP.screen.width - image.width)
			{
				x = FP.screen.width - image.width;
			}
			if (x < 0)
			{
				x = 0;
			}
			
			for (var i:int = 0; i < Math.abs(ySpeed); i++) 
			{
				//здесь все аналогично
				if (! collide("tile", x, y + FP.sign(ySpeed)))
				{
					y+=FP.sign(ySpeed);
				} 
				else 
				{
					ySpeed=0;
					break;
				}
			}
		}
	}
}
