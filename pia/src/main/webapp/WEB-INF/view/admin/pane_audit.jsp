<%@ page contentType="text/html;charset=utf-8"%>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading" style="height: 55px; line-height: 34px;">
    稽核設定
      <button type="button" class="btn btn-primary pull-right">
        ＋ 新增
      </button>

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
        <td>event_id</td>
        <td>org_id</td>
        <td>p_id</td>
        <td>ad_org_id</td>
        <td>ad_dept_id</td>
        <td>ad_time_from</td>
        <td>ad_time_end</td>
        <td colspan="2" style="text-align: center;">動作</td>
      </tr>
    </thead>
    <tbody>
      <tr class="sample data">        
        <td class="cell" field="event_id"> .. </td>
        <td class="cell" field="org_id"> .. </td>
        <td class="cell" field="p_id"> .. </td>
        <td class="cell" field="ad_org_id"> .. </td>
        <td class="cell" field="ad_dept_id"> .. </td>
        <td class="cell" field="ad_time_from"> .. </td>
        <td class="cell" field="ad_time_end"> .. </td>
        <td class="action"><a href="#edit">修改、刪除</a></td>
      </tr>
      <!-- <tr class="a1">
        <td>1</td>
        <td>中興大學</td>
        <td>資工系</td>
        <td>某職員</td>
        <td>2014/10/10 17:00~19:00</td>
        <td class="action"><a href="#edit">修改、刪除</a></td>
      </tr>
      <tr class="a2">
        <td>2</td>
        <td>中興大學</td>
        <td>資工系</td>
        <td>某職員</td>
        <td>2014/10/10 17:00~19:00</td>
        <td class="action"><a href="#edit">修改、刪除</a></td>
      </tr> -->
    </tbody>
  </table>

</div>
