    <%@ page contentType="text/html;charset=utf-8"%>
    <%@ include file = "db_init.jsp"%> 

    <% 
        /*  session["UA"] uses "user_account"
            login account uses "user_mail"
            login password uses "user_passwd"     */
        String post_acc = request.getParameter("usr_mail");
        String post_pwd = request.getParameter("pwd");

        try {

            PreparedStatement pstmt =
                conn.prepareStatement("select * from pims_user where `user_mail` = ?");
            pstmt.setString(1, post_acc);
            ResultSet rs = pstmt.executeQuery();

            //if we have a user of that name in db
            if(rs.next()){

                // =========================
                // pwd hash process...
                // =========================

                //compare password
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
        
    %>