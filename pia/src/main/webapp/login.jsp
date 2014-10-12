    <%@ page contentType="text/html;charset=utf-8"%>
    <%@ page import="java.security.*"%>
    <%@ page import="pia.model.DbInit" %>
    <%@ page import="java.sql.*" %>

    <%
        /*  session["UA"] uses "user_account"
            login account uses "user_mail"
            login password uses "user_passwd"     */
        String post_acc = request.getParameter("usr_mail");
        String post_pwd = request.getParameter("pwd");

        MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
        digest.update(post_pwd.getBytes());
        byte messageDigest[] = digest.digest();

        StringBuffer hexString = new StringBuffer();
                for (int i=0; i<messageDigest.length; i++)
                    hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
                post_pwd = hexString.toString();

                out.print(post_pwd);
        /*
        try {

            PreparedStatement pstmt =
                DbInit.getStatement("select * from pims_user where `user_mail` = ?");
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


                if(rs.getString("user_passwd").equals(post_pwd)){
                    session.setAttribute("UA", rs.getString("user_account") );

                    // =========================
                    // How to distinguish between normal user and admin?
                    // create new cookie storing that infomation
                    // =========================

                    out.print("<script>alert(\"登入成功\")</script>");
                    response.setHeader("Refresh" , "1;url=index.jsp");  //maybe we just redirect to index.jsp and then redirect to user/admin page
                }
                else{
                    out.print("<script>alert(\"帳號或密-碼錯誤\")</script>");
                    response.setHeader("Refresh" , "1;url=index.jsp");
                }
            }
            else{   //no matching account
                out.print("<script>alert(\"帳-號或密碼錯誤\")</script>");
                response.setHeader("Refresh" , "1;url=index.jsp");
            }
        } catch (Exception e) {
            out.print(e.getMessage());
            out.print("Sorry An Error,Bye");
        }
        */
    %>
