/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import Obj.Account;
import dao.AccountDAO;

/**
 *
 * @author Minh Huy
 */
public class testConnection {
    public static void main(String[] args) throws Exception {
        Account acc = AccountDAO.getAccount("admin", "12345");
        if(acc!=null){
            if(acc.getRole()==1){
                System.out.println("Hello admin");
            }
            else System.out.println("Hello user");
        }
    }
}
