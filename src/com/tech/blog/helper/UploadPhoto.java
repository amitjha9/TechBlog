package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class UploadPhoto {

	//By using this method we will be deleting the user old profile photo
	public static boolean deletePhoto(String path)
	{
		boolean flag = false;
		try {
			//Create an object of file
			File file = new File(path);
			flag = file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	//By using this method we will be uploading user new profile photo to the server
	//With inputstream we will be reading the file data and store that data into the byte array.
	//With fileoutput stream we can write file data
	public static boolean uploadNewPhoto(InputStream is, String path)
	{
		boolean flag = false;
		try {
			if(flag==false)
			{
				//Declaration of byte array
				byte b[] = new byte[is.available()];
				is.read();

				//Write to the file
				FileOutputStream fos = new FileOutputStream(path);
				fos.write(b);
				fos.flush();
				fos.close();
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
