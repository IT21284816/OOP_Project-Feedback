package com.feedback.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.feedback.model.FeedBack;

public class FeedBackDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/feedback?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, address, feedback) VALUES (?, ?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "SELECT id, name, email, address, feedback FROM users WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?;";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET name = ?, email = ?, address = ?, feedback = ? WHERE id = ?;";

    public FeedBackDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUser(FeedBack feedBack) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, feedBack.getName());
            preparedStatement.setString(2, feedBack.getEmail());
            preparedStatement.setString(3, feedBack.getAddress());
            preparedStatement.setString(4, feedBack.getFeedback());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public FeedBack selectUser(int id) {
        FeedBack feedBack = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String feedback = rs.getString("feedback");
                feedBack = new FeedBack(id, name, email, address, feedback);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return feedBack;
    }

    public List<FeedBack> selectAllUsers() {
        List<FeedBack> feedBacks = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String feedback = rs.getString("feedback");
                feedBacks.add(new FeedBack(id, name, email, address, feedback));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return feedBacks;
    }
    
    
    public List<FeedBack> selectAll() {
        List<FeedBack> feedBacks = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String feedback = rs.getString("feedback");
                feedBacks.add(new FeedBack(id, name, email, address, feedback));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return feedBacks;
    }
    

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateUser(FeedBack feedBack) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            System.out.println("Updated User:" + statement);
            statement.setString(1, feedBack.getName());
            statement.setString(2, feedBack.getEmail());
            statement.setString(3, feedBack.getAddress());
            statement.setString(4, feedBack.getFeedback());
            statement.setInt(5, feedBack.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
