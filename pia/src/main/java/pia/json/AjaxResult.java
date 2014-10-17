package pia.json;

import java.util.Vector;
import java.util.TreeMap;
import java.util.Map;

import pia.model.*;
 
public class AjaxResult {
 
    public boolean success;
    public String message;
    public Vector< Map<String,String> > data;
    public Vector< Map<String,String> > error;

    public void success(){
        this.success = true;
    }

    public void fail(){
        this.success = false;
    }

    public void setMsg(String message){
        this.message = message;
    }

    public void setData(Vector< Map<String,String> > data){
        this.data = data;
    }

    public void setErr(Vector< Map<String,String> > data){
        this.data = data;
    }

    public void setDataFromPerson(Person p){
        Vector< Map<String,String> > v = new Vector< Map<String,String> >();
        Map m = new TreeMap<String,String>();
        m.put("org_id", p.org_id);
        m.put("dept_id", p.dept_id);
        m.put("p_id", p.p_id);
        m.put("p_name", p.p_name);
        m.put("p_phone", p.p_phone);
        m.put("p_mail", p.p_mail);
        m.put("p_title", p.p_title);
        m.put("p_pass", p.p_pass);
        v.add(m);
        this.data = v;
    }
 
    //getter and setter methods
 
}
