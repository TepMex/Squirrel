package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Video;
	import flash.events.NetStatusEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.net.NetConnection;
	import flash.events.AsyncErrorEvent;
	import flash.net.NetStream;
	import flash.utils.ByteArray;
	import flash.display.StageScaleMode;
	
	
	public class IntroVideo extends Sprite
	{
		private var video:Video;
		private var nc:NetConnection;
		private var ns:NetStream;
		private var stageLink:Stage;
		private var preloaderLink:Preloader;
		private const introTime:int = 6500;
		private var timer:Timer;
		
		public function IntroVideo(st:Stage,p:Preloader):void
		{
			
			super();
			
			stageLink = st;
			preloaderLink = p;
			
			
			stageLink.showDefaultContextMenu = false;
			stageLink.scaleMode = StageScaleMode.NO_SCALE;
			stageLink.tabChildren = false;
			stageLink.stageFocusRect = false;
			stageLink.focus = stage;
			stageLink.quality = "high";
			
			video = new Video(Assets.APP_WIDTH, Assets.APP_HEIGHT);
			this.addEventListener(MouseEvent.CLICK, removeIntro,false,0,true);
			
			//------
			
			timer = new Timer(introTime,1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, removeIntro,false,0,true);
			timer.start();
			
			
			nc = new NetConnection();
			nc.addEventListener(NetStatusEvent.NET_STATUS , onConnect,false,0,true);
			nc.addEventListener(AsyncErrorEvent.ASYNC_ERROR , trace,false,0,true);
			
			
			var metaSniffer:Object=new Object();  
			nc.client=metaSniffer;
			metaSniffer.onMetaData=getMeta;
			nc.connect(null);
			//------
			
			
			
			
			addChild(video);
			//addChild(progressText);
			timer.start();
			
			
			
		}
		
		private function getMeta (mdata:Object):void
		{
			video.width=Assets.APP_WIDTH;
			video.height=Assets.APP_HEIGHT;
		}
		
		private function onConnect(e:NetStatusEvent):void
		{
			if (e.info.code == 'NetConnection.Connect.Success')
			{
				trace(e.target as NetConnection);
				ns = new NetStream(nc);
				ns.client = {};
				var file:ByteArray = new Assets.VIDEO_INTRO();
				ns.play(null);
				ns.appendBytes(file);
				video.attachNetStream(ns);
			}
		}
		
		private function removeIntro(e:Event):void
		{
			ns.close();
			nc.close();
			video.clear();
			removeChild(video);
			
			this.parent.removeChild(this);
			preloaderLink.introComplete();
			trace("click!");
			video.removeEventListener(MouseEvent.CLICK, removeIntro);
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, removeIntro);
		}
		
		
		
	}
	
	
}	