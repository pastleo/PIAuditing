<%@ page contentType="text/html;charset=utf-8"%>

<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">單位資料表</div>
  <div class="panel-body">
    <div class="col-lg-8">
      <div class="input-group">
        <span class="input-group-addon">filter</span>
        <input type="text" class="form-control">
      </div><!-- /input-group -->
    </div><!-- /.col-lg-12 -->
    <div class="col-lg-4">
      <button type="button" class="btn btn-primary btn-block">
        ＋ 新增
      </button>
    </div>
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
  <div class="panel-body editing">
    <form class="form-horizontal" role="form">
      <div class="col-lg-12">
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
          </div>
        </div>
      </div><!-- /.col-lg-12 -->
      <div class="col-lg-8">
        <button type="button" class="btn btn-primary btn-block">
          確定
        </button>
      </div>
      <div class="col-lg-4">
        <button type="button" class="btn btn-primary btn-block">
          刪除
        </button>
      </div>
    </form>
  </div>
</div>
