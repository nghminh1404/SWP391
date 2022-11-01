/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Team;
import Model.Team_member;
import Model.User;
import dal.ClassDAO;
import dal.TeamDAO;
import dal.TeamMemberDAO;
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
public class TeamMemberController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TeamController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TeamController at " + request.getContextPath() + "</h1>");
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
        String team_id = request.getParameter("tid");
        String action = request.getParameter("action");
        TeamMemberDAO dao = new TeamMemberDAO();
        TeamDAO tdao = new TeamDAO();
        if (action == null) {
            action = "view";
        }
        if (action.equals("delete")) {
            String mid = request.getParameter("mid");
            dao.DeleteTeam_member(Integer.parseInt(mid));
        }
        Team t = tdao.getTeambyid(team_id);
        HttpSession session = request.getSession();
        session.setAttribute("team", t);
        List<Team_member> list = dao.getTeam_memberByTeamID(Integer.parseInt(team_id));
        request.setAttribute("leader", "0");
        for (Team_member item : list) {
            if (item.isIs_leader()) {
                System.out.println("1");
                request.setAttribute("leader", "1");
                break;
            }
        }
        List<User> listuser = tdao.getUserByTeamID(Integer.parseInt(team_id));
        session.setAttribute("member", list);
        session.setAttribute("userlist", listuser);
        request.getRequestDispatcher("TeamMember.jsp").forward(request, response);

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
        String team_id = request.getParameter("tid");
        String user = request.getParameter("member");
        if (user.equals("0")) {
            doGet(request, response);
        }
        String role = request.getParameter("role");
        TeamMemberDAO dao = new TeamMemberDAO();
        if (role.equals("leader")) {
            dao.InsertTeam_member(Integer.parseInt(team_id), Integer.parseInt(user), true, true);
        } else {
            dao.InsertTeam_member(Integer.parseInt(team_id), Integer.parseInt(user), false, true);
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
