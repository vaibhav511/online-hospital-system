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
 * Servlet implementation class RoomAssignation
 */
@WebServlet("/RoomAssignation")
public class RoomAssignation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomAssignation() {
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
		// TODO Auto-generated method stub
		int patientID=Integer.parseInt(request.getParameter("patientname"));
		int roomNo=Integer.parseInt(request.getParameter("roomNo"));
		String txtAssignFrmDate=request.getParameter("txtAssignFrmDate");
		String txtAssignToDate=request.getParameter("txtAssignToDate");
		String remarks=request.getParameter("remarks");
		
		PrintWriter out=response.getWriter();
		try {
		    statement=con.OpenConnection();
		    String query1="update rooms set AssignedPatientID='"+patientID+"', AssignedFrom='"+txtAssignFrmDate+"', AssignedTo='"+txtAssignToDate+"' where RoomNo="+roomNo+"";
		    statement.addBatch(query1);
		    int insert1[]=statement.executeBatch();
		    statement.close();
		    System.out.println("Room assigned in the db."+insert1);
		    con.CloseConnection();
		    request.setAttribute("success", "Room assigned Successfully to patient.");
			RequestDispatcher rq=request.getRequestDispatcher("roomassign.jsp");
			rq.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			out.print("<h1>Failed to assigning room.</h1>"+e);
		}
		finally{
			con.CloseConnection();
		}
		

		
		
	}

}
