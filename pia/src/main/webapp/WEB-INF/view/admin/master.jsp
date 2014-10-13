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

      function init_person(){
        var panel = $("#person div.panel");
        var table = $("#person table");
        var sample = table.find("tr.sample.data");
        var form_sample = table.find("tr.sample.form");
        var tbody = table.find("tbody");
        var tmp,e;

        function edit_action(){
          var par=$(this).parents('tr');
          console.log(par);
          if (par.next().hasClass( "form" )) {
              console.log("123");
              par.next().remove()
          } else {
              var form = form_sample.clone();
              form.removeClass("sample");

              par.after(form);
          };
        }

        $.ajax({
          url: "/pia/admin/person",
          success: function(data){
            var person_data = data.data;
            for(k in person_data){
              tmp = sample.clone();
              e = person_data[k];
              tmp.find("td.cell").each(function(){
                $(this).text(e[$(this).attr("field")]);
              });
              tmp.data(e);
              tmp.find("td.action a").attr("id","edit" + e.p_id).click(edit_action);

              tmp.removeClass("sample");
              tbody.append(tmp);
            }
            var tr_height = table.find("tr").eq(0).height();

            //$("a[id^=edit]").click(edit_action);
          },
        });
      }


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

            tmp.find("td.action a").attr("id","edit" + e.id)

            tmp.removeClass("sample");
            tbody.append(tmp);
          }
          var tr_height = table.find("tr").eq(0).height();

          $("a[id^=edit]").click(function () {
              var par=$(this).parents('tr')
              if ($(this).parents('tr').next().hasClass( "form" )) {
                  $(this).parents('tr').next().remove()
              } else {
                  //$(this).parents('tr').after("<tr class='form'><td colspan='5'>THIS IS YOUR FORM</td></tr>")
                  //panel.find("div.editing").slideToggle();
                  $(this).parents('tr').after("<tr class='form'><td colspan='5'></td></tr>");
                  //var type = "admin/" + ($(this).parents(".tab-pane").attr("id")) + "/" +  ;

                  //console.log(type);
                  $(this).parents('tr').next().load("test/form.jsp #form_dep");

              };
          });


        }
        init_dep();
        init_person();

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
