/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.OrderDAO;
import DAO.ProductDAO;
import Modal.Cart;
import Modal.Item;
import Modal.OrderDetail;
import Modal.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class addCart extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        Cookie[] list = request.getCookies();
        String username = "";
        if (list.length != 0) {
            for (int i = 0; i < list.length; i++) {
                if (list[i].getName().equals("user")) {
                    username = list[i].getValue();
                }
            }
        }
//        Cookie cuser = new Cookie("userAd", name);
        //co roi
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        
        OrderDAO dao = new OrderDAO();
        List<OrderDetail> listOrder = dao.getListOrder(username);
        double total = cart.getTotalMoney();
        String mess = "heleooo";
        List<Item> list1 = cart.getItems();
        session.setAttribute("cart", cart);
        request.setAttribute("total", total);
//        List<OrderDetail> list2 = dao.getOrderDetail("1");
//        request.setAttribute("mes", mess);
        session.setAttribute("size", list1.size());
        request.setAttribute("sizeOrder", listOrder.size());
        request.setAttribute("listOrder", listOrder);
        request.getRequestDispatcher("Cart.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
//        Cookie cuser = new Cookie("userAd", name);
        //co roi
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String quantity = request.getParameter("quantity");
        String tid = request.getParameter("id");
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        int num, id;
        try {
            num = Integer.parseInt(quantity);
            ProductDAO pdb = new ProductDAO();
            Product p = pdb.getProductById(tid);
            double price = p.getPrice();
            Item t = new Item(p, num, color, size, price);
            cart.addItem(t);
        } catch (NumberFormatException e) {
            num = 1;
        }
        double total = cart.getTotalMoney();
        String mess = "heleooo";
        List<Item> list1 = cart.getItems();
        session.setAttribute("cart", cart);
        request.setAttribute("total", total);
//        request.setAttribute("mes", mess);
        session.setAttribute("size", list1.size());
        request.getRequestDispatcher("Cart.jsp").forward(request, response);

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
