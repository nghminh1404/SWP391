package Controller;

import dal.WebContactDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.WebContact;

/**
 *
 * @author SMILY
 */
public class WebContactController extends HttpServlet {

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
            out.println("<title>Servlet WebContactController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WebContactController at " + request.getContextPath() + "</h1>");
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
        if (request.getParameter("contact_id") != null) {
            int contact_id = Integer.parseInt(request.getParameter("contact_id"));
            int status = Integer.parseInt(request.getParameter("del"));
            if (status == 1) {
                wcdao.deleteWebContact(contact_id);
            }
        }
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        
        int end_page = wcdao.getAmount()%10==0 ? wcdao.getAmount()/10 : wcdao.getAmount()/10+1;
        request.setAttribute("end_page", end_page);
        if (page <= end_page) {
            List<WebContact> contactList = wcdao.getAll(10 , (page-1) * 10);
            request.setAttribute("contactList", contactList);
            request.setAttribute("page", page);
        } else {
            List<WebContact> contactList = wcdao.getAll(10 , 0);
            request.setAttribute("contactList", contactList);
            request.setAttribute("page", 1);
        }
        
        request.getRequestDispatcher("/web_contact.jsp").forward(request, response);
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
