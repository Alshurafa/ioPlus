#Rem
ioPlus module does some basic file input&output.
It also adds support to the native Windows Phone 7 keyboard (Not perfect though).
It also has a two, or one button notification dialog.
#End

#if HOST="macos" And TARGET="glfw"
	Import "native/ioPlus.${TARGET}.mac.${LANG}"
#else
	Import "native/ioPlus.${TARGET}.${LANG}"
#end

Import mojo

Extern
	#If LANG="cpp" Then
		Function ShowAlert:Void(title:String, message:String, twoButtons:Bool=False, Button1:String="OK",Button2:String="Cancel")="ioPlus::showAlert"
		Function GetClickedButton:String()="ioPlus::getClickedButton"
		Function ShowXNAKeyboard:Void(title:string="", prompt:string="", defaultText:String="") = "ioPlus::showKeyboard"
		Function GetKeyboardInput:String()="ioPlus::getKeyboardInput"
		Function SaveStringToFile:Void(message:String, filename:String) = "myGUI::saveStringToFile"
		Function LoadStringFromFile:String(filename:String) = "myGUI::loadStringFromFile"
	#Else
		Function ShowAlert:Void(title:String, message:String, twoButtons:Bool=False, Button1:String="OK",Button2:String="Cancel")="ioPlus.showAlert"
		Function GetClickedButton:String()="ioPlus.getClickedButton"
		Function ShowXNAKeyboard:Void(title:string="", prompt:string="", defaultText:String="") = "ioPlus.showKeyboard"
		Function GetKeyboardInput:String()="ioPlus.getKeyboardInput"
		Function SaveStringToFile:Void(message:String, filename:String) = "ioPlus.saveStringToFile"
		Function LoadStringFromFile:String(filename:String) = "ioPlus.loadStringFromFile"
	#End
Public