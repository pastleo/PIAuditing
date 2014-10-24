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

    table.table tr.sample{
      display: none;
    }
  </style>

  </jsp:attribute>

  <jsp:attribute name="foot">
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.3/moment-with-locales.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.1.1/fullcalendar.min.js"></script>

    <script>
      var person,group,dept,audit;
      var isFail = false;

      function init_table(type,data){
        var panel = $("#"+type+" div.panel");
        var table = $("#"+type+" table");
        var sample = table.find("tr.sample.data");
        var form_sample = table.find("tr.sample.form");
        var tbody = table.find("tbody");
        var tmp,e;

        for(k in data){
          tmp = sample.clone();
          e = data[k];
          tmp.find("td.cell").each(function(){
            $(this).text(e[$(this).attr("field")]);
          });
          tmp.data(e);
          tmp.find("td.action a").attr("id","edit" + e.p_id).click(function(){
            var par=$(this).parents('tr');
            console.log(par);
            if (par.next().hasClass( "form" )) {
                par.next().remove()
            } else {
                var form = form_sample.clone();
                form.removeClass("sample");
                par.after(form);
            };
          });

          tmp.removeClass("sample");
          tbody.append(tmp);
        }
      }

      function render(){
        init_table("dept",dept);
        init_table("person",person);
        init_table("audit",audit);
      }

      function getAllData(allCompleted){
        var complete_cnt = 0;
        var complete_cnt_total = 4;
        $.ajax({
          url: "/pia/admin/person",
          success: function(data){
            person = data.data;
            complete_cnt ++;
            if(complete_cnt == complete_cnt_total)
              allCompleted();
          },
          error: function(){
            isFail = true;
          }
        });

        $.ajax({
          url: "/pia/admin/group",
          success: function(data){
            group = data.data;
            complete_cnt ++;
            if(complete_cnt == complete_cnt_total)
              allCompleted();
          },
          error: function(){
            isFail = true;
          }
        });

        $.ajax({
          url: "/pia/admin/dept",
          success: function(data){
            dept = data.data;
            complete_cnt ++;
            if(complete_cnt == complete_cnt_total)
              allCompleted();
          },
          error: function(){
            isFail = true;
          }
        });

        $.ajax({
          url: "/pia/admin/auditor",
          success: function(data){
            audit = data.data;
            complete_cnt ++;
            if(complete_cnt == complete_cnt_total)
              allCompleted();
          },
          error: function(){
            isFail = true;
          }
        });
      }



      $(document).ready(function() {
        // page is now ready, initialize the calendar...
        $("a[href=#cal]").on('shown.bs.tab',function(){
          $('#calendar').fullCalendar({
              // put your options and callbacks here
          });
        });

        getAllData(render);
      });
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
