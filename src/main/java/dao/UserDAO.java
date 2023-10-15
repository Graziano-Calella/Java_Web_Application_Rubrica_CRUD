package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/db_web_crud?useSSL=false";
	private static final String USER = "root";
	private static final String PASS = "root";
	
	private static final String INSERT_USER_SQL = "INSERT INTO users (name, email, country) VALUES (?,?,?)";
	private static final String SELECT_ALL_USERS = "select * from users";
	private static final String SELECT_USER_BY_ID = "select * from users where id = ?";
	private static final String DELETE_USER_SQL = "delete from users where id = ?";
	private static final String UPDATE_USER_SQL = "update users set name = ?, email = ?, country = ? where id = ?";

	protected Connection getConnection(){
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USER, PASS);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	public void insertUser(User user) throws SQLException {
		try (Connection connection = getConnection();
			 PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL);	
		){
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getCountry());
			preparedStatement.executeUpdate();
					
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean updateUser(User user) throws SQLException {
		boolean rowUpdate = false;
		
		try (Connection connection = getConnection();
			 PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_SQL);	
		){
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getCountry());
			preparedStatement.setInt(4, user.getId());
			
			rowUpdate = preparedStatement.executeUpdate() > 0;
		}
		
		return rowUpdate;
	}
	
	public boolean deleteUser(int id) throws SQLException {
		boolean rowDelete = false;
		
		try (Connection connection = getConnection();
			 PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_SQL);	
		){
			preparedStatement.setInt(1, id);
			
			rowDelete = preparedStatement.executeUpdate() > 0;
			
		} 
		
		return rowDelete;
	}
	
	public User selectUser(int id) {
		User user = null;
		
		try (Connection connection = getConnection();
			 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);	
		){
			preparedStatement.setInt(1, id);
			
			ResultSet rs = preparedStatement.executeQuery();
		
			while(rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				user = new User(id, name, email, country);
			}
		
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public List<User> selectAllUser() {
		List<User> users = new ArrayList<>();
		
		try (Connection connection = getConnection();
			 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);	
		){
		
			ResultSet rs = preparedStatement.executeQuery();
		
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				users.add(new User(id, name, email, country));
			}
		
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
	}
	
}

