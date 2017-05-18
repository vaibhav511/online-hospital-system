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
 * Servlet implementation class PathologyRegistration
 */
@WebServlet("/PathologyRegistration")
public class PathologyRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PathologyRegistration() {
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
	Statement statement;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String testName=request.getParameter("testName");
		String testDate=request.getParameter("testDate");
		int txtPatientID=Integer.parseInt(request.getParameter("txtPatientName"));
		String txtDescription=request.getParameter("txtDescription");
		int txtAmount=Integer.parseInt(request.getParameter("txtAmount"));
		String txtRemarks=request.getParameter("txtRemarks");
		

		PrintWriter out=response.getWriter();
		try {
		    statement=con.OpenConnection();
		    String query1="insert into Pathology (TestName, TestDate, PatientID, Description, Amount, Remarks) values"
		    		+ "('"+testName+"','"+testDate+"',"+txtPatientID+",'"+txtDescription+"',"+txtAmount+",'"+txtRemarks+"')";
		    statement.addBatch(query1);
		    int insert1[]=statement.executeBatch();
		    statement.close();
		    System.out.println("Room Added in the db."+insert1);
		    con.CloseConnection();
		    request.setAttribute("success", "Report created successfully.");
			RequestDispatcher rq=request.getRequestDispatcher("newpathalogies.jsp");
			rq.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			out.print("<h1>Faild to creating pathalogy report.</h1>"+e);
		}
		finally{
			con.CloseConnection();
		}
		

		
	}

}
