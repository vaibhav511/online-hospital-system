package controller;

import java.io.IOException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyConnection;

/**
 * Servlet implementation class updateAppointments
 */
@WebServlet("/updateAppointments")
public class updateAppointments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAppointments() {
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
		// TODO Auto-generated method stub
		
		if (request.getParameter("update") != null) {
		    // Invoke FirstServlet's job here.
			//System.out.println("update button is called");
			
			String appointmentid=request.getParameter("appid");
			String status=request.getParameter("status");
			//System.out.println(appointmentid+status);
			try {
				
				Statement statement=new MyConnection().OpenConnection();
				int state=statement.executeUpdate("update appointments set status='"+status+"' where AppointmentID='"+appointmentid+"'");
				if(state>0)
				{
					//System.out.println("Updated"+state);
					request.setAttribute("success", "Data Updated...");
					RequestDispatcher rq= request.getRequestDispatcher("appointment.jsp");
					rq.forward(request, response);
					statement.close();
				//request.getRequestDispatcher("appointment.jsp").forward(request, response);
				
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			finally
			{
				
				new MyConnection().CloseConnection();
			}
			
			
			
			
			
		} else if (request.getParameter("delete") != null) {
		    // Invoke SecondServlet's job here.
			System.out.println("delete button is called");
		}
	}

}
