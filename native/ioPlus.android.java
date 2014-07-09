
import android.net.Uri;
import android.content.Context;
import android.app.AlertDialog;
import android.content.DialogInterface;
import java.io.FileOutputStream;

class myGUI
{
	public static AlertDialog.Builder alert;
	public static String clickedButton="Not intiated yet";
	
	static String getClickedButton()
	{
		String returned_value=clickedButton;
		clickedButton="Not intiated yet";
		return returned_value;
	}
	
	static void showAlert(String title, String message, boolean twoButtons, final String Button1, final String Button2)
	{
		clickedButton="No result yet";
		alert = new AlertDialog.Builder(MonkeyGame.activity);
		alert.setTitle(title);
		alert.setMessage(message);
		alert.setPositiveButton(Button1, new DialogInterface.OnClickListener() {
			public void onClick(DialogInterface dialog, int whichButton) {
				clickedButton= Button1;
			}
		});
		if (twoButtons)
			alert.setNegativeButton(Button2, new DialogInterface.OnClickListener() { 
				public void onClick(DialogInterface dialog, int whichButton) {   
					clickedButton= Button2;
				}
			});
		alert.show();
	}
	static void saveStringToFile(String message, String filename)
	{
		FileOutputStream fos;
		try {
			fos = MonkeyGame.view.getContext().openFileOutput(filename, Context.MODE_WORLD_READABLE); //Context.MODE_PRIVATE);
			fos.write(message.getBytes());
			fos.close();
		} catch (FileNotFoundException e) {
            e.printStackTrace();
        }catch(IOException e){
            e.printStackTrace();
        }
	}
	
	static String loadStringFromFile(String filename)
	{
		FileInputStream fis;
		try {
			fis = MonkeyGame.view.getContext().openFileInput(filename);
			ByteArrayOutputStream content = new ByteArrayOutputStream();
			int readBytes = 0;
			byte[] sBuffer = new byte[512];
			while ((readBytes = fis.read(sBuffer)) != -1) {
				content.write(sBuffer, 0, readBytes);
			}
			String message = new String(content.toByteArray());
			fis.close();
			return message;
		} catch (FileNotFoundException e) {
            e.printStackTrace();
        }catch(IOException e){
            e.printStackTrace();
        }
		return "File Not Found";
	}