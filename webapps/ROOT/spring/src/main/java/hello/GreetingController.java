package hello;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GreetingController {

    @RequestMapping("/greeting")
    public String greeting(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "greeting";
    }

   @RequestMapping("/mvc")
   public String mvc(@RequestParam(value="str", required=false, defaultValue="Model Data") String str, Model model) {
       model.addAttribute("str", str);
       return "mvc.jsp";
   }

}
