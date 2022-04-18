import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cloudupload")
public class MyUpload extends HttpServlet {

	File file;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
					"root");
			Statement st = con.createStatement();

			ResultSet rt = st
					.executeQuery("select * from identitybasedremotedata.upload_file where status='no' and filename='"+request.getParameter("filename")+"'");

			while (rt.next()) {

				String user=rt.getString("userid");

				String itemName=rt.getString("filename");
				
				InputStream is=rt.getBinaryStream("file");
			
				String path="D:\\appuploads\\"+itemName;

				FileOutputStream myos=new FileOutputStream(path);

				Random r=new Random();

				String key="";

				String pattern="ABCDEFGHIJLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

				for(int i=0;i<9;i++)
				{
					key=key+pattern.charAt(r.nextInt(60));

				}

				try {

					SimpleFTPClient.encrypt(is, myos,key+request.getSession().getAttribute("userid"));

				} catch (Throwable e) {

					e.printStackTrace();
				}

				if(FileUpload.fileUpload(path))
				{

					PreparedStatement ps = con
							.prepareStatement("update upload_file set skey='"
									+ key + "',status='yes' where userid='"
									+ user + "' AND filename='" + itemName + "' ;");
					ps.execute();
					
					response.sendRedirect("admin_upload.jsp");

				}
			}

		}catch(Exception e){

			e.printStackTrace();

		} finally {
			out.close();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
}
