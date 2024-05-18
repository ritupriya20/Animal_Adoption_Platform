import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.AnimalDetails;
import java.sql.Statement;


public class AdoptionDAO {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/PetAdoption";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "ritu06";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); 
        }
    }

    public static AnimalDetails getAnimalDetails(String animalType, int registrationNumber, String authorizationPass) {
        AnimalDetails animalDetails = null;
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM adoption_animals WHERE registrationNumber = ? AND authorizationPass = ? AND animalType = ?")) {

            pstmt.setInt(1, registrationNumber);
            pstmt.setString(2, authorizationPass);
            pstmt.setString(3, animalType);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    animalDetails = new AnimalDetails();
                    animalDetails.setId(rs.getInt("registrationNumber"));
                    animalDetails.setPhotoURL(rs.getString("photoURL"));
                    animalDetails.setBreed(rs.getString("breed"));
                    animalDetails.setGender(rs.getString("gender"));
                    animalDetails.setAge(rs.getString("age"));
                    animalDetails.setDescription(rs.getString("description"));
                    animalDetails.setHealthCondition(rs.getString("healthCondition"));
                    animalDetails.setOrganizationName(rs.getString("organizationName"));
                    animalDetails.setContactInfo(rs.getString("contactInfo"));
                    animalDetails.setVerify(rs.getInt("verify"));
                    animalDetails.setanimalType(rs.getString("animalType"));
                    
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        return animalDetails;
    }

    public static List<AnimalDetails> getAnimalDetailsByVerifyStatus(String animalType) {
        List<AnimalDetails> animalDetailsList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM adoption_animals WHERE verify = 1 AND animalType = ?")) {

            pstmt.setString(1, animalType);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    AnimalDetails animalDetails = new AnimalDetails();
                    animalDetails.setId(rs.getInt("registrationNumber"));
                    animalDetails.setPhotoURL(rs.getString("photoURL"));
                    animalDetails.setBreed(rs.getString("breed"));
                    animalDetails.setGender(rs.getString("gender"));
                    animalDetails.setAge(rs.getString("age"));
                    animalDetails.setDescription(rs.getString("description"));
                    animalDetails.setHealthCondition(rs.getString("healthCondition"));
                    animalDetails.setOrganizationName(rs.getString("organizationName"));
                    animalDetails.setContactInfo(rs.getString("contactInfo"));

                    animalDetailsList.add(animalDetails);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        return animalDetailsList;
    }

    public static void approveAnimal(int animalId) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement("UPDATE adoption_animals SET verify = 1 WHERE registrationNumber = ?")) {

            pstmt.setInt(1, animalId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception or handle it appropriately
        }
    }

    public static void rejectAnimal(int animalId) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement("UPDATE adoption_animals SET verify = 2 WHERE registrationNumber = ?")) {

            pstmt.setInt(1, animalId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
    }

    public static void deleteAnimal(int animalId) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            
            deleteAdopterDetails(animalId, conn);
            try (PreparedStatement pstmt = conn.prepareStatement("DELETE FROM adoption_animals WHERE registrationNumber = ?")) {
                pstmt.setInt(1, animalId);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
    }

    private static void deleteAdopterDetails(int animalId, Connection conn) throws SQLException {
        try (PreparedStatement pstmt = conn.prepareStatement("DELETE FROM adopters_list WHERE animal_id = ?")) {
            pstmt.setInt(1, animalId);
            pstmt.executeUpdate();
        }
    }


    public static List<AnimalDetails> getAllAnimals() {
        List<AnimalDetails> animalDetailsList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM adoption_animals");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                AnimalDetails animalDetails = new AnimalDetails();
                animalDetails.setId(rs.getInt("registrationNumber"));
                animalDetails.setBreed(rs.getString("breed"));
                animalDetails.setAge(rs.getString("age"));
                animalDetails.setGender(rs.getString("gender"));
                animalDetails.setVerify(rs.getInt("verify"));
                animalDetails.setPhotoURL(rs.getString("photoURL"));
                animalDetails.setDescription(rs.getString("description"));
                animalDetails.setHealthCondition(rs.getString("healthCondition"));
                animalDetails.setOrganizationName(rs.getString("organizationName"));
                animalDetails.setContactInfo(rs.getString("contactInfo"));

                animalDetailsList.add(animalDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        return animalDetailsList;
    }

    public static List<AnimalDetails> getAnimalsByType(String animalType) {
        List<AnimalDetails> animalDetailsList = new ArrayList<>();
        String query;

        if (animalType.equals("Dog") || animalType.equals("Cat") || animalType.equals("Rabbit") || animalType.equals("Birds")) {
            query = "SELECT * FROM adoption_animals WHERE animalType = ?";
        } else if (animalType.equals("Approved")) {
            query = "SELECT * FROM adoption_animals WHERE verify = 1";
        } else if (animalType.equals("Rejected")) {
            query = "SELECT * FROM adoption_animals WHERE verify = 2";
        } else if (animalType.equals("Pending")) {
            query = "SELECT * FROM adoption_animals WHERE verify = 0";
        } else if (animalType.equals("Adopted")) {
            query = "SELECT * FROM adoption_animals WHERE verify = 3";
        } else {
            
            return animalDetailsList;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            if (query.contains("?")) {
                preparedStatement.setString(1, animalType);
            }

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    AnimalDetails animalDetails = new AnimalDetails();
                    animalDetails.setId(resultSet.getInt("registrationNumber"));
                    animalDetails.setBreed(resultSet.getString("breed"));
                    animalDetails.setAge(resultSet.getString("age"));
                    animalDetails.setGender(resultSet.getString("gender"));
                    animalDetails.setVerify(resultSet.getInt("verify"));
                    animalDetails.setPhotoURL(resultSet.getString("photoURL"));
                    animalDetails.setDescription(resultSet.getString("description"));
                    animalDetails.setHealthCondition(resultSet.getString("healthCondition"));
                    animalDetails.setOrganizationName(resultSet.getString("organizationName"));
                    animalDetails.setContactInfo(resultSet.getString("contactInfo"));
                    // Set other fields as needed

                    animalDetailsList.add(animalDetails);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }

        return animalDetailsList;
    }
    
    public static void createContactQueriesTable() {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            Statement statement = conn.createStatement();

            
            String createTableSQL = "CREATE TABLE IF NOT EXISTS contact_queries (" +
                    "queryId INT PRIMARY KEY AUTO_INCREMENT," +
                    "userType VARCHAR(255)," +
                    "userName VARCHAR(255)," +
                    "userEmail VARCHAR(255)," +
                    "subject VARCHAR(255)," +
                    "message TEXT," +
                    "timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP" +
                    ")";
            statement.executeUpdate(createTableSQL);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public static void saveContactQuery(String userType, String userName, String userEmail, String subject, String message) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            createContactQueriesTable();  

            try (PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO contact_queries (userType, userName, userEmail, subject, message) VALUES (?, ?, ?, ?, ?)")) {

                pstmt.setString(1, userType);
                pstmt.setString(2, userName);
                pstmt.setString(3, userEmail);
                pstmt.setString(4, subject);
                pstmt.setString(5, message);

                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
    }
}

