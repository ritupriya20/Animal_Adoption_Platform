
package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AnimalDetails {
	private int registrationNumber;
    private String photoURL;
    private String breed;
    private String gender;
    private String age;
    private String description;
    private String healthCondition;
    private String organizationName;
    private String contactInfo;
    private int verify;
    private String animalType;
    
    public int getId() {
    	return registrationNumber;
    }
    
    public void setId(int id) {
    	this.registrationNumber=id;
    }
    public String getanimalType() {
    	return animalType;
    }
    
    public void setanimalType(String animalType) {
    	this.animalType=animalType;
    }
    public String getPhotoURL() {
    	return photoURL;
    }
    public void setPhotoURL(String photoURL) {
    	this.photoURL=photoURL;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHealthCondition() {
        return healthCondition;
    }

    public void setHealthCondition(String healthCondition) {
        this.healthCondition = healthCondition;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public int getVerify() {
        return verify;
    }

    public void setVerify(int verify) {
        this.verify = verify;
    }
    public AdopterDetails getAdopterDetails(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        AdopterDetails adopterDetails = null;

        try {
            
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PetAdoption","root","ritu06");

            
            String query = "SELECT * FROM adopters_list WHERE animal_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,id);  

            rs = pstmt.executeQuery();

            if (rs.next()) {
            
                adopterDetails = new AdopterDetails();
                adopterDetails.setId(rs.getInt("adopter_id"));
                adopterDetails.setAnimalId(rs.getInt("animal_id"));
                adopterDetails.setAnimalType(rs.getString("animalType"));
                adopterDetails.setName(rs.getString("name"));
                adopterDetails.setEmail(rs.getString("email"));
                adopterDetails.setPhone(rs.getString("phone"));
                adopterDetails.setAddress(rs.getString("address"));
                adopterDetails.setReason(rs.getString("reason"));
                adopterDetails.setExperience(rs.getString("experience"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            closeResources(conn, pstmt, rs);
        }

        return adopterDetails;
    }

    private void closeResources(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
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