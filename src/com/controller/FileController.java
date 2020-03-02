package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.AbsencePeople;
import com.sun.corba.se.spi.orbutil.fsm.Input;


@Controller
@RequestMapping("file")
public class FileController {
	//文件上传
	@RequestMapping("fileUp.do")
	public String fileUp(@RequestParam("file") MultipartFile file,HttpServletRequest req) throws IOException {
		File file2=new File("d:\\upload\\");
		File[] directory=file2.listFiles();
		if (directory.length!=0) {
			for (File file3 : directory) {
				file3.delete();
			}
		}
		
		
		//获取文件输入流
		InputStream input=file.getInputStream();
		
		String fileName=file.getOriginalFilename();
		
		//输出流 将文件保存到哪
		OutputStream out = new FileOutputStream("d:\\upload\\"+fileName);
		
		//缓冲区
		byte[] bs = new byte[1024];	
		int len=-1;
		while ((len=input.read(bs))!=-1) {
			out.write(bs, 0, len);
		}
		input.close();
		out.close();
		req.getServletContext().setAttribute("fileName", fileName);

		//将文件上传到服务器某个硬盘中
	return "forward:/WEB-INF/jsp/member-uplist.jsp";
		
	}
	
	//下载文件
	@RequestMapping("download.do")
    public void download(@RequestParam("filename") String filename,HttpServletRequest req,HttpServletResponse resp) throws IOException{
        
    	//读取服务器中的文件

    	File file= new File("d:\\upload\\"+filename);
    	
    	//设置响应头和客户端保存文件名
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("multipart/form-data");
        resp.setHeader("Content-Disposition", "attachment;fileName=" + filename);
    	
        InputStream input = new FileInputStream(file);
    	OutputStream output = resp.getOutputStream();
        //循环写入输出流
        byte[] b = new byte[2048];
        int len=-1;
        while ((len = input.read(b)) > 0) {
            output.write(b, 0, len);
      
        }
        
    	output.close();
    	
    	input.close();
	}
        
	
	//删除文件
	@RequestMapping("deleteFile.do")
    public String deleteFile(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String flag="";
		
		flag=delAllFile();
		
		req.setAttribute("flag", flag);
		return "forward:/WEB-INF/jsp/member-uplist.jsp";
    	
	}
	
		//先判断文件夹里是否有文件 
		public static String delAllFile() {
	
	        String flag="";
	    	String path="d:\\upload";
	    	File file=new File(path);
	    	File[] files=file.listFiles();
	    	//检查是否是文件夹
	    	if (file.isDirectory()) {
	    		if (!(files!=null&&files.length>0)) {
	
	    			flag="文件夹已经清空";
	    		}else {
	    			for (File f:file.listFiles()) {  			
	                    f.delete();  
	                flag="删除成功！！";
				}
			}					   	
	    	}
	    	return flag;
		}
	
}
