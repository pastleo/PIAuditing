<%@ page contentType="text/html;charset=utf-8"%>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading" style="height: 55px; line-height: 34px;">
    人員設定

    <!-- Button trigger modal -->
    <button class="btn btn-primary pull-right" data-toggle="modal" data-target="#person_Modal">
      ＋ 新增
    </button>
    <!-- Modal -->
    <div class="modal fade bs-example-modal-lg" id="person_Modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">新增人員</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label class="col-sm-2 control-label">學校</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">系所、組織</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">名稱</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">電話</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">職稱</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">重設密碼</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
            <button type="button" class="btn btn-primary">新增</button>
          </div>
        </div>
      </div>
    </div>
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
      <tr class="sample data">
        <td class="cell" field="p_id">1</td>
        <td class="cell" field="dept_id">中興大學 理學院 資工系</td>
        <td class="cell" field="p_name">某教授</td>
        <td class="cell" field="p_phone">0987654321</td>
        <td class="action"><a href="#edit">修改、刪除</a></td>
      </tr>
      <tr class="sample form">
        <td colspan="5">
          <div class="col-xs-12" style="padding-top: 15px;">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label class="col-sm-2 control-label">學校</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">系所、組織</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">名稱</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">電話</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">職稱</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">重設密碼</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-default">Submit</button>
                </div>
              </div>
            </form>
          </div>
        </td>
      </tr>
    </tbody>
  </table>

</div>
