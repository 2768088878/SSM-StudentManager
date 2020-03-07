package com.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
	public void fileUp(@RequestParam("file") MultipartFile file,HttpServletRequest req,HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=UTF-8"); //转码
		File file2=new File("d:\\upload\\");
		File[] directory=file2.listFiles();
		if (directory.length!=0) {
			for (File file3 : directory) {
				file3.delete();
			}
		}
		
		
		//获取这个要上传文件的输入流
		
		InputStream input=new BufferedInputStream(file.getInputStream());
		
//		获取到这个文件的文件名
		String fileName=file.getOriginalFilename();
		
		//输出流 将文件保存到哪
		OutputStream out =new BufferedOutputStream(new FileOutputStream("d:\\upload\\"+fileName));
		
		//缓冲区
		byte[] bs = new byte[1024];	
		int len=-1;
		while ((len=input.read(bs))!=-1) {
			out.write(bs, 0, len);
		}
		out.flush();
		input.close();
		out.close();
		req.getServletContext().setAttribute("fileName", fileName);
//		req.getSession().setAttribute("fileName", fileName);
		PrintWriter printWriter = resp.getWriter();
		printWriter.flush();
		printWriter.println("<script>");
		printWriter.println("alert('文件上传成功！');");
		printWriter.println("history.back();");//这种不会刷新页面
		printWriter.println("history.go(0);");//这种会刷新页面
		printWriter.println("</script>");
//		return "redirect:/to/File.do";
	}
	
	//下载文件
	@RequestMapping("download.do")
    public void download(@RequestParam(value="filename",required=false) String filename,HttpServletRequest req,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html; charset=UTF-8"); //转码
    	//读取服务器中的文件
		
	//这里的判断是为了当没有上传文件的时候点下载也不会报错
	if (filename!=null&&!"".equals(filename)) {
		//指定一下要下载的位置
    	File file= new File("d:\\upload\\"+filename);
    		//设置响应头和客户端保存文件名
            resp.setCharacterEncoding("utf-8");
            resp.setContentType("multipart/form-data");
            resp.setHeader("Content-Disposition", "attachment;fileName=" + filename);
            
            //从网上下载文件，要获取文件的输出流
        	OutputStream output =new BufferedOutputStream(resp.getOutputStream());
        	
        	//输入流，指定要输入/下载到哪里的输入流
            InputStream input =new BufferedInputStream(new FileInputStream(file));

            //循环写入输出流
            byte[] b = new byte[2048];
            int len=-1;
            while ((len = input.read(b)) > 0) {
                output.write(b, 0, len);
          
            }
            
        	output.close();
        	
        	input.close();
		}else {
			PrintWriter out = resp.getWriter();
		    out.flush();
		    out.println("<script>");
		    out.println("alert('没有可下载的文件！');");
		    out.println("history.back();");
		    out.println("</script>");
		}
    	
	}
        
	
	//删除文件
	@RequestMapping("deleteFile.do")
    public String deleteFile(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		String flag="";
		
		flag=delAllFile();
		
		req.setAttribute("flag", flag);
		req.getServletContext().removeAttribute("fileName");
		return "forward:/to/AdminFile.do";
    	
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
