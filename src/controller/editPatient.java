package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyConnection;

/**
 * Servlet implementation class editPatient
 */
@WebServlet("/editPatient")
public class editPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editPatient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}
	
	MyConnection con=new MyConnection();
	Statement statement;
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		long zip=Long.parseLong(request.getParameter("zip"));
		long contact=Long.parseLong(request.getParameter("contact"));
		String password=request.getParameter("password");
		
		try {
		    statement=con.OpenConnection();
		    String query1="update patient set PName='"+name+"', PAddress='"+address+"', PCity='"+city+"', PZip='"+zip+"', PContact='"+contact+"' where PEmail='"+email+"' ";
		    String quety2="update userlogin set Password='"+password+"' where Email='"+email+"'";
		    statement.addBatch(query1);
		    statement.addBatch(quety2);
		    statement.executeBatch();
		    statement.close();
		  
		    System.out.println("Patient Updated..");
		    con.CloseConnection();
		    request.setAttribute("success", "Patient Updated.");
			RequestDispatcher rq=request.getRequestDispatcher("editpatient1.jsp");
			rq.forward(request, response);
		   
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			out.print("<h1>Patient Updation Failed</h1>"+e);
			
		}
		finally{
			con.CloseConnection();
		}
	
	}

}
