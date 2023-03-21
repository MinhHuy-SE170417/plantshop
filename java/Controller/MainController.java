/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh Huy
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String url = null;
            switch (action) {
                case "search":
                    url = "SearchServlet";
                    break;
                case "login":
                    url = "LoginServlet";
                    break;
                case "Register":
                    url = "RegisterServlet";
                    break;
                case "logout":
                    url = "LogOutServlet";
                    break;
                case "addtocart":
                    url = "AddToCartServlet";
                    break;
                case "viewcart":
                    url = "viewcart.jsp";
                    break;
                case "update":
                    url = "UpdateCartServlet";
                    break;
                case "delete":
                    url = "DeleteCartServlet";
                    break;
                case "updateStatusAccount":
                    url = "UpdateAccountStatus";
                    break;
                case "saveorder":
                    url = "SaveShoppingCartServlet";
                    break;
                case "manageAccounts":
                    url = "ManageAccountServlet";
                    break;
                case "UpdateAccountStatus":
                    url = "UpdateAccountServlet";
                    break;
                case "orderagain":
                    url = "OrderAgainServlet";
                    break;
                case "Update":
                    url = "UpdateProfileServlet";
                    break;
            }
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
