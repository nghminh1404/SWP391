package Controller;

import dal.WebContactDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.WebContact;

/**
 *
 * @author SMILY
 */
public class WebContactDetailController extends HttpServlet {

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
            out.println("<title>Servlet WebContactDetailController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WebContactDetailController at " + request.getContextPath() + "</h1>");
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
        WebContactDAO wcdao = new WebContactDAO();
        int contact_id = Integer.parseInt(request.getParameter("contact_id"));
        WebContact wc = wcdao.getContact(contact_id);
        request.setAttribute("wc", wc);
        request.getRequestDispatcher("web_contact_detail.jsp").forward(request, response);
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
        WebContactDAO wcdao = new WebContactDAO();
        int contact_id = Integer.parseInt(request.getParameter("contact_id"));
        String responses = request.getParameter("response");
        wcdao.updateWebContact(1, responses, contact_id);
//        doGet(request, response);
        try ( PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Web Contact</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script>");
                out.println("alert('Response Successfully!!!')");
                out.println("window.location='./web_contact'");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
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
