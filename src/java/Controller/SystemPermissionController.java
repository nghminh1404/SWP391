package Controller;

import Model.SystemPermission;
import dal.SystemPermissionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author SMILY
 */
public class SystemPermissionController extends HttpServlet {

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
            out.println("<title>Servlet SystemPermissionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SystemPermissionController at " + request.getContextPath() + "</h1>");
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
        SystemPermissionDAO spdao = new SystemPermissionDAO();
        int page = 1;
        int role_id = 0;
        int screen_id = 0;
        if (request.getParameter("role") != null) {
            role_id = Integer.parseInt(request.getParameter("role"));
        }
        if (request.getParameter("screen") != null) {
            screen_id = Integer.parseInt(request.getParameter("screen"));
        }
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        int end_page = spdao.getAmount() % 10 == 0 ? spdao.getAmount() / 10 : spdao.getAmount() / 10 + 1;
        request.setAttribute("end_page", end_page);
        if (page <= end_page) {
            List<SystemPermission> permissionList = spdao.getAll(10, (page - 1) * 10, role_id, screen_id);
            request.setAttribute("permissionList", permissionList);
            request.setAttribute("page", page);
        } else {
            List<SystemPermission> permissionList = spdao.getAll(10, 0, role_id, screen_id);
            request.setAttribute("permissionList", permissionList);
            request.setAttribute("page", 1);
        }
        request.setAttribute("roles", spdao.getRoles());
        request.setAttribute("screens", spdao.getScreens());
        request.getRequestDispatcher("systempermission.jsp").forward(request, response);
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
        SystemPermissionDAO spdao = new SystemPermissionDAO();
        if (request.getParameter("screen_id") != null) {
            int screen_id = Integer.parseInt(request.getParameter("screen_id"));
            int setting_id = Integer.parseInt(request.getParameter("setting_id"));
            String col = request.getParameter("col");
            int value = Integer.parseInt(request.getParameter(col));

            if (value == 0) {
                spdao.updatePermission(screen_id, setting_id, col, 1);
            } else {
                spdao.updatePermission(screen_id, setting_id, col, 0);
            }
        }
        
        int role = 0;
        int screen = 0;
        if (request.getParameter("role") != null) {
            role = Integer.parseInt(request.getParameter("role"));
        }

        if (request.getParameter("screen") != null) {
            screen = Integer.parseInt(request.getParameter("screen"));
        }
        
        request.setAttribute("role", role);
        request.setAttribute("screen", screen);

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
