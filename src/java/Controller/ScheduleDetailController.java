/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Schedule;
import dal.ScheduleDAO;
import dal.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

/**
 *
 * @author Hp
 */
public class ScheduleDetailController extends HttpServlet {

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
        String action = request.getParameter("action");
        ScheduleDAO cs = new ScheduleDAO();
        switch (action) {
            case "add":
                request.setAttribute("add", "true");
                break;
            case "update":
                String schedule_id = request.getParameter("sid");
                Schedule cls = cs.getSchedulebyID(Integer.parseInt(schedule_id));
                request.setAttribute("sdetail", cls);
                break;
            case "delete":
                String id = request.getParameter("sid");
                int delete = 0;
                cs.DeleteSchedule(Integer.parseInt(id));
                delete = 1;
                request.setAttribute("delete", delete);
                request.getRequestDispatcher("Schedule.jsp").forward(request, response);
                break;

            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("ScheduleDetail.jsp").forward(request, response);
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
        String slot = request.getParameter("slot");
        String room = request.getParameter("room");
        String date = request.getParameter("date");
        String status = request.getParameter("status");
        String from_time, to_time;
        String action = request.getParameter("action");
        switch (slot) {
            case "1":
                from_time = "07:30";
                to_time = "09:00";
                break;
            case "2":
                from_time = "09:10";
                to_time = "10:40";
                break;
            case "3":
                from_time = "10:50";
                to_time = "12:20";
                break;
            case "4":
                from_time = "12:50";
                to_time = "14:30";
                break;
            case "5":
                from_time = "14:40";
                to_time = "16:00";
                break;
            case "6":
                from_time = "16:10";
                to_time = "17:40";
                break;

            default:
                throw new AssertionError();
        }
        ScheduleDAO dao = new ScheduleDAO();
        switch (action) {
            case "update":
                String id = request.getParameter("sid");
                int update = 0;
                dao.UpdateSchedule(Integer.parseInt(id), Integer.parseInt(slot), Integer.parseInt(room), date, from_time, to_time, status.equalsIgnoreCase("active"));
                update = 1;
                request.setAttribute("update", update);
                doGet(request, response);
                break;
            case "add":
                int insert = 0;
                String class_id = request.getParameter("classmodel");
                dao.insertSchedule(Integer.parseInt(class_id), Integer.parseInt(slot), Integer.parseInt(room), date, from_time, to_time, status.equalsIgnoreCase("active"));
                insert = 1;
                request.setAttribute("insert", insert);
                System.out.println("1");
//                response.sendRedirect("schedule");
                break;

            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("Schedule.jsp").forward(request, response);
        System.out.println("2");
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
