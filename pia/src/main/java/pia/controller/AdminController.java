package pia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.*;

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

    @RequestMapping(value = "/admin/person", method = RequestMethod.GET)
    public @ResponseBody AjaxGetResult getAllPerson(
        HttpSession s,
        Model m) {
        AjaxGetResult r = new AjaxGetResult();
        try{
            if(s.getAttribute("UA") == null)
                throw new Exception("You havent login!");

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            r.setData(Person.getAll());
            r.setStatus("success");
        }catch(Exception e){
            r.setStatus("fail");
            r.setMsg((String)e.getMessage());
        }
        return r;
    }

    @RequestMapping(value = "/admin/person/{id}", method = RequestMethod.GET)
    public String getPersonForm(
        @PathVariable("id") String id,
        HttpSession s,
        Model m) {
        AjaxGetResult r = new AjaxGetResult();
        try{
            if(s.getAttribute("UA") == null)
                return "redirect:logout";

            Object message = s.getAttribute("message");
            if(message != null){
                r.setMsg((String)message);
                s.removeAttribute("message");
            }

            r.setData(Person.getAll());
            r.setStatus("success");
        }catch(Exception e){
            r.setStatus("fail");
            r.setMsg(e.getMessage());
        }
        return "/WEB-INF/view/admin/form_person";
    }

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
