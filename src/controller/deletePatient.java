package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyConnection;

/**
 * Servlet implementation class deletePatient
 */
@WebServlet("/deletePatient")
public class deletePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletePatient() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyConnection con=new MyConnection();
		String patientid=request.getParameter("patientid");
		Statement statement,statement1=null;
		ResultSet rs;
		String userid="";
		try {
			
			
			statement=con.OpenConnection();
			statement1=con.OpenConnection();
			String query="select PEmail from patient where PatientID="+patientid+"";
			rs=statement.executeQuery(query);
			while(rs.next())
			{
				userid=rs.getString(1);
			}
			statement.close();
			
			String query1="delete from patient where PatientID="+patientid+"";
			String query2="delete from userlogin where Email='"+userid+"'";
			
			statement1.addBatch(query1);
			statement1.addBatch(query2);
			statement1.executeBatch();
			
			
			request.setAttribute("success", "Row Deleted...");
				request.getRequestDispatcher("patient.jsp").forward(request, response);
			statement1.close();
			con.CloseConnection();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		finally
		{
			con.CloseConnection();
		}
		
	}

}
