package pia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.*;
import java.security.*;

import pia.model.*;
import pia.json.*;

@Controller
public class AdminController {

    @RequestMapping("admin")
    public String view(HttpSession s,Model m) {

        Object message = s.getAttribute("message");
        if(message != null){
          m.addAttribute("message", message);
          s.removeAttribute("message");
        }

        if(s.getAttribute("UA") == null){
          return "redirect:logout";
        }

        return "/WEB-INF/view/admin/master";
    }

    // Person Resources ====================

    @RequestMapping(value = "/admin/person", method = RequestMethod.GET)
    public @ResponseBody AjaxResult getAllPerson(
        HttpSession s,
        Model m) {
        AjaxResult r = new AjaxResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            r.setData(Person.getAll());
            r.success();
        }catch(Exception e){
            r.fail();
            r.setMsg((String)e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/person/{id}", method = RequestMethod.GET)
    public @ResponseBody AjaxResult getAPerson(
        @PathVariable("id") String id,
        HttpSession s,
        Model m) {
        AjaxResult r = new AjaxResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            r.setDataFromPerson(new Person(id));
            r.success();
        }catch(Exception e){
            r.fail();
            r.setMsg(e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/person/", method = RequestMethod.POST)
    public @ResponseBody AjaxResult createPerson(
        @RequestParam("org_id") String org_id,
        @RequestParam("dept_id") String dept_id,
        @RequestParam("p_id") String p_id,
        @RequestParam("p_name") String p_name,
        @RequestParam("p_phone") String p_phone,
        @RequestParam("p_mail") String p_mail,
        @RequestParam("p_title") String p_title,
        @RequestParam("p_pass") String p_pass,
        HttpSession s,
        Model m) {

        AjaxResult r = new AjaxResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            // =========================
            // pwd hash process...
            // =========================

            //compare password
            // Create MD5 Hash
            MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
            digest.update(p_pass.getBytes());
            byte messageDigest[] = digest.digest();

            // Create Hex String
            StringBuffer hexString = new StringBuffer();
            for (int i=0; i<messageDigest.length; i++)
                hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
            p_pass = hexString.toString();

            Person.add(
                org_id,
                dept_id,
                p_id,
                p_name,
                p_phone,
                p_mail,
                p_title,
                p_pass
            );

            r.success();
        }catch(Exception e){
            r.fail();
            r.setMsg(e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/person/{p_id}", method = RequestMethod.POST)
    public @ResponseBody AjaxResult updatePerson(
        @PathVariable("p_id") String p_id_ori,
        @RequestParam("org_id") String org_id,
        @RequestParam("dept_id") String dept_id,
        @RequestParam("p_id") String p_id_new,
        @RequestParam("p_name") String p_name,
        @RequestParam("p_phone") String p_phone,
        @RequestParam("p_mail") String p_mail,
        @RequestParam("p_title") String p_title,
        @RequestParam("p_pass") String p_pass,
        HttpSession s,
        Model m) {

        AjaxResult r = new AjaxResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            // =========================
            // pwd hash process...
            // =========================

            //compare password
            // Create MD5 Hash
            MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
            digest.update(p_pass.getBytes());
            byte messageDigest[] = digest.digest();

            // Create Hex String
            StringBuffer hexString = new StringBuffer();
            for (int i=0; i<messageDigest.length; i++)
                hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
            p_pass = hexString.toString();

            Person p = new Person(p_id_ori);
            p.org_id = org_id;
            p.dept_id = dept_id;
            p.p_id = p_id_new;
            p.p_name = p_name;
            p.p_phone = p_phone;
            p.p_mail = p_mail;
            p.p_title = p_title;
            p.p_pass = p_pass;

            p.save();

            r.success();
        }catch(Exception e){
            r.fail();
            r.setMsg(e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/person/{id}", method = RequestMethod.DELETE)
    public @ResponseBody AjaxResult delPerson(
        @PathVariable("id") String id,
        HttpSession s,
        Model m) {
        AjaxResult r = new AjaxResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            Person.delete(id);
            r.success();
        }catch(Exception e){
            r.fail();
            r.setMsg(e.getMessage());
        }
        return r;
    }

    // Person Resources end ================

    // Dept Resources ====================

    @RequestMapping(value = "/admin/person", method = RequestMethod.GET)
    public @ResponseBody AjaxResult getAllPerson(
        HttpSession s,
        Model m) {
        AjaxResult r = new AjaxResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            r.setData(Person.getAll());
            r.success();
        }catch(Exception e){
            r.fail();
            r.setMsg((String)e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/person/{id}", method = RequestMethod.GET)
    public @ResponseBody AjaxResult getAPerson(
        @PathVariable("id") String id,
        HttpSession s,
        Model m) {
        AjaxResult r = new AjaxResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            r.setDataFromPerson(new Person(id));
            r.success();
        }catch(Exception e){
            r.fail();
            r.setMsg(e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/person/", method = RequestMethod.POST)
    public @ResponseBody AjaxResult createPerson(
        @RequestParam("org_id") String org_id,
        @RequestParam("dept_id") String dept_id,
        @RequestParam("p_id") String p_id,
        @RequestParam("p_name") String p_name,
        @RequestParam("p_phone") String p_phone,
        @RequestParam("p_mail") String p_mail,
        @RequestParam("p_title") String p_title,
        @RequestParam("p_pass") String p_pass,
        HttpSession s,
        Model m) {

        AjaxResult r = new AjaxResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            // =========================
            // pwd hash process...
            // =========================

            //compare password
            // Create MD5 Hash
            MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
            digest.update(p_pass.getBytes());
            byte messageDigest[] = digest.digest();

            // Create Hex String
            StringBuffer hexString = new StringBuffer();
            for (int i=0; i<messageDigest.length; i++)
                hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
            p_pass = hexString.toString();

            Person.add(
                org_id,
                dept_id,
                p_id,
                p_name,
                p_phone,
                p_mail,
                p_title,
                p_pass
            );

            r.success();
        }catch(Exception e){
            r.fail();
            r.setMsg(e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/person/{p_id}", method = RequestMethod.POST)
    public @ResponseBody AjaxResult updatePerson(
        @PathVariable("p_id") String p_id_ori,
        @RequestParam("org_id") String org_id,
        @RequestParam("dept_id") String dept_id,
        @RequestParam("p_id") String p_id_new,
        @RequestParam("p_name") String p_name,
        @RequestParam("p_phone") String p_phone,
        @RequestParam("p_mail") String p_mail,
        @RequestParam("p_title") String p_title,
        @RequestParam("p_pass") String p_pass,
        HttpSession s,
        Model m) {

        AjaxResult r = new AjaxResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            // =========================
            // pwd hash process...
            // =========================

            //compare password
            // Create MD5 Hash
            MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
            digest.update(p_pass.getBytes());
            byte messageDigest[] = digest.digest();

            // Create Hex String
            StringBuffer hexString = new StringBuffer();
            for (int i=0; i<messageDigest.length; i++)
                hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
            p_pass = hexString.toString();

            Person p = new Person(p_id_ori);
            p.org_id = org_id;
            p.dept_id = dept_id;
            p.p_id = p_id_new;
            p.p_name = p_name;
            p.p_phone = p_phone;
            p.p_mail = p_mail;
            p.p_title = p_title;
            p.p_pass = p_pass;

            p.save();

            r.success();
        }catch(Exception e){
            r.fail();
            r.setMsg(e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/person/{id}", method = RequestMethod.DELETE)
    public @ResponseBody AjaxResult delPerson(
        @PathVariable("id") String id,
        HttpSession s,
        Model m) {
        AjaxResult r = new AjaxResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            Person.delete(id);
            r.success();
        }catch(Exception e){
            r.fail();
            r.setMsg(e.getMessage());
        }
        return r;
    }

    // Dept Resources end ================

    @RequestMapping(value = "/welcome/{userId}/{userName}", method = RequestMethod.GET)
    public @ResponseBody JsonTest test(
        @PathVariable("userId") String userId,
        @PathVariable("userName") String userName,
        HttpSession s,
        Model m) {

        int number;
        if (s.getAttribute("number") == null)
            number = 0;
        else
            number = (int) s.getAttribute("number");

        number++;
        s.setAttribute("number" , number );

        JsonTest j = new JsonTest();
        j.name = userId + ":" + userName;
        j.array = new String[]{"HsinE", "PastLeo","Emma"};
        j.number = number;

        return j;
    }

    @RequestMapping("test/{page}")
    public String testRoute(@PathVariable("page") String page) {
        return "test/" + page;
    }
}
