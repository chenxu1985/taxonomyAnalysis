package cn.ac.big.gsa.sys.action;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.gsa.sys.pojo.CheckCodeSession;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
  
public class CheckCode extends ActionSupport{  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ByteArrayInputStream inputStream;
    private String sRand;
    private CheckCodeSession checkCodeSession;
    private String d;
    
      
    private Color getRandColor(int s, int e) {  
        Random random = new Random();  
        if (s > 255) s = 255;  
        if (e > 255) e = 255;  
        int r = s + random.nextInt(e - s);  
        int g = s + random.nextInt(e - s);  
        int b = s + random.nextInt(e - s);  
        return new Color(r, g, b);  
    }  
    @Override
	public String execute() throws Exception {  
                  
        // 在内在中创建图象  
        int width = 80;  
        int height = 25;  
        BufferedImage image = new BufferedImage(width, height,  
                BufferedImage.TYPE_INT_RGB);  
        Graphics g = image.getGraphics();  
        Graphics2D g2d=(Graphics2D)g;  
        Random random = new Random();
        System.out.println("checkcode is running!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
        Font mFont = new Font("Arial", Font.BOLD, 17);  
        g.setColor(getRandColor(200, 250));  
        g.fillRect(0, 0, width, height);  
        g.setFont(mFont);  
        g.setColor(getRandColor(180, 200));  
        sRand = "";
        //画随机的线条  
        for (int i = 0; i < 20; i++) {  
            int x = random.nextInt(width - 1);  
            int y = random.nextInt(height - 1);  
            int x1 = random.nextInt(6) + 1;  
            int y1 = random.nextInt(12) + 1;  
            BasicStroke bs=new BasicStroke(1f);
            //,BasicStroke.CAP_BUTT,BasicStroke.JOIN_BEVEL);  
            Line2D line=new Line2D.Double(x,y,x+x1,y+y1);  
            g2d.setStroke(bs);  
            g2d.draw(line);  
        }  
       // String sRand="";  
        //输出随机的验证文字  
        int itmp=0;  
        for(int i=0;i<4;i++){  
            if(random.nextInt(2)==1){  
                itmp=random.nextInt(26)+65; //生成A~Z的字母  
            }else{  
                itmp=random.nextInt(10)+48; //生成0~9的数字  
            }  
            char ctmp=(char)itmp;  
            sRand+=String.valueOf(ctmp);  
            Color color=new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110));  
            //Color color= new Color(20,120,80);
            g.setColor(color);  
            /****随机缩放文字并将文字旋转指定角度**/  
            //将文字旋转指定角度  
            Graphics2D g2d_word=(Graphics2D)g;  
            AffineTransform trans=new AffineTransform();  
           trans.rotate(random.nextInt(10)*3.14/180,15*i+10,6);  
            //缩放文字  
            //float scaleSize=random.nextFloat()+0.5f;  
           // if(scaleSize<0.8 || scaleSize>1.1f) scaleSize=1f;  
            //trans.scale(scaleSize, scaleSize);  
            g2d_word.setTransform(trans);  
            /************************/  
            g.drawString(String.valueOf(ctmp),15*i+10,17);  
  
        }
        
        HttpSession session = ServletActionContext.getRequest().getSession();
       
        System.out.println("sRand="+sRand);
        if(session.getAttribute("randCheckCode") !=null){
        	System.out.println("constain key old value="+session.getAttribute("randCheckCode"));
        	 
        	session.removeAttribute("randCheckCode") ;
        	
        }
        
        session.setAttribute("randCheckCode", sRand);
        System.out.println("new session="+session.getAttribute("randCheckCode"));
           
       // Session.setAttribute("rand",sRand); 
        checkCodeSession=new CheckCodeSession();
        checkCodeSession.setCheckCode(sRand);		
		checkCodeSession.setCreateTime(System.currentTimeMillis());
		checkCodeSession.setValidate(true);
        g.dispose();  
        ByteArrayInputStream input=null;     
        ByteArrayOutputStream output = new ByteArrayOutputStream();     
        try{     
            ImageOutputStream imageOut = ImageIO.createImageOutputStream(output);     
            ImageIO.write(image, "JPEG", imageOut);     
            imageOut.close();    
            
    
            input = new ByteArrayInputStream(output.toByteArray());   
            System.out.println("input:"+input.toString());
        }catch(Exception e){     
            System.out.println("check error"+e.toString());     
        }    
        this.setInputStream(input);  
        
        try{
        	
//        	 @SuppressWarnings("deprecation")
			String path = ServletActionContext.getRequest().getRealPath("/");
//        	String path="E:\\apache-tomcat-7.0.56\\webapps\\sra_150108"; 
        	 File file = new File(path+File.separator+"images"+File.separator+"code.gif");
        	 System.out.println("path="+path+File.separator+"images"+File.separator+"code.gif");
        	 FileOutputStream fileout = new FileOutputStream(file);
        	 fileout.write(output.toByteArray());
        	 fileout.flush();
        	 fileout.close();
             
        }catch(Exception ex){
        	ex.printStackTrace();
        }
       
        
        
        
        return Action.SUCCESS;  
    }  
      
     public void setInputStream(ByteArrayInputStream inputStream) {     
         this.inputStream = inputStream;     
    }     
    public ByteArrayInputStream getInputStream() {     
         return inputStream;     
    }
    public void setCheckCodeSession(CheckCodeSession checkCodeSession) {
		this.checkCodeSession = checkCodeSession;
	}
	public CheckCodeSession getCheckCodeSession() {
		return checkCodeSession;
	}
	public String getsRand() {
		return sRand;
	}
	public void setsRand(String sRand) {
		this.sRand = sRand;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}
	
	
} 