PIAuditing
==========

個資稽核系統

## 初始化

 * 複製 `webapps/ROOT/db_init.example.jsp` => `webapps/ROOT/db_init.jsp`
 * 修改 `webapps/ROOT/db_init.jsp` 的變數值 `db`,`host`,`user`,`pwd`

## 部屬並且啟動 Web App

 1. `cd /pia`
 2. `sh start.sh` 即可

> 如果做了修改，那你必須要先 `Ctrl-C` 把啟動的 Server 關閉，並重新部署啟動 Web App

## 開發學習文章

 * [JSP tag library -- JSTL](https://jstl.java.net/)
 * 關於我們使用的 Spring MVC with Gradle 架構，請參閱 [JSP Spring MVC using gradle](http://www.codedata.com.tw/java/java-tutorial-the-3rd-class-3-servlet-jsp/) 系列文章來了解相關的資訊
