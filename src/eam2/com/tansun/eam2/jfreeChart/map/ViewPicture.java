package com.tansun.eam2.jfreeChart.map;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tansun.rdp4j.common.web.utils.ResponseUtil;


/**
 * 读取本地路径上的图片到浏览器上直接显示
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright Tansun (c) 2005</p>
 * <p>Company: 北京天阳宏业软件技术有限公司</p>
 * @author <a href="mailto:fangbaling@tansun.com.cn">Fangbaling</a>
 * @since 2006-8-18
 * @version 1.0
 */
public class ViewPicture extends HttpServlet {
   
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String ints = request.getParameter("ints");
        String fileName = request.getParameter("filename");

        if(ints == null){
            System.err.println("缺少必要的参数");
            return;
        }
        int[] prov = splitString(ints, ",");
        //如果是区域图则需要提供5个区域的图片参数，如果是省网图则需要提供24个省网的图片。
        if(prov.length != 31){
        	System.err.println("缺少必要的参数");
            return;
        }
        
        fileName = (fileName == null || fileName.length() == 0) ? new SimpleDateFormat("yyyyMMddHHmm").format(new Date()) : fileName;
        if(prov.length == 31){
        	viewProvincePicture(prov, response, fileName, 0, 0);
        }
    }
    
    private void viewProvincePicture(int[] prov, HttpServletResponse response, String filename, int width, int height) {
        String mimeType =  "image/jpeg";
    
        try {
            byte[] file = ProvincePicture.getProvincePicture(prov, width, height);
            ResponseUtil.download(response, file, filename,mimeType);
        } catch (IOException ex) {
            System.err.println("IOException: 生成图片异常" + ex.getMessage());
        }
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doGet(request, response);
    }
    
    private final static int[] splitString(String source, String split){
        if (source == null) {
            return new int[0];
        }
        StringTokenizer token = new StringTokenizer(source, split);
        int count = token.countTokens();
        if (count <= 0)
            return new int[0];
        int[] s = new int[count];
        for (int i = 0; i < count; i++) {
            s[i] = new Integer(token.nextToken().trim()).intValue();
        }
        return s;
    }
}
