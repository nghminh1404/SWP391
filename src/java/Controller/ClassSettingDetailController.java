/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ClassSetting;
import dal.ClassSettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Hp
 */
@WebServlet(name = "ClassSettingDetailController", urlPatterns = {"/classsettingdetail"})
public class ClassSettingDetailController extends HttpServlet {

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
        String action = request.getParameter("action");
        ClassSettingDAO cs = new ClassSettingDAO();
        switch (action) {
            case "add":
                request.setAttribute("add", "true");
                break;
            case "update":
                String setting_id = request.getParameter("csid");
                ClassSetting cls = cs.getSettingbyid(setting_id);
                request.setAttribute("csdetail", cls);

                break;
            case "delete":
                String id = request.getParameter("csid");
                int delete = 0;
                cs.DeleteClassSetting(Integer.parseInt(id));
                delete = 1;
                request.setAttribute("delete", delete);
                request.getRequestDispatcher("classsetting").forward(request, response);
                break;

            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("ClassSettingDetail.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        String type = request.getParameter("type");
        String title = request.getParameter("title");
        String value = request.getParameter("value");
        String order = request.getParameter("order");
        String status = request.getParameter("status");
        boolean stt = false;
        if (status.equalsIgnoreCase("active")) {
            stt = true;
        }
        String description = request.getParameter("description");
        String classmodel = request.getParameter("classmodel");
        ClassSettingDAO cs = new ClassSettingDAO();
        switch (action) {
            case "update":
                String id = request.getParameter("csid");
                int update = 0;
                cs.UpdateClassSetting(Integer.parseInt(id), Integer.parseInt(type), title, value, order, stt, description, Integer.parseInt(classmodel));
                update = 1;
                request.setAttribute("update", update);

                break;
            case "add":
                int insert = 0;
                cs.InsertClassSetting(Integer.parseInt(type), title, value, order, stt, description, Integer.parseInt(classmodel));
                insert = 1;
                request.setAttribute("insert", insert);
                request.getRequestDispatcher("classsetting").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
        doGet(request, response);

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
