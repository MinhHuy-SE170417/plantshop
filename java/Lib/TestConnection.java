/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Lib;

import Obj.Account;
import dao.AccountDAO;
import java.sql.Connection;
import java.util.ArrayList;

/**
 *
 * @author Minh Huy
 */
public class TestConnection {
    public static void main(String[] args) throws Exception {
        Connection cn = DBUtils.makeConnection();
        
        try{
            if(cn!=null){
                ArrayList<Account> al = AccountDAO.getAccounts();
                for(Account acc:al){
                    if(acc!=null){
                        System.out.println(acc.getAccid()+" "+acc.getEmail()+" "+acc.getPassword()+" "+acc.getFullName()+" "+acc.getPhone()+" "+acc.getStatus()+" "+acc.getRole());
                    }
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        
    }
}
