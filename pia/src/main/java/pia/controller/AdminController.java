package pia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.*;
import java.security.*;

import pia.model.*;
import pia.json.*;
import pia.httpStatus.*;

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

    @RequestMapping(value = "/admin/{type}", method = RequestMethod.GET)
    public @ResponseBody AjaxResult getAll(
        @PathVariable("type") String type,
        HttpSession s,
        Model m) {
        AjaxResult r = new AjaxResult();
        if(s.getAttribute("UA") == null)
            throw new Http403("You havent login!");

        Object message = s.getAttribute("message");
        if(message != null){
            r.setMsg((String)message);
            s.removeAttribute("message");
        }

        try{
            switch(type){
                case "person":
                    r.setData(Person.getAll());
                    break;
                case "dept":
                    r.setData(Dept.getAll());
                case "group":
                    r.setData(Group.getAll());
                default:
                    throw new Http404("unknown type!");
            }

            r.success();
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/{type}/{id}", method = RequestMethod.GET)
    public @ResponseBody AjaxResult getOne(
        @PathVariable("type") String type,
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

            switch(type){
                case "person":
                    r.setData((new Person(id)).get());
                    break;
                case "dept":
                    r.setData((new Dept(id)).get());
                    break;
                case "group":
                    r.setData((new Group(id)).get());
                    break;
                default:
                    throw new Http404("unknown type!");
            }

            r.success();
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
        }
        return r;
    }

    // ====================

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

            Person.add(org_id,dept_id,p_id,p_name,p_phone,p_mail,p_title,p_pass);

            r.success();
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/person/{p_id}", method = RequestMethod.POST)
    public @ResponseBody AjaxResult updatePerson(
        @PathVariable("p_id") String p_id,
        @RequestParam("org_id") String org_id,
        @RequestParam("dept_id") String dept_id,
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

            Person.update(org_id,dept_id,p_id,p_name,p_phone,p_mail,p_title,p_pass);

            r.success();
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
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
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
        }
        return r;
    }

    // ====================

    @RequestMapping(value = "/admin/dept/", method = RequestMethod.POST)
    public @ResponseBody AjaxResult createDept(
        @RequestParam("org_id") String org_id,
        @RequestParam("group_id") String group_id,
        @RequestParam("dept_id") String dept_id,
        @RequestParam("dept_name") String dept_name,
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

            Dept.add(org_id,group_id,dept_id,dept_name);

            r.success();
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/dept/{dept_id}", method = RequestMethod.POST)
    public @ResponseBody AjaxResult updateDept(
        @PathVariable("dept_id") String dept_id,
        @RequestParam("org_id") String org_id,
        @RequestParam("group_id") String group_id,
        @RequestParam("dept_name") String dept_name,
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

            Dept.update(org_id,group_id,dept_id,dept_name);

            r.success();
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/dept/{id}", method = RequestMethod.DELETE)
    public @ResponseBody AjaxResult delDept(
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

            Dept.delete(id);
            r.success();
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
        }
        return r;
    }

    // ====================

    @RequestMapping(value = "/admin/group/", method = RequestMethod.POST)
    public @ResponseBody AjaxResult createGroup(
        @RequestParam("org_id") String org_id,
        @RequestParam("group_id") String group_id,
        @RequestParam("group_name") String group_name,
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

            Group.add(org_id,group_id,group_name);

            r.success();
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/group/{org_id}", method = RequestMethod.POST)
    public @ResponseBody AjaxResult updateGroup(
        @PathVariable("org_id") String org_id,
        @RequestParam("group_id") String group_id,
        @RequestParam("group_name") String group_name,
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

            Group.update(org_id,group_id,group_name);

            r.success();
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/group/{id}", method = RequestMethod.DELETE)
    public @ResponseBody AjaxResult delGroup(
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

            Group.delete(id);
            r.success();
        }catch(HttpStatusBase e){
            throw e;
        }catch(Exception e){
            r.fail();
            throw new Http500((String)e.getMessage());
        }
        return r;
    }

    // ====================

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
