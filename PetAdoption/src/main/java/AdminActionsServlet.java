import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.AnimalDetails;



@WebServlet("/AdminActionsServlet")
public class AdminActionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     processRequest(request, response);
 }

 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     processRequest(request, response);
 }

 private void processRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     List<AnimalDetails> animalDetailsList;

     String action = request.getParameter("action");

     if (action != null) {
         String[] parts = action.split("_");
         String actionType = parts[0];
         int animalId = Integer.parseInt(parts[1]);
         switch (actionType) {
             case "approve":
                 AdoptionDAO.approveAnimal(animalId);
                 break;
             case "reject":
                 AdoptionDAO.rejectAnimal(animalId);
                 break;
             case "delete":
                 AdoptionDAO.deleteAnimal(animalId);
                 break;
         }
     }

     String animalType = request.getParameter("animalType");

     if ("all".equals(animalType) || animalType == null) {
         
         animalDetailsList = AdoptionDAO.getAllAnimals();
     } else {
         animalDetailsList = AdoptionDAO.getAnimalsByType(animalType);
     }

     request.setAttribute("animalDetailsList", animalDetailsList);
     request.setAttribute("selectedAnimalType", animalType);

     RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
     dispatcher.forward(request, response);
 }
}
