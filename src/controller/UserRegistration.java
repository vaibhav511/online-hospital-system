package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.FNEG;


import dao.MyConnection;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	MyConnection con=new MyConnection();
	Statement statement,statement1;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		long zip=Long.parseLong(request.getParameter("zip"));
		long contact=Long.parseLong(request.getParameter("contact"));
		String password=request.getParameter("password");
		//String confirmPassword=request.getParameter("confirmPassword");
		String acctype="Patient";
		
		//System.out.println(email+name+address+city+zip+contact);

		try {
			
		    statement1=con.OpenConnection();
		    ResultSet resultSet=statement1.executeQuery("select PEmail from patient where PEmail='"+email+"'");
		    
		    if(!resultSet.next())
		    {
		    statement=con.OpenConnection();
		    String query1="insert into patient (PEmail, PName, PAddress, PCity, PZip, PContact) values('"+email+"','"+name+"','"+address+"','"+city+"',"+zip+","+contact+")";
		    String quety2="insert into userlogin (Email, Password, AccountType) values('"+email+"','"+password+"','"+acctype+"')";
		    statement.addBatch(query1);
		    statement.addBatch(quety2);
		    //int insert=statement.executeUpdate("insert into patient (PEmail, PName, PAddress, PCity, PZip, PContact) values('"+email+"','"+name+"','"+address+"','"+city+"',"+zip+","+contact+")");
		    int insert1[]=statement.executeBatch();
		    statement.close();
		    statement1.close();
		    System.out.println("User Registered.."+insert1);
		    con.CloseConnection();
		    request.setAttribute("success", "User Registration Successful.Please Login.");
			RequestDispatcher rq=request.getRequestDispatcher("signup.jsp");
			rq.forward(request, response);
			
		    }
		    else
		    {
		    	request.setAttribute("success", "User Already Exists.");
				RequestDispatcher rq=request.getRequestDispatcher("signup.jsp");
				rq.forward(request, response);
		    }
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			out.print("<h1>User Registration Failed</h1>"+e);
			
		}
		finally{
			con.CloseConnection();
		}
	    
		
		
	}

}
