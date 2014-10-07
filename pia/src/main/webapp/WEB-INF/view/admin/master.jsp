<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:master>

  <jsp:attribute name="head">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.1.1/fullcalendar.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.1.1/fullcalendar.print.css">

    <style>
    table.table.table-hover td.action{
      text-align: center;
    }

    div.panel-body.editing{
      display: none;
    }

    table.table tr.sample{
      display: none;
    }
  </style>

  </jsp:attribute>

  <jsp:attribute name="foot">
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.3/moment-with-locales.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.1.1/fullcalendar.min.js"></script>


  <script src="%E5%80%8B%E8%B3%87%E7%A8%BD%E6%A0%B8%E7%B3%BB%E7%B5%B1_files/moment-with-locales.js"></script>
    <script src="%E5%80%8B%E8%B3%87%E7%A8%BD%E6%A0%B8%E7%B3%BB%E7%B5%B1_files/fullcalendar.js"></script>

    <script>
      var dep_data = [
        {
          id:1,
          school:"中興大學",
          group:"理學院",
          dept:"資工系"
        },
        {
          id:2,
          school:"中興大學",
          group:"理學院",
          dept:"物理系"
        }
      ];

      $(document).ready(function() {
        // page is now ready, initialize the calendar...
        $("a[href=#cal]").on('shown.bs.tab',function(){
          $('#calendar').fullCalendar({
              // put your options and callbacks here
          });
        });

        function init_dep(){
          var panel = $("#dep div.panel");
          var table = $("#dep table");
          var sample = table.find("tr.sample");
          var tbody = table.find("tbody");
          var tmp,e;
          console.log(table);
          for(k in dep_data){
            tmp = sample.clone();
            e = dep_data[k];
            for(j in e){
              tmp.find(".cell-" + j).text(e[j]);
            }
            tmp.removeClass("sample");
            tbody.append(tmp);
          }
          var tr_height = table.find("tr").eq(0).height();

          table.find("td.action a[href=#edit]").click(function(){
            console.log("123");
            panel.find("div.editing").slideToggle();
          });
        }
        init_dep();

        //$("a[href=#dep]").on('shown.bs.tab',);
      });
    </script>
  </jsp:attribute>

  <jsp:body>
  <div class="row">
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

    </div>
    <footer>
      <p>© Company 2014</p>
    </footer>

  </jsp:body>

</t:master>
