package com.tansun.eam2.jfreeChart.map;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;

/**
 * Created by IntelliJ IDEA.
 * Date: 2007-4-29
 * Time: 10:44:28
 * 0 非常富裕 ，1 富裕，2 略微富裕 ，3 略微紧张 ，4 紧张，5非常紧张
 */
public class ProvincePicture {
	public static final String[] PROVINCE_CN = new String[] {"北京","天津", "河北","山西", "内蒙古", "辽宁", "吉林", "黑龙江", "上海", "江苏", "浙江",  "安徽", "福建", "江西", "山东", "河南", "湖北", "湖南", "广东", "广西", "海南", "重庆", "四川", "贵州", "云南", "西藏", "陕西", "甘肃", "青海", "宁夏", "新疆"};
	public static final String[] PROVINCE_CN_PY = new String[] {"北京","天津", "河北","山西", "内蒙古", "辽宁", "吉林", "黑龙江", "上海", "江苏", "浙江",  "安徽", "福建", "江西", "山东", "河南", "湖北", "湖南", "广东", "广西", "海南", "重庆", "四川", "贵州", "云南", "西藏", "陕西", "甘肃", "青海", "宁夏", "新疆"};
    //	图片定义
    protected static final String[][] pic = {
    	{"beijing01.gif", "beijing02.gif", "beijing03.gif" ,"beijing04.gif"},
    	{"tianjin01.gif", "tianjin02.gif", "tianjin03.gif" ,"tianjin04.gif"},
    	{"hebei01.gif", "hebei02.gif", "hebei03.gif" ,"hebei04.gif"},
    	{"shanxi01.gif", "shanxi02.gif", "shanxi03.gif" ,"shanxi04.gif"},
    	{"neimenggu01.gif", "neimenggu02.gif", "neimenggu03.gif" ,"neimenggu04.gif"},
    	{"liaoning01.gif", "liaoning02.gif", "liaoning03.gif" ,"liaoning04.gif"},
     	{"jilin01.gif", "jilin02.gif", "jilin03.gif" ,"jilin04.gif"},
    	{"heilongjiang01.gif", "heilongjiang02.gif", "heilongjiang03.gif" ,"heilongjiang04.gif"},
    	{"shanghai01.gif", "shanghai02.gif", "shanghai03.gif" ,"shanghai04.gif"},
       	{"jiangsu01.gif", "jiangsu02.gif", "jiangsu03.gif" ,"jiangsu04.gif"},
    	{"zhejiang01.gif", "zhejiang02.gif", "zhejiang03.gif" ,"zhejiang04.gif"},
    	{"anhui01.gif", "anhui02.gif", "anhui03.gif" ,"anhui04.gif"},
    	{"fujian01.gif", "fujian02.gif", "fujian03.gif" ,"fujian04.gif"},
    	{"jiangxi01.gif", "jiangxi02.gif", "jiangxi03.gif" ,"jiangxi04.gif"},
       	{"shandong01.gif", "shandong02.gif", "shandong03.gif" ,"shandong04.gif"},
    	{"henan01.gif", "henan02.gif", "henan03.gif" ,"henan04.gif"},
     	{"hubei01.gif", "hubei02.gif", "hubei03.gif" ,"hubei04.gif"},
     	{"hunan01.gif", "hunan02.gif", "hunan03.gif" ,"hunan04.gif"},
    	{"guangdong01.gif", "guangdong02.gif", "guangdong03.gif" ,"guangdong04.gif"},
    	{"guangxi01.gif", "guangxi02.gif", "guangxi03.gif" ,"guangxi04.gif"},
     	{"hainan01.gif", "hainan02.gif", "hainan03.gif" ,"hainan04.gif"},
    	{"chongqing01.gif", "chongqing02.gif", "chongqing03.gif" ,"chongqing04.gif"},
    	{"sichuan01.gif", "sichuan02.gif", "sichuan03.gif" ,"sichuan04.gif"},
    	{"guizhou01.gif", "guizhou02.gif", "guizhou03.gif" ,"guizhou04.gif"},
     	{"yunnan01.gif", "yunnan02.gif", "yunnan03.gif" ,"yunnan04.gif"},
    	{"xizang01.gif", "xizang02.gif", "xizang03.gif" ,"xizang04.gif"},
    	{"sshanxi01.gif", "sshanxi02.gif", "sshanxi03.gif" ,"sshanxi04.gif"},
    	{"gansu01.gif", "gansu02.gif", "gansu03.gif" ,"gansu04.gif"},
    	{"qinghai01.gif", "qinghai02.gif", "qinghai03.gif" ,"qinghai04.gif"},
    	{"ningxia01.gif", "ningxia02.gif", "ningxia03.gif" ,"ningxia04.gif"},
    	{"xinjiang01.gif", "xinjiang02.gif", "xinjiang03.gif" ,"xinjiang04.gif"}
    
    };

