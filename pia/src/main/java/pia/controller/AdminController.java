package pia.controller;
 
// import java.io.*;
// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.*;
 
// @WebServlet(urlPatterns={"/hello"})
// public class HelloWorld extends HttpServlet {
//     @Override
//     protected void doGet(HttpServletRequest req, HttpServletResponse resp)
//                         throws ServletException, IOException {
//         String user = req.getParameter("user"); // 取得請求參數
//         req.setAttribute("user", user);         // 設定請求屬性
//         req.getRequestDispatcher("hello.jsp").forward(req, resp); // 轉發至 JSP
//     }
// }

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pia.model.*;
 
@Controller
public class AdminController {
    @RequestMapping("hello")
    public String hello(@RequestParam("user") String user, Model m) {
        m.addAttribute("user", user);

        try{
            DB_base.init_db();
        }
        catch(Exception e){
            return "hello1";
        }
        return "hello";
    }

    @RequestMapping("admin")
    public String view(Model m) {
        return "/WEB-INF/view/admin/master";
    }
}
