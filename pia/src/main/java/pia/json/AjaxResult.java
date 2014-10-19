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
    public BaseModel model;

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
 
    //getter and setter methods
 
}
