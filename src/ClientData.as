package
{
	import flash.net.SharedObject;
	
	public class ClientData
	{
		
		
		public var lastOpenedLevel:int = 0;
		public var mute:Boolean = false;
		private var data:SharedObject = SharedObject.getLocal("squirrel_data");
		
		public function ClientData():void
		{
			
			//trace(data.data.lastOpenedLevel);
			
			
		}
		
		public function record():void
		{
			
			data = SharedObject.getLocal("squirrel_data");
			data.data.lastOpenedLevel = lastOpenedLevel;
			data.data.mute = mute;
			trace(1);
		}
		
		public function read():void
		{
			
			data = SharedObject.getLocal("squirrel_data");
			lastOpenedLevel = data.data.lastOpenedLevel;
			trace(this.lastOpenedLevel);
			trace(Level.currentLevelID);
			mute = data.data.mute;
			
		}
		
		
	}
	
	
}