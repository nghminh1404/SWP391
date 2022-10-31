/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Team;
import dal.TeamDAO;
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
@WebServlet(name = "TeamDetailController", urlPatterns = {"/teamdetail"})
public class TeamDetailController extends HttpServlet {

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
        TeamDAO cs = new TeamDAO();
        switch (action) {
            case "add":
                request.setAttribute("add", "true");
                break;
            case "update":
                String team_id = request.getParameter("sid");
                Team cls = cs.getTeambyid(team_id);
                request.setAttribute("teamdetail", cls);

                break;
            case "delete":
                String id = request.getParameter("sid");
                int delete = 0;
                cs.DeleteTeam(Integer.parseInt(id));
                delete = 1;
                request.setAttribute("delete", delete);
                request.getRequestDispatcher("team").forward(request, response);
                break;
            case "clone":
                String team_id2 = request.getParameter("sid");
                int idcl = cs.cloneByID(Integer.parseInt(team_id2));                
                request.getRequestDispatcher("teamdetail?action=update&&sid="+idcl).forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("TeamDetail.jsp").forward(request, response);
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
        String classmodel = request.getParameter("classmodel");
        String code = request.getParameter("code");
        String topic = request.getParameter("topic");
        String status = request.getParameter("status");
        boolean stt = false;
        if (status.equalsIgnoreCase("active")) {
            stt = true;
        }
        String description = request.getParameter("description");
        TeamDAO cs = new TeamDAO();
        switch (action) {
            case "update":
                String id = request.getParameter("sid");
                int update = 0;
                cs.UpdateTeam(Integer.parseInt(id), code, topic, stt, description);
                update = 1;
                request.setAttribute("update", update);
                request.getRequestDispatcher("TeamDetail.jsp").forward(request, response);
                break;
            case "add":
                int insert = 0;
                cs.InsertTeam(Integer.parseInt(classmodel), code, topic, stt, description);
                insert = 1;
                request.setAttribute("insert", insert);
                request.getRequestDispatcher("Team.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }        

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
