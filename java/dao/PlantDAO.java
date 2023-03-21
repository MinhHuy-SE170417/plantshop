/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Lib.DBUtils;
import Obj.Plant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Minh Huy
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) throws Exception {
        ArrayList<Plant> al = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();

            if (cn != null && searchby != null) {
                String sql = "select PID, PName, price, imgPath, description, status, Plants.CateID as 'CateID', CateName\n"
                        + "from Plants join Categories on Plants.CateID=Categories.CateID";
                if (searchby.equalsIgnoreCase("byname")) {
                    sql = sql + " where Plants.PName like ?";
                } else {
                    sql = sql + " where CateName like ?";
                }

                pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid = rs.getInt("CateID");
                        String category = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgPath, description, status, cateid, category);
                        al.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            throw new Exception("Error retrieving plants: " + e.getMessage(), e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return al;
    }
    
    public static Plant getPlant(int pid){
        Connection cn = null;
        Plant plant = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select PID, PName, price, imgPath, description, status, Plants.cateID as 'CateID',CateName\n"
                        + "from Plants join Categories on Plants.CateID = Categories.CateID\n"
                        + "where PID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, pid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgpath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plant;
    }
}
