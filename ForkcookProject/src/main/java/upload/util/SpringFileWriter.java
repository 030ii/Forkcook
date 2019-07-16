package upload.util;

import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class SpringFileWriter {
	FileOutputStream fos;
	
	public void writeFile(MultipartFile file, String path, String fileName)
	{
		try{
			byte fileData[]=file.getBytes();
			fos=new FileOutputStream(path+"\\"+fileName);
			fos.write(fileData);
		}catch(Exception e){
			System.out.println("파일 업로드 오류:"+e.getMessage());
		}finally{
			try{
				fos.close();
			}catch(Exception e){}
		}
	}

}
