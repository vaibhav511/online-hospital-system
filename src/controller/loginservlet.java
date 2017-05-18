package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.MyConnection;

/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	MyConnection mycon;
	Statement statement;
	ResultSet rs;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String username = request.getParameter("username");
		String password = request.getParameter("password").toString();
		String acctype = request.getParameter("acctype");

		HttpSession session = request.getSession();
		mycon = new MyConnection();

		try {

			statement = mycon.OpenConnection();

			// System.out.println("opening conn");
			rs = statement
					.executeQuery("select Email,Password,AccountType from userlogin where Email='"
							+ username.toString()
							+ "' and Password='"
							+ password.toString()
							+ "' and AccountType='"
							+ acctype.toString() + "';");

			if (rs.next()) {
				System.out.println(acctype);
				System.out.println("User is "+rs.getString("EMail"));
				session.setAttribute("username", username);
				session.setAttribute("acctype", acctype);
				// RequestDispatcher
				// rq=request.getRequestDispatcher("index.jsp");
				// rq.forward(request, response);
				response.sendRedirect("index.jsp");
				//System.out.println("hello");
				rs.close();
				mycon.CloseConnection();
					}
			else
			{
				request.setAttribute("error", "Wrong User Or Password.");
				RequestDispatcher rq = request
						.getRequestDispatcher("login.jsp");
				rq.forward(request, response);

			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			// smcon.CloseConnection();

		}

	}
}
