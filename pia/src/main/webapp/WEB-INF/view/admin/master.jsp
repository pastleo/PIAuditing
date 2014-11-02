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
        <a class="list-group-item" href="#dept" role="tab" data-toggle="tab">單位資料表</a>
        <a class="list-group-item" href="#person" role="tab" data-toggle="tab">人員資料表</a>
        <a class="list-group-item" href="#audit" role="tab" data-toggle="tab">稽核設定</a>
        <a class="list-group-item" href="#cal" role="tab" data-toggle="tab">行事曆</a>
        <a class="list-group-item" href="#event" role="tab" data-toggle="tab">事件設定</a>
      </div>
    </div>
    <div class="col-xs-9">

      <!-- Tab panes -->
      <div class="tab-content">
        <div class="tab-pane active" id="dept">
          <%@ include file="/WEB-INF/view/admin/pane_dept.jsp"%>
        </div>
        <div class="tab-pane" id="person">
          <%@ include file="/WEB-INF/view/admin/pane_person.jsp"%>
        </div>
        <div class="tab-pane" id="audit">
          <%@ include file="/WEB-INF/view/admin/pane_audit.jsp"%>
        </div>
        <div class="tab-pane" id="cal">
          <%@ include file="/WEB-INF/view/admin/pane_cal.jsp"%>
        </div>
        <div class="tab-pane" id="event">
          <%@ include file="/WEB-INF/view/admin/pane_event.jsp"%>
        </div>
      </div>
    </div>

    </div>
    <footer>
      <p>© Company 2014</p>
    </footer>

  </jsp:body>

</t:master>
