/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Department;
import entity.User;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vinhnnpc
 */
public class UserDBContext extends DBContext<User> {

    public ArrayList<User> list() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "    u.ID,\n"
                    + "    u.Name,\n"
                    + "    u.Email,\n"
                    + "    u.Role,\n"
                    + "	d.ID AS DepartmentID,\n"
                    + "    d.Name AS DepartmentName\n"
                    + "FROM \n"
                    + "    [User] u\n"
                    + "LEFT JOIN \n"
                    + "    Department d ON u.Department = d.ID;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                int deptId = rs.getInt("DepartmentID");
                if (!rs.wasNull()) {
                    Department d = new Department();
                    d.setId(deptId);
                    d.setName(rs.getString("DepartmentName"));
                    u.setDepartment(d);
                } else {
                    u.setDepartment(null);
                }

                u.setId(rs.getInt("ID"));
                u.setName(rs.getString("Name"));
                u.setEmail(rs.getString("Email"));
                u.setRole(rs.getString("Role"));
                users.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return users;
    }

    @Override
    public User get(int id) {
        User user = null;
        try {
            String sql = "SELECT u.ID, u.Name, u.Email, u.Password, u.Role, "
                    + "d.ID AS did, d.Name AS dname "
                    + "FROM [User] u LEFT JOIN Department d ON u.Department = d.ID "
                    + "WHERE u.ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("ID"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));

                int deptId = rs.getInt("did");
                if (!rs.wasNull()) {
                    Department d = new Department();
                    d.setId(deptId);
                    d.setName(rs.getString("dname"));
                    user.setDepartment(d);
                } else {
                    user.setDepartment(null);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }

    @Override
    public void insert(User model) {
        try {
            String sql = "INSERT INTO [User] ([Name], [Email], [Password], [Role], [Department]) VALUES (?, ?, ?, ?, NULL)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setString(2, model.getEmail());
            stm.setString(3, model.getPassword());
            stm.setString(4, model.getRole());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void update(User model) {
        try {
            String sql = "UPDATE [User] SET [Name] = ?, [Email] = ?, [Password] = ?, [Role] = ?, [Department] = ? WHERE [ID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setString(2, model.getEmail());
            stm.setString(3, model.getPassword());
            stm.setString(4, model.getRole());
            stm.setInt(5, model.getDepartment().getId());
            stm.setInt(6, model.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [User] WHERE [ID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<User> advancedSearch(String id, String name, String email, String role, String did) {
        ArrayList<User> users = new ArrayList<>();
        try {
            StringBuilder sql = new StringBuilder(
                    "SELECT u.ID, u.Name, u.Email, u.Role, d.ID AS DepartmentID, d.Name AS DepartmentName "
                    + "FROM [User] u LEFT JOIN [Department] d ON u.Department = d.ID WHERE 1=1"
            );
            ArrayList<Object> params = new ArrayList<>();

            if (id != null && !id.trim().isEmpty()) {
                sql.append(" AND CAST(u.ID AS VARCHAR) LIKE ?");
                params.add("%" + id + "%");
            }
            if (name != null && !name.trim().isEmpty()) {
                sql.append(" AND u.Name LIKE ?");
                params.add("%" + name + "%");
            }
            if (email != null && !email.trim().isEmpty()) {
                sql.append(" AND u.Email LIKE ?");
                params.add("%" + email + "%");
            }
            if (role != null && !role.trim().isEmpty()) {
                sql.append(" AND u.Role LIKE ?");
                params.add("%" + role + "%");
            }
            if (did != null && !did.trim().isEmpty()) {
                sql.append(" AND u.Department = ?");
                params.add(Integer.parseInt(did));
            }

            PreparedStatement stm = connection.prepareStatement(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                stm.setObject(i + 1, params.get(i));
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("ID"));
                u.setName(rs.getString("Name"));
                u.setEmail(rs.getString("Email"));
                u.setRole(rs.getString("Role"));

                int deptId = rs.getInt("DepartmentID");
                if (!rs.wasNull()) {
                    Department d = new Department();
                    d.setId(deptId);
                    d.setName(rs.getString("DepartmentName"));
                    u.setDepartment(d);
                }

                users.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean existsUsername(String username) {
        String sql = "SELECT COUNT(*) FROM [User] WHERE Name = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean existsEmail(String email) {
        String sql = "SELECT COUNT(*) FROM [User] WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
