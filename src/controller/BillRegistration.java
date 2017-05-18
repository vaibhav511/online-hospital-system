package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyConnection;

/**
 * Servlet implementation class BillRegistration
 */
@WebServlet("/BillRegistration")
public class BillRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BillRegistration() {
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
		
		PrintWriter out=response.getWriter();
		String txtPatientID=request.getParameter("txtPatientName");
		String txtAdmitdate=request.getParameter("txtAdmitdate");
		String txtDischargedate=request.getParameter("txtDischargedate");
		int txtRoomCharges=Integer.parseInt(request.getParameter("txtRoomCharges"));
		int txtPathalogyFee=Integer.parseInt(request.getParameter("txtPathalogyFee"));
		int txtDoctorFee=Integer.parseInt(request.getParameter("txtDoctorFee"));
		int txtTotalAmt=Integer.parseInt(request.getParameter("txtTotalAmt"));
		String txtRemarks=request.getParameter("txtRemarks");
		
		try {
		    
		    statement=con.OpenConnection();
		    String query1="insert into bills (PatientID, DateOfAddmission, DateOfDischarge, RoomCharges, PathologyFee, DoctorFee, TotalAmount, Remarks) values"
		    		+ "('"+txtPatientID+"','"+txtAdmitdate+"','"+txtDischargedate+"',"+txtRoomCharges+","+txtPathalogyFee+","+txtDoctorFee+","+txtTotalAmt+",'"+txtRemarks+"')";
		    statement.addBatch(query1);
		    int insert1[]=statement.executeBatch();
		    statement.close();
		    System.out.println("Bill Created. Kindly Print from the bill menu.."+insert1);
		    con.CloseConnection();
		    request.setAttribute("success", "Bill Created. Kindly Print from the bill menu.");
			RequestDispatcher rq=request.getRequestDispatcher("newbills.jsp");
			rq.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			out.print("<h1>Bill Creation Failed</h1>"+e);
			
		}
		finally{
			con.CloseConnection();
		}
		
		
	}

}
