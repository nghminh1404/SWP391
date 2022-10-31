/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ClassModel;
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
        TeamMemberDAO dao = new TeamMemberDAO();
        TeamDAO tdao = new TeamDAO();
        Team t = tdao.getTeambyid(team_id);
        HttpSession session = request.getSession();
        session.setAttribute("team", t);
        List<Team_member> list = dao.getTeam_memberByTeamID(Integer.parseInt(team_id));
        for (Team_member item : list) {
            System.out.println(item.getUser().getFull_name());
        }
        session.setAttribute("member", list);
        request.getRequestDispatcher("Team_member.jsp").forward(request, response);

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
        String name = request.getParameter("team");
//        String fromDate = request.getParameter("fromDate");
//        String toDate = request.getParameter("toDate");
        TeamDAO dao = new TeamDAO();
        if (status == null) {
            status = "both";
        }
        HttpSession session = request.getSession();
        String curpage = request.getParameter("curpage");
        if (curpage == null) {
            curpage = "1";
        }
        List<Team> list = dao.searchTeam(classmodel, status, name);
        int page = (int) list.size() / 10 + (list.size() % 10 == 0 ? 0 : 1);
        session.setAttribute("page", page);
        session.setAttribute("curpage", Integer.parseInt(curpage));
        List<Team> listpage1 = dao.searchTeamLimit(classmodel, status, name, Integer.parseInt(curpage));
        session.setAttribute("teamlist", listpage1);
        request.getRequestDispatcher("Team.jsp").forward(request, response);

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
