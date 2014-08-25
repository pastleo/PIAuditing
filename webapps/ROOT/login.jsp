    <%@ page contentType="text/html;charset=utf-8"%>
    <%@ include file = "db_init.jsp"%> 

    <% 
        String usr_mail = request.getParameter("usr_mail");
        String pwd = request.getParameter("pwd");
        String UA = (String) session.getAttribute("UA");
        if( usr_mail != null){

            try {

                PreparedStatement pstmt = conn.prepareStatement("select * from pims_user where `user_mail` = ?") ;
                pstmt.setString(1, usr_mail);
                ResultSet rs = pstmt.executeQuery();

                if(rs.next()){

                    // =========================
                    // pwd hash process...
                    // =========================

                    if(rs.getString("user_passwd").equals(pwd)){
                        UA = rs.getString("user_account");
                        session.setAttribute("UA",UA);
                    }
                    else{
                        out.print("Who are you??");
                    }
                }
                else{
                    out.print("Who are you?");
                }
            } catch (Exception e) {
                out.print(e.getMessage());
                out.print("Sorry An Error,Bye");
            }
        } else out.print("welcome");

        if (UA != null) {
            response.setHeader("Refresh" , "3;url=index.jsp");
        }
    %> 
    <html> 
        <head> 
            <title>Update</title> 
        </head> 
        <body>
            <% if(UA == null){ %>
            <form action = "login.jsp" method = "post"> 
                usr: <input type = "text" name= "usr_mail" value = ""> 
                <br />
                pwd: <input type = "text" name= "pwd" value = ""> 
                <br />  
                <input type = "submit"> 
            </form> 
            <!-- <a href="index.jsp">回首頁</a>  -->
            <% } else { %>
            <h2>Successfully login!! You will be redirect after 3 seconds!</h2>
            <% } %>
        </body> 
    </html> 
