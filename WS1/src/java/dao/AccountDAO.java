/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Lib.DBUtils;
import Obj.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Minh Huy
 */
public class AccountDAO {

    public static ArrayList<Account> getAccounts() throws Exception {
        Connection cn = DBUtils.makeConnection();
        Account acc = null;
        ArrayList<Account> al = new ArrayList<Account>();
        try {
            String sql = "select accID, email, password, fullname, phone, status, role\n"
                    + "from Accounts";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int accID = rs.getInt("accID");
                    String email = rs.getString("email");
                    String pwd = rs.getString("password");
                    String fullName = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    acc = new Account(email, accID, pwd, fullName, phone, status, role);
                    al.add(acc);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }

    public static ArrayList<Account> getAccounts(String keyword) {
        ArrayList<Account> list = new ArrayList<>();
        Account acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID, email, password, fullname, phone, status, role\n"
                        + "from dbo.Accounts\n"
                        + "where fullname like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int AccID = rs.getInt("accID");
                        String Email = rs.getString("email");
                        String Password = rs.getString("password");
                        String Fullname = rs.getString("fullname");
                        String Phone = rs.getString("phone");
                        int Status = rs.getInt("status");
                        int Role = rs.getInt("role");
                        acc = new Account(Email, AccID, Password, Fullname, Phone, Status, Role);
                        list.add(acc);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    public static Account getAccount(String email, String password) throws Exception {
        Account acc = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID, email, password, fullname, phone, status, role\n"
                        + "from Accounts\n"
                        + "where email=? and password=? COLLATE Latin1_General_CS_AI";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int accID = rs.getInt("accID");
                        String em = rs.getString("email");
                        String pwd = rs.getString("password");
                        String fullName = rs.getString("fullname");
                        String phone = rs.getString("phone");
                        int status = rs.getInt("status");
                        int role = rs.getInt("role");
                        acc = new Account(em, accID, pwd, fullName, phone, status, role);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }

    public static Account getAccount(String token) throws Exception {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID, email, password, fullname, phone, status, role, token\n"
                        + "from Account\n"
                        + "where token = ? COLLATE Latin1_General_CS_AI";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int accID = rs.getInt("accID");
                    String em = rs.getString("email");
                    String pwd = rs.getString("password");
                    String fullName = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    acc = new Account(em, accID, pwd, fullName, phone, status, role);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

    public static boolean insertAccount(String email, String password, String fullname, String phone, int status, int role) throws Exception {
        Connection cn = null;
        PreparedStatement pst = null;
        boolean checkInsert = false;
        try {
            String sql = "insert into Accounts(email, password, fullname, phone, status, role)"
                    + " values(?, ?, ?, ?, ?, ?)";
            cn = DBUtils.makeConnection();
            pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setString(3, fullname);
            pst.setString(4, phone);
            pst.setInt(5, status);
            pst.setInt(6, role);
            checkInsert = pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return checkInsert;
    }

    public static boolean checkAccount(String email) throws Exception {
        Connection cn = null;
        boolean isAvailable = false;
        try {
            String sql = "select email from Accounts "
                    + "where email = ?";
            cn = DBUtils.makeConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            rs = pst.executeQuery();
            if (rs.next()) {
                isAvailable = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isAvailable;
    }

    public static void updateToken(String token, String email) throws SQLException {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Accounts\n"
                        + "set token=?\n"
                        + "where email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                pst.setString(2, email);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateAccountStatus(String email, int i) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "update Accounts \n"
                    + "set status=?\n"
                    + "where email=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, i);
            pst.setString(2, email);
            pst.executeUpdate();
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void UpdateProfile(Account acc) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "update Accounts \n"
                    + "set fullname=?, phone=?\n"
                    + "where email=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, acc.getFullName());
            pst.setString(2, acc.getPhone());
            pst.setString(3, acc.getEmail());
            pst.executeUpdate();
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Account getAccount2(String email) throws Exception {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID, email, password, fullname, phone, status, role, token\n"
                        + "from Accounts\n"
                        + "where email = ? COLLATE Latin1_General_CS_AI";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int accID = rs.getInt("accID");
                    String em = rs.getString("email");
                    String pwd = rs.getString("password");
                    String fullName = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    acc = new Account(em, accID, pwd, fullName, phone, status, role);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

}
