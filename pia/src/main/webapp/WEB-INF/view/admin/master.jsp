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

    <script>
      var person,group,dept,audit;
      var person_a,group_a,dept_a,audit_a;
      var org = {NCHU:{org_id:"NCHU",org_name:"中興大學"}};
      var isFail = false;
      var db_map,autocomplete;

      function complete_group_info(){
        var result = {};
        var result_a = [];
        var ele_tmp;
        for(i in group){
          ele_tmp = group[i];
          ele_tmp.org_name = org[ele_tmp.org_id].org_name;
          ele_tmp.value = ele_tmp.org_id;
          ele_tmp.label = ele_tmp.org_name + " " + ele_tmp.group_name;
          result[ele_tmp.group_id] = ele_tmp;
          result_a.push(ele_tmp.label);
        }
        group = result;
        group_a = result_a;
      }

      function complete_dept_info(){
        var result = {};
        var result_a = [];
        var ele_tmp;
        for(i in dept){
          ele_tmp = dept[i];
          ele_tmp.org_name = org[ele_tmp.org_id] ? org[ele_tmp.org_id].org_name : "null";
          ele_tmp.group_name = group[ele_tmp.group_id] ? group[ele_tmp.group_id].group_name : "null";
          ele_tmp.value = ele_tmp.dept_id;
          ele_tmp.label = ele_tmp.dept_name;
          result[ele_tmp.dept_id] = ele_tmp;
          result_a.push(ele_tmp.label);
        }
        dept = result;
        dept_a = result_a;
      }

      function complete_person_info(){
        var result = {};
        var result_a = [];

        var ele_tmp;
        for(i in person){
          ele_tmp = person[i];
          ele_tmp.org_name = org[ele_tmp.org_id] ? org[ele_tmp.org_id].org_name : "null";
          ele_tmp.group_name = group[ele_tmp.group_id] ? group[ele_tmp.group_id].group_name : "null";
          ele_tmp.dept_name = dept[ele_tmp.dept_id] ? dept[ele_tmp.dept_id].dept_name : "null";
          ele_tmp.value = ele_tmp.p_id;
          ele_tmp.label = ele_tmp.p_name;
          result[ele_tmp.dept_id] = ele_tmp;
          result_a.push(ele_tmp.label);
        }
        person = result;
        person_a = result_a;
      }

      function complete_info(){
        complete_group_info();
        complete_dept_info();
        complete_person_info();
        db_map = {person:person,group:group,dept:dept,audit:audit};
        autocomplete = {person:person_a,group:group_a,dept:dept_a,audit:audit_a};
      }

      function submit_form(){

        var form = $(this).parents("div.modal-content").find("form");
        var data = form.serializeArray();
        console.log($(this));
        console.log(data);
        console.log(form);

        // $.ajax({
        //   url: form.attr("action"),
        //   type: form.attr("method"),
        //   data: form.serializeArray(),
        //   success: function(data){
        //     console.log(data);
        //   },
        //   error: function(){
        //     console.log("fail...");
        //   }
        // });

        return false;
      }

      function enable_tokenfield(form){
        form.find("input").each(function(){
          if($(this).attr('type') == 'token'){
            var tokens_space = $(this).attr('tokens-space');
            console.log(db_map[tokens_space]);
            $(this)
            .on("tokenfield:initialize",function(){
              $(this).parents("div.tokenfield").find("span.token-label").css("max-width","none");
            })
            .tokenfield({
              tokens:db_map[tokens_space],
              autocomplete: {
                source: autocomplete[tokens_space],
                delay: 100
              },
              minWidth:0,
              maxWidth:200,
              showAutocompleteOnFocus: true,
              createTokensOnBlur: true
            });
          }
        });
      }

      function init_table(type){
        var panel = $("#"+type+" div.panel");
        var table = $("#"+type+" table");
        var data = db_map[type];
        var sample = table.find("tr.sample.data");
        var form_sample = table.find("tr.sample.form");
        var tbody = table.find("tbody");
        var tmp,e;

        function build_form(ori_data){
          ori_data = ori_data ? ori_data : {};

          var form = form_sample.clone();
          form.removeClass("sample");
          enable_tokenfield(form,data);
          form.find("input").each(function(){
            if(ori_data[$(this).attr('name')])
              $(this).val(ori_data[$(this).attr('name')]);
          });
          form.find("form").submit(submit_form);

          return form;
        }

        function toggle_modification_form(){
          var par=$(this).parents('tr');
          if (par.next().hasClass( "form" )) {
              par.next().remove();
          } else {
              par.after(build_form(db_map[type][par.find("td.pk").text()]));
          }
        }

        for(k in data){
          tmp = sample.clone();
          e = data[k];
          tmp.find("td.cell").each(function(){
            $(this).text(e[$(this).attr("field")]);
          });
          tmp.data(e);
          tmp.find("td.action a").attr("id","edit" + e.p_id).click(toggle_modification_form);

          tmp.removeClass("sample");
          tbody.append(tmp);
        }

        var create_form = panel.find("div.create_form");
        enable_tokenfield(create_form,data);
        panel.find("button.submit").click(submit_form);
      }

      function init(){
        complete_info();
        console.log(db_map);
        init_table("dept");
        init_table("person");
        init_table("audit");
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

        getAllData(init);
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
