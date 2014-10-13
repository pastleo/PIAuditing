package pia.json;

import java.util.Vector;
import java.util.TreeMap;
import java.util.Map;

import pia.model.*;
 
public class AjaxGetResult {
 
    public String status;
    public String message;
    public Vector< Map<String,String> > data;

    public void setStatus(String status){
        this.status = status;
    }

    public void setMsg(String message){
        this.message = message;
    }

    public void setData(Vector< Map<String,String> > data){
        this.data = data;
    }
 
    //getter and setter methods
 
}
