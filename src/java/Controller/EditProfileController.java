/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.Dao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.User;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author Hp
 */
@MultipartConfig
public class EditProfileController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        Dao u = new Dao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.getRequestDispatcher("editprofile.jsp").forward(request, response);
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
        String action = (String) request.getParameter("action");
        Dao u = new Dao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        switch (action) {
            case "changeavatar":
                String uploadFileFolder = request.getServletContext().getRealPath("/assets/img/upload");
                Path uploadPath = Paths.get(uploadFileFolder);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);

                }

                Part image = request.getPart("avatar");
                String imageFilename = Paths.get(image.getSubmittedFileName()).getFileName().toString();
                image.write(Paths.get(uploadPath.toString(), imageFilename).toString());
                try {
                    Files.deleteIfExists(Paths.get("E:\\LearningSpace\\JavaWeb\\Clone\\g4\\build\\web\\" + user.getAvatar_url()));
                } catch (NoSuchFileException e) {
                    System.out.println("No such file/directory exists");
                } catch (DirectoryNotEmptyException e) {
                    System.out.println("Directory is not empty.");
                } catch (IOException e) {
                    System.out.println("Invalid permissions.");
                }

                u.UpdateAvatarURL(user.getUser_id(), "assets/img/upload/" + imageFilename);

                break;

            case "editpersonalinfo":
                String name = request.getParameter("name");
                String mobile = request.getParameter("mobile");
                if (!mobile.matches("^(84|0[3|5|7|8|9])+([0-9]{8})$")) {
                    request.setAttribute("error", "Please enter a phone number in VN!");
                    doGet(request, response);
                }
                u.UpdatePesonalInfo(user.getUser_id(), name, mobile);
                break;
            default:
                throw new AssertionError();
        }
        user = u.login(user.getEmail(), user.getPassword());
        session.setAttribute("user", user);
        response.sendRedirect("profile");
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
