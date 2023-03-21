/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Obj.Account;
import Obj.AccountError;
import dao.AccountDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh Huy
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    private static final String ERROR = "errorpage.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        AccountError userError = new AccountError();
        try {
            String email = request.getParameter("email");
            String fullname = request.getParameter("fullname");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            int status = 1;
            int role = 0;
//          UserError userError = new UserError();
            boolean checkValidation = true;
            if (email.length() > 30) {
                userError.setEmail("email must be less than 30 digits");
                checkValidation = false;
            }
            boolean checkDuplicate = AccountDAO.checkAccount(email);
            if (checkDuplicate) {
                userError.setEmail("Duplicate email");
                request.setAttribute("USER_ERROR", userError.getEmail());
                checkValidation = false;
            }
            if (fullname.length() > 30 || fullname.length() < 3) {
                userError.setFullName("User Name must be from 3 to 30 characters");
                request.setAttribute("USER_ERROR", userError.getFullName());
                checkValidation = false;
            }
            if (phone.length() > 12 || phone.length() < 10) {
                userError.setPhone("User Phone must be in from 10 to 12 digits ");
                request.setAttribute("USER_ERROR", userError.getPhone());
                checkValidation = false;
            }
            if (checkValidation) {
//                boolean checkInsert = dao.insert(user);
                boolean checkInsert = AccountDAO.insertAccount(email, password, fullname, phone, status, role);
                if (checkInsert) {
                    url = SUCCESS;
                }
            } else {
            }
        } catch (Exception e) {
            log("Error at CreateController" + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setEmail("Duplicate userID");
                request.setAttribute("USER_ERROR", userError);
            }

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
