/**
 * 
 */
package cn.ac.big.gsa.sys.action;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.gsa.util.VerifyCode;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author wang
 * 
 *         2016-7-28
 */
public class CheckCodeAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ByteArrayInputStream inputStream;
	private String sRand;

	public String execute() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		String rands = VerifyCode.generateTextCode(VerifyCode.TYPE_NUM_UPPER,
				4, "null");

		BufferedImage bim = VerifyCode.generateImageCode(rands, 85, 25, 3,
				true, Color.WHITE, Color.BLACK, null);
		ByteArrayInputStream input = null;
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		ImageOutputStream imageOut = null;
		try {
			imageOut = ImageIO.createImageOutputStream(output);
			ImageIO.write(bim, "JPEG", imageOut);
			imageOut.close();
			input = new ByteArrayInputStream(output.toByteArray());
			this.setInputStream(input);
			HttpSession session = ServletActionContext.getRequest()
					.getSession();
			session.setAttribute("randCheckCode", rands);
		} catch (Exception e) {
			System.out.println("check error" + e.toString());
		}

		return SUCCESS;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getsRand() {
		return sRand;
	}

	public void setsRand(String sRand) {
		this.sRand = sRand;
	}

}
