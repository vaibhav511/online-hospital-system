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
 * Servlet implementation class UpdateRoomAssignations
 */
@WebServlet("/UpdateRoomAssignations")
public class UpdateRoomAssignations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoomAssignations() {
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
		String roomNo=request.getParameter("roomNo");
		Statement statement=null;
		try {
			statement=con.OpenConnection();
			String query1="update rooms set AssignedPatientID=NULL, AssignedFrom=NULL, AssignedTo=NULL where roomNo="+roomNo+"";
			statement.addBatch(query1);
			statement.executeBatch();
			request.setAttribute("success", "Row Updated...");
				request.getRequestDispatcher("rooms.jsp").forward(request, response);
			statement.close();
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
