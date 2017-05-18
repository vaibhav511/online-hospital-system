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

import dao.MyConnection;

/**
 * Servlet implementation class editDoctor
 */
@WebServlet("/editDoctor")
public class editDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	MyConnection con=new MyConnection();
	Statement statement;
    
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String department=request.getParameter("department");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		long zip=Long.parseLong(request.getParameter("zip"));
		long contact=Long.parseLong(request.getParameter("contact"));
		String password=request.getParameter("password");
		//String confirmPassword=request.getParameter("confirmPassword");
		String availabletime=request.getParameter("availabletime");
		String acctype="Doctor";
		
		String sunday=request.getParameter("sunday");
		String monday=request.getParameter("monday");
		String tuesday=request.getParameter("tuesday");
		String wednesday=request.getParameter("wednesday");
		String thursday=request.getParameter("thursday");
		String friday=request.getParameter("friday");
		String saturday=request.getParameter("saturday");
		String arrdays[]=new String[]{sunday,monday,tuesday,wednesday,thursday,friday,saturday};
		
		StringBuilder days=new StringBuilder();
		for(int i=0;i<=6;i++)
		{
			if(arrdays[i]!=null)
			{
				days.append(arrdays[i]+",");	
			}
		}
		days.deleteCharAt(days.length()-1);
		//System.out.println(days);
		//System.out.println(email+name+address+city+zip+contact);

		try {
		    statement=con.OpenConnection();
		    String query1="update doctor set DName='"+name+"', Department='"+department+"', AvailableTime='"+availabletime+"', AvailableDays='"+days+"', DAddress='"+address+"', DCity='"+city+"', DZip='"+zip+"', DContact='"+contact+"' where DEmail='"+email+"' ";
		    String quety2="update userlogin set Password='"+password+"' where Email='"+email+"'";
		    statement.addBatch(query1);
		    statement.addBatch(quety2);
		    statement.executeBatch();
		    statement.close();
		  
		    System.out.println("Doctor Updated..");
		    con.CloseConnection();
		    request.setAttribute("success", "Doctor Updated.");
			RequestDispatcher rq=request.getRequestDispatcher("editdoctor.jsp");
			rq.forward(request, response);
		   
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			out.print("<h1>Doctor Updation Failed</h1>"+e);
			
		}
		finally{
			con.CloseConnection();
		}
	

		
	}
	
}
