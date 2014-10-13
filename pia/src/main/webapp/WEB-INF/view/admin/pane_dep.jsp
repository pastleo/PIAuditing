<%@ page contentType="text/html;charset=utf-8"%>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading" style="height: 55px; line-height: 34px;">
    單位資料表

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
        <td>#</td>
        <td>學校</td>
        <td>學院</td>
        <td>學系</td>
        <td class="action">動作</td>
      </tr>
    </thead>
    <tbody>
      <tr class="sample">
        <td class="cell-id">1</td>
        <td class="cell-school">中興大學</td>
        <td class="cell-group">理學院</td>
        <td class="cell-dept">資工系</td>
        <td class="action"><a href="#edit">修改、刪除</a></td>
      </tr>
    </tbody>
  </table>

</div>
