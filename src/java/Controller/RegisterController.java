package Controller;

import dal.RegisterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
<<<<<<< .merge_file_a04424
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
=======
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
>>>>>>> .merge_file_a10644
import Model.User;

/**
 *
 * @author dan2k
 */
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
<<<<<<< .merge_file_a04424
        request.getRequestDispatcher("register.jsp").forward(request, response);
=======
        request.getRequestDispatcher("/register.jsp").forward(request, response);
>>>>>>> .merge_file_a10644
    }

    private String getRandom() {
        Random rand = new Random();
        int n = rand.nextInt(900000) + 100000;
        return String.format("%6d", n);
    }

    private Message prepareMessage(Session session, String fromEmail, String recepient, String code) throws MessagingException {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("Veification of Register from Training Support System!");
            message.setText("You have already registered from Training Support System!\n" + "Your code is: " + code);
            return message;
        } catch (AddressException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
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
        request.setCharacterEncoding("UTF-8");
        RegisterDAO rdao = new RegisterDAO();
        List<User> userList = rdao.getAll();
        String email = request.getParameter("email");
        boolean checkEmailExist = false;
        for (User user : userList) {
            if (user.getEmail().equals(email)) {
                checkEmailExist = true;
                break;
            }
        }
        if (checkEmailExist) {
            request.setAttribute("email", email);
            doGet(request, response);
            return;
        }
        String full_name = request.getParameter("full_name");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        
        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.setProperty("mail.smtp.host", "smtp-mail.outlook.com");
            pr.setProperty("mail.smtp.port", "587");

            String fromEmail = "dannthe160853@outlook.com.vn";
            String passEmail = "Thuadanvan123";

            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, passEmail);
                }

            });
            String authcode = getRandom();
            Message message = prepareMessage(session, fromEmail, email, authcode);

            Transport.send(message);
            request.setAttribute("authcode", authcode);
            request.setAttribute("email", email);
            request.setAttribute("full_name", full_name);
            request.setAttribute("mobile", mobile);
            request.setAttribute("password", password);
            request.setAttribute("confirm_password", confirm_password);
            request.getRequestDispatcher("verify.jsp").forward(request, response);
        } catch (Exception e) {
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
