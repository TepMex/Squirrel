package
{
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Portal extends Entity
	{
		
		public var teleportPoint:Point = new Point();
		public var linkedPortal:Portal;
		
		public static var teleportClosed:Boolean = false;
		public var gravity:int = 0;
		
		private var openTeleportTimer:Timer = new Timer(50, Assets.PORTAL_RELOAD);
		
		public function Portal(isIn:int = 1):void
		{
			
			if (isIn == 1)
			{
				graphic = new Image(Assets.PORTALIN_GRAPHIC);
			}
			else
			{
				graphic = new Image(Assets.PORTALOUT_GRAPHIC);
			}
			
			openTeleportTimer.addEventListener(TimerEvent.TIMER_COMPLETE, openTeleports, false, 0, true);
			
			setHitbox(16, 16, -8, -8);
			
			super();
			
		}
		
		
		override public function update():void
		{
			
			if (collide("squirrel", x, y)&&(Input.check(Key.S)||Input.check(Key.DOWN))&&!teleportClosed)
			{
				//trace(teleportPoint);
				FlashPunkEngine.currentLevel.squirrelLink.x = teleportPoint.x;
				FlashPunkEngine.currentLevel.squirrelLink.y = teleportPoint.y;
				teleportClosed = true;
				openTeleportTimer.start();
			}
			
			if (gravity == 1)
			{
				if (!collide("tile", x, y + 9)) 
				{
					y += 2;
					linkedPortal.teleportPoint.y += 2;
				}
				if (y > FP.screen.height + height)
				{
					FlashPunkEngine.currentLevel.remove(linkedPortal);
					FlashPunkEngine.currentLevel.remove(this);
				}
				
			}
			if (Tile.apocalypsis)
			{
				gravity = 1;
			}
			super.update();
			
		}
		
		private function openTeleports(e:TimerEvent):void
		{
			teleportClosed = false;
			openTeleportTimer.reset();
		}
		
	}
	
	
}