package pia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.*;
import java.security.*;
import java.util.*;

import pia.model2.*;
import pia.json.*;
import pia.httpStatus.*;

@Controller
public class AdminController {

    private static Map<String,String> type2name;
    private static Map<String,String> type2name(){
        if(type2name != null)
            return type2name;
        type2name = new TreeMap<String,String>();
        type2name.put("dept","單位資料表");
        type2name.put("person","人員資料表");
        type2name.put("audit","稽核設定");
        type2name.put("cal","行事曆");
        type2name.put("event","事件設定");
        return type2name;
    };

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

        return "redirect:/admin/dept";
    }

    @RequestMapping(value = "/admin/{type}", method = RequestMethod.GET)
    public String getAll(
        @PathVariable("type") String type,
        HttpSession s,
        Model m) {
        if(s.getAttribute("UA") == null)
            throw new Http403();

        Object message = s.getAttribute("message");
        if(message != null){
            m.addAttribute("message", message);
            s.removeAttribute("message");
        }

        String className;

        switch(type){
            case "person":
            case "dept":
            case "group":
            case "auditor":
            case "event":
                className = type.substring(0, 1).toUpperCase() + type.substring(1);
                //throw new Http404();
                try{m.addAttribute("obj",Class.forName("pia.model2." + className).newInstance());}catch(Exception e){throw new Http500();}
                m.addAttribute("title",type2name().get(type));
                m.addAttribute("type",type);
                return "/WEB-INF/view/admin/info";
            default:
                throw new Http404();
        }
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
