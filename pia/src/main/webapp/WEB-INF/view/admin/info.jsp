<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:master>

  <jsp:attribute name="head">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.1.1/fullcalendar.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.1.1/fullcalendar.print.css">

    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-tokenfield/0.12.0/css/bootstrap-tokenfield.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-tokenfield/0.12.0/css/tokenfield-typeahead.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">

    <style>
    table.table.table-hover td.action{
      text-align: center;
    }

    table.table tr.sample{
      display: none;
    }
  </style>

  </jsp:attribute>

  <jsp:attribute name="foot">
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.3/moment-with-locales.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.1.1/fullcalendar.min.js"></script>

    <script src="//code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-tokenfield/0.12.0/bootstrap-tokenfield.min.js"></script>
  </jsp:attribute>

  <jsp:body>
  <div class="row">
    <div class="col-xs-3">
      <div class="alert alert-info" role="alert">
        xxx您好
      </div>
      <div class="list-group">
        <a class="list-group-item" href="dept">單位資料表</a>
        <a class="list-group-item" href="person">人員資料表</a>
        <a class="list-group-item" href="audit">稽核設定</a>
        <a class="list-group-item" href="cal">行事曆</a>
        <a class="list-group-item" href="event">事件設定</a>
      </div>
    </div>
    <div class="col-xs-9">

      <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading" style="height: 55px; line-height: 34px;">
        <c:out value="${title}" />

          <!-- Button trigger modal -->
          <button class="btn btn-primary pull-right create" data-toggle="modal" data-target="#dept_Modal">
            ＋ 新增
          </button>
          <!-- Modal -->
        </div>

        <div class="panel-body">
          <div class="col-lg-12">
            <div class="input-group">
              <span class="input-group-addon">filter</span>
              <input type="text" class="form-control">
            </div><!-- /input-group -->
          </div><!-- /.col-lg-12 -->

        </div>

        <!-- Table -->
        <table class="table table-hover">
          <thead>
            <tr>
              <c:forEach var="field" items="${obj.fieldNames}">
                <td>
                  <c:out value="${field}"/>
                </td>
              </c:forEach>
              <td class="action">動作</td>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="m" items="${obj.allObj}">
              <tr>
                <c:forTokens delims="," var="att" items="${obj.tokens}">
                  <td>
                    <c:out value="${m[att]}" />
                  </td>
                </c:forTokens>
                <td>
                  <a href="/pia/${type}/${m.id}">Edit</a>
                  or
                  <a href="/pia/${type}/delete/${m.id}">Delete</a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

      </div>

    </div>

    </div>
    <footer>
      <p>© Company 2014</p>
    </footer>

  </jsp:body>

</t:master>
