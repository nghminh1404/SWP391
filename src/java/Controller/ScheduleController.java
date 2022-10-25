/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ClassModel;
import Model.Schedule;
import Model.Schedule;
import Model.User;
import dal.ClassDAO;
import dal.ScheduleDAO;
import dal.ScheduleDAO;
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
public class ScheduleController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        ScheduleDAO cs = new ScheduleDAO();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String curpage = request.getParameter("curpage");
        if (curpage == null) {
            curpage = "1";
        }
        HttpSession session = request.getSession();
        List<Schedule> list = cs.getSchedule();
        int page = (int) list.size() / 10 + (list.size() % 10 == 0 ? 0 : 1);
        session.setAttribute("page", page);
        session.setAttribute("curpage", Integer.parseInt(curpage));
        List<Schedule> listpage1 = cs.getSchedulelist(10, Integer.parseInt(curpage));
        session.setAttribute("schedulelist", listpage1);
//        for (Schedule item : listpage1) {
//            System.out.println(item.getSchedule_id());
//        }
        ClassDAO d = new ClassDAO();
        List<ClassModel> listclass = d.getClasslist();
        session.setAttribute("classlist", listclass);
        request.getRequestDispatcher("Schedule.jsp").forward(request, response);

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
        String classmodel = request.getParameter("classmodel");
        String status = request.getParameter("status");        
//        String fromDate = request.getParameter("fromDate");
//        String toDate = request.getParameter("toDate");
        ScheduleDAO dao = new ScheduleDAO();
        if (status == null) {
            status = "both";
        }
        List<Schedule> list = dao.searchSchedule(classmodel, status);
        request.setAttribute("schedulelist", list);
        request.getRequestDispatcher("Schedule.jsp").forward(request, response);

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
