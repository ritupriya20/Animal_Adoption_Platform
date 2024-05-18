import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProcessAdoptionServlet")
public class ProcessAdoptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String animalType = request.getParameter("animalType");
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PetAdoption", "root", "ritu06");
            
            String authorizationPass = UUID.randomUUID().toString().substring(0, 8);
            String query = "INSERT INTO adoption_animals (authorizationPass, photoURL, breed, gender, age, description, healthCondition, organizationName, contactInfo, verify,animalType) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
            pstmt = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            
            pstmt.setString(1, authorizationPass);
            pstmt.setString(2, request.getParameter("photoURL"));
            pstmt.setString(3, request.getParameter("breed"));
            pstmt.setString(4, request.getParameter("gender"));
            pstmt.setString(5, request.getParameter("age"));
            pstmt.setString(6, request.getParameter("description"));
            pstmt.setString(7, request.getParameter("healthCondition"));
            pstmt.setString(8, request.getParameter("organizationName"));
            pstmt.setString(9, request.getParameter("contactInfo"));
            pstmt.setInt(10, 0);
            pstmt.setString(11, request.getParameter("animalType"));
            pstmt.executeUpdate();

            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            int registrationNumber = 0;
            if (generatedKeys.next()) {
                registrationNumber = generatedKeys.getInt(1);
            }
            response.sendRedirect("success.jsp?regNum=" + registrationNumber + "&authPass=" + authorizationPass);

        } catch (Exception e) {
            
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
