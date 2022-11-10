/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Classes;
import Model.User;
import dal.ClassDBContext;
import dal.SettingDBContext;
import dal.SubjectDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class ClassListServelet extends BaseRequiredAuthenticationController {

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
               out.println("<title>Servlet ClassListServelet</title>");
               out.println("</head>");
               out.println("<body>");
               out.println("<h1>Servlet ClassListServelet at " + request.getContextPath() + "</h1>");
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
     protected void processGet(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
          SettingDBContext dbSett = new SettingDBContext();
          UserDBContext dbUser = new UserDBContext();
          ArrayList<User> trainer = dbUser.getTrainer();
          request.setAttribute("trainers", trainer);
          SubjectDBContext dbSub = new SubjectDBContext();
          request.setAttribute("settings", dbSett.listTerm());
          request.setAttribute("subjects", dbSub.list());
          UserDBContext dbSUser = new UserDBContext();
          ArrayList<User> supporter = dbSUser.getSupporter();
          request.setAttribute("supporters", supporter);
          ClassDBContext cdb = new ClassDBContext();
          ArrayList<Classes> classes = cdb.list();
          request.setAttribute("classes", classes);
          request.getRequestDispatcher("view/user/ClassList.jsp").forward(request, response);
     }

     /**
      * Handles the HTTP <code>POST</code> method.
      *
      * @param request servlet request
      * @param response servlet response
      * @throws ServletException if a servlet-specific error occurs
      * @throws IOException if an I/O error occurs
      */
     protected void processPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {

          String raw_status = request.getParameter("statusupdate");
          String raw_userid = request.getParameter("user");
          String raw_id = request.getParameter("class_id");
          //validate inputs;
          
          Classes c = new Classes();
          if (Integer.parseInt(raw_status) == 1) {
               c.setStatus(true);
          } else {
               c.setStatus(false);
          }
          c.setModified_by(Integer.parseInt(raw_userid));
          c.setClass_id(Integer.parseInt(raw_id));
          ClassDBContext db = new ClassDBContext();
          db.updateStatus(c);
          
          //option 1
          //response.getWriter().println("inserted successfull!");
          //option 2
          //response.sendRedirect("search");
          //option 3
          request.setAttribute("class", c);
          SettingDBContext dbSett = new SettingDBContext();
          UserDBContext dbUser = new UserDBContext();
          ArrayList<User> trainer = dbUser.getTrainer();
          request.setAttribute("trainers", trainer);
          SubjectDBContext dbSub = new SubjectDBContext();
          request.setAttribute("settings", dbSett.listTerm());
          request.setAttribute("subjects", dbSub.list());
          UserDBContext dbSUser = new UserDBContext();
          ArrayList<User> supporter = dbSUser.getSupporter();
          request.setAttribute("supporters", supporter);
          ClassDBContext cdb = new ClassDBContext();
          ArrayList<Classes> classes = cdb.list();
          request.setAttribute("classes", classes);
          request.getRequestDispatcher("view/user/ClassList.jsp").forward(request, response);
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
