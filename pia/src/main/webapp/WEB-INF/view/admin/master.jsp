<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:master>

  <jsp:attribute name="head">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.1.1/fullcalendar.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.1.1/fullcalendar.print.css">
  </jsp:attribute>

  <jsp:attribute name="foot">
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.3/moment-with-locales.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.1.1/fullcalendar.min.js"></script>

    <script>
      $(document).ready(function() {
        // page is now ready, initialize the calendar...
        $("a[href=#cal]").on('shown.bs.tab',function(){
          $('#calendar').fullCalendar({
              // put your options and callbacks here
          });
        })
      });
    </script>
  </jsp:attribute>

  <jsp:body>

    <div class="col-xs-3">
      <div class="alert alert-info" role="alert">
        xxx您好
      </div>
      <div class="list-group">
        <a class="list-group-item" href="#dep" role="tab" data-toggle="tab">單位資料表</a>
        <a class="list-group-item" href="#person" role="tab" data-toggle="tab">人員資料表</a>
        <a class="list-group-item" href="#audit" role="tab" data-toggle="tab">稽核設定</a>
        <a class="list-group-item" href="#cal" role="tab" data-toggle="tab">行事曆</a>
        <a class="list-group-item" href="#event" role="tab" data-toggle="tab">事件設定</a>
      </div>
    </div>
    <div class="col-xs-9">

      <!-- Tab panes -->
      <div class="tab-content">
        <div class="tab-pane active" id="dep">
          <%@ include file="/WEB-INF/view/admin/pane_dep.jsp"%>
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
    <footer>
      <p>© Company 2014</p>
    </footer>

  </jsp:body>

</t:master>
