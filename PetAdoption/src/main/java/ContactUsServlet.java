

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userType = request.getParameter("userType");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        AdoptionDAO.saveContactQuery(userType, userName, userEmail, subject, message);

    
        response.sendRedirect("thank_you.html");
    }

    
}