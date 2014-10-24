<%@ page contentType="text/html;charset=utf-8"%>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading" style="height: 55px; line-height: 34px;">
    事件設定

    <!-- Button trigger modal -->
    <button class="btn btn-primary pull-right" data-toggle="modal" data-target="#event_Modal">
      ＋ 新增
    </button>
    <!-- Modal -->
    <div class="modal fade bs-example-modal-lg" id="event_Modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="myModalLabel">新增事件</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label class="col-sm-2 control-label">default</label>
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
        <td>事件名稱</td>
        <td>事件期限</td>
        <td>有效</td>
        <td>過期</td>
        <td colspan="2" style="text-align: center;">動作</td>
      </tr>
    </thead>
    <tbody>
      <tr class="a1">
        <td>1</td>
        <td>內稽</td>
        <td>2014/12/31</td>
        <td>是</td>
        <td>否</td>
        <td class="action"><a href="#edit">修改、刪除</a></td>
      </tr>
      <tr class="a2">
        <td>2</td>
        <td>外稽</td>
        <td>2014/12/31</td>
        <td>是</td>
        <td>否</td>
        <td class="action"><a href="#edit">修改、刪除</a></td>
      </tr>
      <tr class="sample form">
        <td colspan="5">
          <div class="col-xs-12" style="padding-top: 15px;">
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label class="col-sm-2 control-label">事件名稱</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">事件期限</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">有效</label>
                <div class="col-sm-10">
                  <input class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">過期</label>
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
