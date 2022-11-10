/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Classes;
import Model.Setting;
import Model.Subject;
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
public class ClassAddServlet extends BaseRequiredAuthenticationController {

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
               out.println("<title>Servlet ClassAddServlet</title>");
               out.println("</head>");
               out.println("<body>");
               out.println("<h1>Servlet ClassAddServlet at " + request.getContextPath() + "</h1>");
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
          request.getRequestDispatcher("view/user/ClassAdd.jsp").forward(request, response);

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
          request.setAttribute("supporters", supporter);
          String raw_code = request.getParameter("code");
          String raw_subject = request.getParameter("subject");
          String raw_trainer = request.getParameter("trainers");
          String raw_supporter = request.getParameter("supporters");
          String raw_term = request.getParameter("term");
          String raw_status = request.getParameter("status");
          String raw_des = request.getParameter("description");
          int id = Integer.parseInt(request.getParameter("user"));
          //validate inputs;
          Classes c = new Classes();
          c.setClass_code(raw_code);
          if (Integer.parseInt(raw_status) == 1) {
               c.setStatus(true);
          } else {
               c.setStatus(false);
          }
          Subject s = new Subject();
          s.setSubject_id(Integer.parseInt(raw_subject));
          c.setSubject(s);
          User u1 = new User();
          u1.setUser_id(Integer.parseInt(raw_trainer));
          c.setTrainer_id(u1);
          User u2 = new User();
          u2.setUser_id(Integer.parseInt(raw_supporter));
          c.setTrainer_id(u1);
          c.setSupporter_id(u2);
          Setting st = new Setting();
          st.setSetting_id(Integer.parseInt(raw_term));
          c.setTerm_id(st);
          c.setDescription(raw_des);
          c.setCreated_by(id);        
          ClassDBContext db = new ClassDBContext();
          db.insert(c);
          //option 1
          //response.getWriter().println("inserted successfull!");
          //option 2
          //response.sendRedirect("search");
          //option 3
          request.setAttribute("class", c);
        //  request.setAttribute("action", "created");
        //response.sendRedirect("classlist");
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
