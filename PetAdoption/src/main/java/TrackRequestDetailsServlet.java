

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.AnimalDetails;


@WebServlet("/TrackRequestDetailsServlet")
public class TrackRequestDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrackRequestDetailsServlet() {
        super();
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String animalType = request.getParameter("animalType");
        int registrationNumber = Integer.parseInt(request.getParameter("registrationNumber"));
        String authorizationPass = request.getParameter("authorizationPass");

        AnimalDetails animalDetails = AdoptionDAO.getAnimalDetails(animalType, registrationNumber, authorizationPass);

        if (animalDetails != null) {
            request.setAttribute("animalDetails", animalDetails);
            RequestDispatcher dispatcher = request.getRequestDispatcher("tracking.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("error.jsp"); 
        }
    }
}
