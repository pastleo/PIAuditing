    <%@ page contentType="text/html;charset=utf-8"%>
    <%@ page import="java.security.*"%>

    <%
        String src = request.getParameter("src");

        MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
        digest.update(src.getBytes());
        byte messageDigest[] = digest.digest();

        StringBuffer hexString = new StringBuffer();
        for (int i=0; i<messageDigest.length; i++)
            hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
        src = hexString.toString();

        out.print(src);
    %>
