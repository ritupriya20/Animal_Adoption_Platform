
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdoptionRequestServlet
 */
@WebServlet("/AdoptionRequestServlet")
public class AdoptionRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdoptionRequestServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String animalType=request.getParameter("animalType");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String reason = request.getParameter("reason");
        String experience = request.getParameter("experience");
        
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/petadoption", "root", "ritu06");
            
            
            String adopterTable = "adopters_list";
            String createTableSQL = "CREATE TABLE IF NOT EXISTS " + adopterTable + " (adopter_id INT AUTO_INCREMENT PRIMARY KEY, "
                    + "animal_id int ,animalType varchar(50),name VARCHAR(50), email VARCHAR(50), phone VARCHAR(15), address TEXT, reason TEXT, experience TEXT)";
            
            pstmt = conn.prepareStatement(createTableSQL);
            pstmt.executeUpdate();
            pstmt.close();
            
            String insertSQL = "INSERT INTO " + adopterTable + " (animal_id,animalType, name, email, phone, address, reason, experience) VALUES (?,?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertSQL,Statement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, id);
            pstmt.setString(2, animalType);
            pstmt.setString(3, name);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            pstmt.setString(6, address);
            pstmt.setString(7, reason);
            pstmt.setString(8, experience);
            pstmt.executeUpdate();
            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            int adopter_id = 0;
            if (generatedKeys.next()) {
                adopter_id = generatedKeys.getInt(1);
            }
            pstmt.close();
            
            String updateAnimalTable = "UPDATE adoption_animals SET verify = 3 WHERE registrationNumber = ?";
            pstmt = conn.prepareStatement(updateAnimalTable);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            
            
            response.sendRedirect("success1.jsp?regNum=" + adopter_id); 
        } catch (SQLException e) {
            e.printStackTrace();
            
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                
            }
        }

	}

}
