/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

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

/**
 *
 * @author PC
 */
public class ClassFilter extends HttpServlet {

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
          String raw_setting_id = request.getParameter("setting_id");
          String raw_subject_id = request.getParameter("subject_id");
          String raw_trainer_id = request.getParameter("trainer_id");
          String raw_supporter_id = request.getParameter("supporter_id");
          String raw_status = request.getParameter("status");

          //validate
          Integer setting_id = (raw_setting_id != null && raw_setting_id.length() > 0
                  && !raw_setting_id.equals("-1")) ? new Integer(raw_setting_id) : null;
          Integer subject_id = (raw_subject_id != null && raw_subject_id.length() > 0
                  && !raw_subject_id.equals("-1")) ? new Integer(raw_subject_id) : null;
          Integer trainer_id = (raw_trainer_id != null && raw_trainer_id.length() > 0
                  && !raw_trainer_id.equals("-1")) ? new Integer(raw_trainer_id) : null;
          Integer supporter_id = (raw_supporter_id != null && raw_supporter_id.length() > 0
                  && !raw_supporter_id.equals("-1")) ? new Integer(raw_supporter_id) : null;
          Boolean status = (raw_status != null && raw_status.length() > 0 && !raw_status.equals("both"))
                  ? raw_status.equals("activate") : null;
          SettingDBContext dbSett = new SettingDBContext();
          UserDBContext dbUser = new UserDBContext();
          SubjectDBContext dbSub = new SubjectDBContext();
          ClassDBContext dbClass = new ClassDBContext();
          request.setAttribute("settings", dbSett.listTerm());
          request.setAttribute("subjects", dbSub.list());
          request.setAttribute("trainers", dbUser.getTrainer());
          request.setAttribute("supporters", dbUser.getSupporter());
          request.setAttribute("classes", dbClass.filter(subject_id, setting_id, trainer_id, supporter_id, status));
          request.getRequestDispatcher("view/user/ClassList.jsp").forward(request, response);
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
          processRequest(request, response);
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
          processRequest(request, response);
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
