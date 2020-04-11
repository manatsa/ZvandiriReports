package org.zvandiri.reports;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String encPass="";
		ResultSet rs=null;
		List<String> roles=new ArrayList<String>();
		try {
			if ( username!= null && password!= null) {
				rs=DBUtils.excecute("select u.password from zvandiri.user u where u.user_name='"+username+"'");
			
					while(rs.next())
					{
						encPass=rs.getString("password");
					}
				
				if(Security.loginCompare(password, encPass))
				{
					rs=DBUtils.excecute("select r.name from role r inner join user_role ur on ur.role_id=r.id"
							+ " inner join zvandiri.user u on ur.user_id=u.id"
							+ " where u.user_name='"+username+"'");
					
					while(rs.next())
					{
						roles.add(rs.getString("name"));
						System.out.println(rs.getString("name"));
					}
					request.getSession().setAttribute("roles", roles);
					//request.getRequestDispatcher("index.jsp").forward(request, response);
					request.getSession().setAttribute("username", username);
					response.sendRedirect("index.jsp");
				}else {
					System.out.println("Incorrect login details");
		        	//request.getRequestDispatcher("login.jsp?error=true").forward(request, response);
					response.sendRedirect("login.jsp?error=true");
				}
				

	        } else {
	        	System.out.println("Please enter all required details");
	        	//request.getRequestDispatcher("login.jsp?error=true").forward(request, response);
	        	response.sendRedirect("login.jsp?error=true");
	        }
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				rs.getStatement().getConnection().close();
			}catch(Exception ex) {}
		}

        
	}

}
