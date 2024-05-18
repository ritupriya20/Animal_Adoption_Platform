import com.example.AnimalDetails;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RetrieveDetailsForAdopterServlet")
public class RetrieveDetailsForAdopterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RetrieveDetailsForAdopterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedAnimalType = request.getParameter("animal");
        List<AnimalDetails> animalDetailsList = AdoptionDAO.getAnimalDetailsByVerifyStatus(selectedAnimalType);

        if (!animalDetailsList.isEmpty()) {
            request.setAttribute("animalDetailsList", animalDetailsList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("animalDetails.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
