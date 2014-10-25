<%@ page contentType="text/html;charset=utf-8"%>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading" style="height: 55px; line-height: 34px;">
    單位資料表

    <!-- Button trigger modal -->
    <button class="btn btn-primary pull-right create" data-toggle="modal" data-target="#dept_Modal">
      ＋ 新增
    </button>
    <!-- Modal -->
    <div class="modal fade bs-example-modal-lg create_form" id="dept_Modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">新增單位</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label class="col-sm-2 control-label">學校、學院</label>
                <div class="col-sm-10">
                  <input class="form-control" name="group_id" type="token" data-limit="1" tokens-space="group">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">學系</label>
                <div class="col-sm-10">
                  <input class="form-control" name="dept_id">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-default">Submit</button>
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
        <td>學校</td>
        <td>學院</td>
        <td>學系</td>
        <td class="action">動作</td>
      </tr>
    </thead>
    <tbody>
      <tr class="sample data">
        <td class="cell pk" field="dept_id"></td>
        <td class="cell" field="org_name"></td>
        <td class="cell" field="group_name"></td>
        <td class="cell" field="dept_name"></td>
        <td class="action"><a href="#edit">修改、刪除</a></td>
      </tr>
      <tr class="sample form">
        <td colspan="5">
          <div class="col-xs-12" style="padding-top: 15px;">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label class="col-sm-2 control-label">學校、學院</label>
                <div class="col-sm-10">
                  <input class="form-control" name="group_id" type="token" data-limit="1" tokens-space="group">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">學系</label>
                <div class="col-sm-10">
                  <input class="form-control" name="dept_id">
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
