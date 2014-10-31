package pia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.*;
import java.security.*;
import java.sql.*;


import pia.model.*;
import pia.json.*;

@Controller
public class MainController {
    @RequestMapping("/")
    public String index(HttpSession s,Model m) {
        String ua = (String) s.getAttribute("UA");
        if (ua != null) {
            return "redirect:admin";
        }

        Object message = s.getAttribute("message");
        if(message != null){
          m.addAttribute("message", message);
          s.removeAttribute("message");
        }
        return "/WEB-INF/view/main/index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String index(@RequestParam("user") String post_acc,@RequestParam("pwd") String post_pwd,HttpSession s,Model m) {

        try {
            PreparedStatement pstmt =
                DbInit.getStatement("select * from person where `p_mail` = ?");
            pstmt.setString(1, post_acc);
            ResultSet rs = pstmt.executeQuery();

            //if we have a user of that name in db
            if(rs.next()){

                // =========================
                // pwd hash process...
                // =========================

                //compare password
                // Create MD5 Hash
                MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
                digest.update(post_pwd.getBytes());
                byte messageDigest[] = digest.digest();

                // Create Hex String
                StringBuffer hexString = new StringBuffer();
                for (int i=0; i<messageDigest.length; i++)
                    hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
                post_pwd = hexString.toString();


                if(rs.getString("p_pass").equals(post_pwd)){
                    s.setAttribute("UA", rs.getString("p_id") );
                    s.setAttribute("message", "登入成功！" );

                    // =========================
                    // How to distinguish between normal user and admin?
                    // create new cookie storing that infomation
                    // =========================

                    return "redirect:admin";
                }
                else{
                    m.addAttribute("message", "帳號或密-碼錯誤！");
                    return "/WEB-INF/view/main/index";
                }
            }
            else{   //no matching account
                m.addAttribute("message", "帳-號或密碼錯誤！");
                return "/WEB-INF/view/main/index";
            }
        } catch (Exception e) {
            m.addAttribute("message", "GG錯誤:" + e.getMessage());
        }

        return "/WEB-INF/view/main/index";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession s,Model m) {
        s.removeAttribute("UA");
        s.setAttribute("message", "已登出！" );
      return "redirect:/";
    }

    // ---------------------- testing ------------------

    @RequestMapping("hello")
    public String hello(@RequestParam("user") String user, Model m) {

        // things passed to the view
        m.addAttribute("user", user);

        try{
            DbInit.getConnection();
        }
        catch(Exception e){
            m.addAttribute("user", "So bad...");
        }
        return "hello";
    }

    //all
    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    public String models(
        Model m,
        @PathVariable("name") String name) {
        // if(name.equals("Person"))
        //     return "/WEB-INF/person/all";
        m.addAttribute("cname",name);
        return "/WEB-INF/general/all";
    }
    //show
    @RequestMapping(value = "/{className}/{id}", method = RequestMethod.GET)
    public String model_show(
        Model m,
        @PathVariable("className") String className,
        @PathVariable("id") String id) {
        m.addAttribute("ctrl","/{className}/{id}#GET-show");
        m.addAttribute("id",id);
        m.addAttribute("cname",className);
        return "/WEB-INF/general/edit";
    }
    //create
    @RequestMapping(value = "/TestModel/new", method = RequestMethod.POST)
    public String model_new(Model m) {
        m.addAttribute("ctrl","/TestModel/new#POST-create");
        m.addAttribute("id","new");
        return "/WEB-INF/testModel/_update";
    }
    //update
    @RequestMapping(value = "/TestModel/{id}", method = RequestMethod.POST)
    public String model_update(Model m,@PathVariable("id") String id) {
        m.addAttribute("ctrl","/TestModel/{id}#POST-update");
        m.addAttribute("id",id);
        return "/WEB-INF/testModel/_update";
    }
    //delete
    //to be generalize
    @RequestMapping(value = "/models/delete/{id}", method = RequestMethod.GET)
    public String model_delete(Model m,@PathVariable("id") String id) {
        m.addAttribute("ctrl","/models/delete/{id}#GET-delete");
        //m.addAttribute("id",id);
        try{new TestModel().delete(id);}catch(Exception e){}
        m.addAttribute("cname","TestModel");
        return "/WEB-INF/general/all";
    }
}
