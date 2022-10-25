/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.ClassModel;
import Model.ClassSetting;
import Model.User;
import dal.ClassDAO;
import dal.ClassSettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Hp
 */
public class ClassSettingController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ClassSettingController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassSettingController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ClassSettingDAO cs = new ClassSettingDAO();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String curpage = request.getParameter("curpage");
        if (curpage == null) {
            curpage = "1";
        }
        HttpSession session = request.getSession();        
        List<ClassSetting> list = cs.getClassSetting();
        int page = (int) list.size() / 10 + (list.size() % 10 == 0 ? 0 : 1);
        session.setAttribute("page", page);
        session.setAttribute("curpage", Integer.parseInt(curpage));               
        User user = (User)session.getAttribute("user");
        List<ClassSetting> listpage1 = cs.getClassSettinglistByUserID(user.getUser_id(), 10, Integer.parseInt(curpage));                
        session.setAttribute("classsettinglist", listpage1);
//        for (ClassSetting item : listpage1) {
//            System.out.println(item.getClassSetting_id());
//        }
        ClassDAO d = new ClassDAO();
        List<ClassModel> listclass = d.getClasslist();
        session.setAttribute("classlist", listclass);
        request.getRequestDispatcher("ClassSetting.jsp").forward(request, response);

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
