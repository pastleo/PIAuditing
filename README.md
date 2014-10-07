PIAuditing
==========

個資稽核系統

## 初始化

 * `git clone [本專案 Git 網址]`

## 啟動自動部署的虛擬機 `javaServerCentOS`

 * 到 `vagrant` 的[官方網站](https://www.vagrantup.com/)下載安裝 `vagrant`
 * 本虛擬機設定採用`virtualbox`作為底層提供者，因此也必須去[官方網站](https://www.virtualbox.org)下載安裝之
 * `cd` 到 `[本專案目錄]/javaServerCentOS`
 * `vagrant up` 啟動並自動部署機器

## 部屬並且啟動 Web App

 * 機器啟動之後，`vagrant ssh` 進入機器
 * `cd /pia`
 * `sh start.sh` 即可啟動
 * 先泡杯咖啡，等一下...
 * 看到 `The Server is running at http://localhost:8080/pia` 之後，在瀏覽器上輸入 `192.168.8.13:8080/pia/hello?user=pia` 即可看到最基礎頁面

> 如果做了修改，那你必須要先 `Ctrl-C` 把啟動的 Server 關閉，並重新部署啟動 Web App

## 開發學習文章

 * [JSP tag library -- JSTL](https://jstl.java.net/)
 * 關於我們使用的 Spring MVC with Gradle 架構，請參閱 [JSP Spring MVC using gradle](http://www.codedata.com.tw/java/java-tutorial-the-3rd-class-3-servlet-jsp/) 系列文章來了解相關的資訊
