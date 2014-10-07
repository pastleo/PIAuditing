package pia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.*;

import pia.model.*;
import pia.json.*;

@Controller
public class AdminController {
    @RequestMapping("hello")
    public String hello(@RequestParam("user") String user, Model m) {

        // things passed to the view
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

}

