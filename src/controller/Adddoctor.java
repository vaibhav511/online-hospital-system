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
 * Servlet implementation class Adddoctor
 */
@WebServlet("/Adddoctor")
public class Adddoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adddoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    MyConnection con=new MyConnection();
	Statement statement,statement1;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
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
			
		    statement1=con.OpenConnection();
		    ResultSet resultSet=statement1.executeQuery("select DEmail from doctor where DEmail='"+email+"'");
		    if(!resultSet.next())
		    {
		    statement=con.OpenConnection();
		    String query1="insert into doctor (DEmail, DName, Department, AvailableTime, AvailableDays, DAddress, DCity, DZip, DContact) values('"+email+"','"+name+"','"+department+"','"+availabletime+"','"+days+"','"+address+"','"+city+"',"+zip+","+contact+")";
		    String quety2="insert into userlogin (Email, Password, AccountType) values('"+email+"','"+password+"','"+acctype+"')";
		    statement.addBatch(query1);
		    statement.addBatch(quety2);
		    //int insert=statement.executeUpdate("insert into patient (PEmail, PName, PAddress, PCity, PZip, PContact) values('"+email+"','"+name+"','"+address+"','"+city+"',"+zip+","+contact+")");
		    int insert1[]=statement.executeBatch();
		    statement.close();
		    statement1.close();
		    System.out.println("Doctor Registered.."+insert1);
		    con.CloseConnection();
		    request.setAttribute("success", "Doctor Registration Successful.");
			RequestDispatcher rq=request.getRequestDispatcher("adddoctor.jsp");
			rq.forward(request, response);
			
		    }
		    else
		    {
		    	request.setAttribute("success", "Doctor Already Exists.");
				RequestDispatcher rq=request.getRequestDispatcher("adddoctor.jsp");
				rq.forward(request, response);
		    }
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			out.print("<h1>Doctor Registration Failed</h1>"+e);
			
		}
		finally{
			con.CloseConnection();
		}
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
