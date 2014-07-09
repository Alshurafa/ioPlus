import mx.controls.Alert;
import flash.ui.Mouse;

class myGUI
{
	static public function showAlert(title:String, message:String, twoButtons:Boolean, Button1:String, Button2:String):void
	{
		if (twoButtons==true){
			Alert.show(message,title,Alert.YES|Alert.NO);
		}else{
			Alert.show(message,title,Alert.OK);
		}
	}

	static public function getClickedButton():String
	{
		return "";
	}
	
	static public function showKeyboard(title:String, prompt:String, defaultText::String):void
	{
	}
	
	static public function getKeyboardInput():String
	{
		return "";
	}
	
	static public function saveStringToFile(message:String,filename:String):void
	{	
	}
	
	static public function loadStringFromFile(filename:String):String
	{
		return "";
	}
	
}