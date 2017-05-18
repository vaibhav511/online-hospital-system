package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyConnection;

/**
 * Servlet implementation class newappointment
 */
@WebServlet("/newappointment")
public class newappointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public newappointment() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	String time;
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Statement statement = null;
		ResultSet resultSet=null;
		PrintWriter out = response.getWriter();
		String appdate = request.getParameter("appdate");
		String dept = request.getParameter("department");
		int docID = Integer.parseInt(request.getParameter("doctorname"));
		String illnessdet = request.getParameter("illnessdet");
		String status = request.getParameter("status");
		int patientid = Integer.parseInt(request.getParameter("patientname"));
		String treatmentdet = "none";
		time= "10:00:00";

		out.print("<h1>hello</h1>");

		MyConnection con = new MyConnection();

		try {
			statement = con.OpenConnection();
			String query1 = "select AppointmentDate,AppointmentTime, AppointmentID from appointments where DoctorID="
					+ docID
					+ " AND AppointmentDate='"
					+ appdate
					+ "' ORDER BY AppointmentID DESC LIMIT 1";
			resultSet = statement.executeQuery(query1);
			if (!resultSet.wasNull()) {
				while (resultSet.next()) {
					System.out.println(resultSet.getString(1) + " app date "
							+ appdate);
					System.out.println(resultSet.getString(2));
					time=resultSet.getString(2);
				
				
				SimpleDateFormat inFormat = new SimpleDateFormat("HH:mm:ss");
				Date aptime= inFormat.parse(time);
				
				Calendar myapptime=Calendar.getInstance();
				myapptime.setTime(aptime);
				myapptime.add(Calendar.MINUTE, 15);
				
				time=inFormat.format(myapptime.getTime());
				//System.out.print(time);
				}
				
			} 

				String query = "insert into Appointments(PatientID,DoctorID,Department,AppointmentDate,AppointmentTime,IllnessDetails,TreatmentDetails,Status) values("
						+ patientid
						+ ","
						+ docID
						+ ",'"
						+ dept
						+ "','"
						+ appdate
						+ "','"
						+ time
						+ "','"
						+ illnessdet
						+ "','"
						+ treatmentdet + "','" + status + "')";
				statement.addBatch(query);
				int insert1[] = statement.executeBatch();
				statement.close();
				// System.out.println("Appointment Submitted.."+insert1);

				request.setAttribute("success", "Appointment Submitted. Your appointment date and time is :- "+appdate+" "+time);
				RequestDispatcher rq = request
						.getRequestDispatcher("newappointment.jsp");
				rq.forward(request, response);

			
		}

		catch (Exception e) {
			System.out.println(e);
		}

		finally {
			
			con.CloseConnection();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