    protected transient static BufferedImage[] bf;
    protected transient static BufferedImage[] imgs;

    /**
     * 得到预警图片，返回BufferedImage
     * @param prov
     * int数据 0 非常富裕 (墨绿色)，1 富裕(草绿色)，2 略微富裕(浅绿色) ，3 略微紧张(粉红色) ，4 紧张(正红色)，5非常紧张(深红色)
     * @param width 宽度 会自动把图片居中
     * @param height 高度 会自动把图片居中
     * @return
     */
    public static BufferedImage getProvImage(int[] prov, int width, int height){

        loadImage(prov);
        BufferedImage bi = merge(imgs, null, width, height, bf);
        return bi;
    }

    /**
     * 得到预警图片，返回PNG图片数据文件。
     * @param prov
     * 
     * int数据 0 非常富裕 (墨绿色)，1 富裕(草绿色)，2 略微富裕(浅绿色) ，3 略微紧张(粉红色) ，4 紧张(正红色)，5非常紧张(深红色)
     * @param width 宽度 会自动把图片居中
     * @param height 高度 会自动把图片居中
     * @return
     */
    public static byte[] getProvincePicture(int[] prov, int width, int height){
        BufferedImage tag = getProvImage(prov, width, height);
        ByteArrayOutputStream result = new ByteArrayOutputStream();
        try {
            ImageIO.write(tag, "PNG", result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result.toByteArray();
    }

    /**
     * 加载图片
     *
     */
    private static void loadImage(int[] prov){
        imgs = new BufferedImage[prov.length];
        bf = new BufferedImage[2];
        for (int i = 0; i < prov.length; i++) {
            String[] x = pic[i];
            try{
                 
                String filepath  =  "images"+ File.separator + x[prov[i]];
                URL url = ProvincePicture.class.getResource(filepath);                //获取文件地址
                if(i == 0){
                    imgs[8] = ImageIO.read(url);
                }else if(i == 8){
                     imgs[0] = ImageIO.read(url);
                }else{
                    imgs[i] = ImageIO.read(url);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            bf[0] = ImageIO.read(ProvincePicture.class.getResource("images" + File.separator + "map.gif"));
            bf[1] = ImageIO.read(ProvincePicture.class.getResource("images" + File.separator + "font.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 合并图片。
     * @param img
     * @param xy
     * @param width
     * @param height
     * @param bi
     * @return
     */
    public static BufferedImage merge(Image[] img, int[][] xy, int width, int height, BufferedImage[] bi){
        int x = 0;
        int y = 0;
        if(width <= 600){
            width = 600;
        }else{
            x = (width - 600) / 2;
        }
        if(height <= 460){
            height = 460;
        }else{
            y = (height -460) / 2;
        }
        BufferedImage tag = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
        Graphics g = tag.createGraphics();
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);
        g.drawImage(bf[0], x, y, null);
        if(img != null && img.length != 0){
            for (int i = 0; i < img.length; i++) {
                if(xy != null){
                    g.drawImage(img[i], xy[i][0], xy[i][1], null);
                 }else{
                    g.drawImage(img[i], x, y, null);
                }
            }
        }
        g.drawImage(bf[1], x, y, null);
        return tag;
    }

	public static String[][] getPic() {
		return pic;
	}
}
