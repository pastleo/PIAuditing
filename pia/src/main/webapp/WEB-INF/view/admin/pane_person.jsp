<%@ page contentType="text/html;charset=utf-8"%>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading" style="height: 55px; line-height: 34px;">
    人員設定
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
        <td>系所</td>
        <td>姓名</td>
        <td>聯絡電話</td>
        <td colspan="2" style="text-align: center;">動作</td>
      </tr>
    </thead>
    <tbody>
      <tr class="a1">
        <td>1</td>
        <td>中興大學 理學院 資工系</td>
        <td>某教授</td>
        <td>0987654321</td>
        <td class="action"><a href="#edit">修改、刪除</a></td>
      </tr>
      <tr class="a2">
        <td>2</td>
        <td>中興大學 理學院 物理系</td>
        <td>某教授</td>
        <td>0987654321</td>
        <td class="action"><a href="#edit">修改、刪除</a></td>
      </tr>
    </tbody>
  </table>

</div>
