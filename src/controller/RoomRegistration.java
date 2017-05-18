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
 * Servlet implementation class RoomRegistration
 */
@WebServlet("/RoomRegistration")
public class RoomRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomRegistration() {
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
		String roomNo=request.getParameter("roomNo");
		String roomType=request.getParameter("roomType");
		int roomPrice=Integer.parseInt(request.getParameter("roomPrice"));;
		String remarks=request.getParameter("remarks");
		
		PrintWriter out=response.getWriter();
		try {
		    statement=con.OpenConnection();
		    String query1="insert into rooms (RoomNo, RoomType, RoomPrice, Remarks) values"
		    		+ "("+roomNo+",'"+roomType+"',"+roomPrice+",'"+remarks+"')";
		    statement.addBatch(query1);
		    int insert1[]=statement.executeBatch();
		    statement.close();
		    System.out.println("Room Added in the db."+insert1);
		    con.CloseConnection();
		    request.setAttribute("success", "Room Added Successfully.");
			RequestDispatcher rq=request.getRequestDispatcher("newrooms.jsp");
			rq.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			out.print("<h1>Faild to adding new room.</h1>"+e);
		}
		finally{
			con.CloseConnection();
		}
		
	}
	
}
