<#include "../admin/share/header.ftl">
<#include "../admin/share/footer.ftl">

<@header title="系统登录"></@header>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">系统登录</h3>
                    </div>
                    <div class="panel-body">
                        <form action="${ctx.contextPath}/account/validate" method="post" role="form">
                            <fieldset>
                            	<#if error??>
                        			<div class="form-group">
                        				<div class="alert alert-danger" role="alert">
        									<strong>错误:</strong> ${error}
      									</div>
                        			</div>
                        		</#if>
                                <div class="form-group">
                                    <input class="form-control" placeholder="用户名" name="username" type="text" autofocus required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" name="password" type="password" value="" required>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">记住我
                                    </label>
                                </div>
                                <button type="submit" class="btn btn-lg btn-success btn-block">登录</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<@footer></@footer>