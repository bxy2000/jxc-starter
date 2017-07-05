<#include "../share/header.ftl">
<#include "../share/main.ftl">
<#include "../share/footer.ftl">

<@header title="用户管理"></@header>

<@main>
	<div class="row">
		<div class="col-lg-12">
			<h2>用户管理</h2>
			<p id="toolbar">
				<button id="create" class="btn btn-success">
					<i class="glyphicon glyphicon-plus"></i> 新增
				</button>
				<button id="remove" class="btn btn-danger" disabled>
					<i class="glyphicon glyphicon-remove"></i> 删除
				</button>
			</p>
			<table id="userlist">
			</table>
			<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="modalTitle">操作</h4>
						</div>
						<div class="modal-body">
							<form id="userForm" class="form-horizontal">
								<div class="form-group">
									<label for="id" class="col-sm-2 control-label">id</label>
									<div class="col-sm-10">
										<input type="text" id="id" name="id" class="form-control" placeholder="用户id" readonly />
									</div>
								</div>
								<div class="form-group">
									<label for="username" class="col-sm-2 control-label">用户名</label>
									<div class="col-sm-10">
										<input type="text" id="username" name="username" class="form-control" placeholder="用户名" />
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-2 control-label">密码</label>
									<div class="col-sm-10">
										<input type="password" id="password" name="password" class="form-control" placeholder="密码" />
									</div>
								</div>
								<div class="form-group">
									<label for="roleId" class="col-sm-2 control-label">角色</label>
									<div class="col-sm-10">
										<select id="roleId" name="role.id" class="form-control">
											<option>--请选择--</option>
										</select>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary save" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
							<button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	</script>
</@main>

<@footer>
	<script>
		$table = $('#userlist');
		$create = $('#create');
		$remove = $('#remove');
		selections = [];
		
		$(function(){
			initTable();
		});
		
		function initTable(){
			$table.bootstrapTable({
				url: '${ctx.contextPath}/admin/user/list',
				mtype: 'post',
				//------------------------------------------------------------
				idField: 'id',
				pagination: true,
				pageNumber: 1,                       
				pageSize: 10,
				pageList: '[10, 20, 30, ALL]',
				sidePagination: 'server',
				//------------------------------------------------------------
				cache: false,								// 缓存
				striped: true,								// 斑马线
				//height: 537,
				//------------------------------------------------------------
				toolbar: '#toolbar',
				search: true,								// 显示搜索框
				searchOnEnterKey: true,						// 回车进行搜索
				showRefresh: true,							// 显示刷新
				showToggle: true,							// 
				showColumns: true,							// 显示列列表
				showExport: true,							// 显示导出列表
				showPaginationSwitch: true,					// 显示打开关闭分页栏
				showFooter: false,							// 显示脚注
				//------------------------------------------------------------
				columns: [{
					field: 'state',
					checkbox: true,
					align: 'center',
				}, {
					field: 'id',
					title: '序号',
					align: 'center'
				}, {
			        field: 'username',
			        title: '用户名',
			        align: 'center'
			    }, {
			        field: 'password',
			        title: '密码',
			        align: 'center',
			    }, {
			    	field: 'role.roleName',
			    	title: '角色',
			    	align: 'center'
			    }, {
			    	field: 'operation',
			    	title: '操作',
			    	width: 130,
			    	events: {
						'click .edit': function (e, value, row, index) {
							// alert('你要编辑的数据行:' + JSON.stringify(row));
							// 清除表单内容
        					$('#id').val(row.id);
        					$('#username').val(row.username);
        					$('#password').val(row.password);
        					$('#roleId').val(row.role.id);
							$('#userModal').modal('show');
						},
						'click .remove': function (e, value, row, index) {
							bootbox.confirm({
								size: 'small',
								message: '确认删除吗？',
								callback: function(result){
									if(result){
										$.ajax({
											url: '${ctx.contextPath}/admin/user/delete/'+row.id,
											type: 'post',
											data: {},
											dataType: 'json',
											success: function(result){
												$table.bootstrapTable('refresh');
												if(result.success)
													toastr.success(result.message);
												else
													toastr.error(result.message);
											}
										});
									}					
								}
							});
        				}
    				},
			    	formatter: function(value, row, index) {
				        return [
				        	'<a class="btn btn-xs btn-success edit" href="javascript:void(0)">',
				        	'<i class="glyphicon glyphicon-edit"></i> 编辑',
				        	'</a>&nbsp;',
				            '<a class="btn btn-xs btn-danger remove" href="javascript:void(0)">',
            				'<i class="glyphicon glyphicon-remove"></i> 删除',
				            '</a>'
        				].join('');
    				}
			    }]
			});
			
			// 全选，取消全选
			$table.on('check.bs.table uncheck.bs.table ' +
                	  'check-all.bs.table uncheck-all.bs.table', function () {
					$remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
					
            		// save your data, here just save the current page
            		
            		selections = getIdSelections();
            		
            		// push or splice the selections if you want to save all data selections
        	});

			// 初始化下拉列表框（角色）
	    	$.ajax({
	    		url: '${ctx.contextPath}/admin/role/list',
	    		type: 'post',
	    		data: {},
	    		dataType: 'json',
	    		success: function(result){
	    			for(var i=0; i<result.length; i++){
	    				$('#roleId').append('<option value="'+result[i].id+'">'+result[i].roleName+'</option>');
	    			}
	    		}
	    	});
        	
        	// 新增
        	$create.click(function(){
        		// 清除表单内容
        		$('input[name]', '#userModal').val('');
				$('#userModal').modal('show');
        	});
        	
        	// 保存
        	$('.save').click(function(){
        		$.ajax({
        			url: '${ctx.contextPath}/admin/user/save',
        			type: 'post',
        			data: $('#userForm').serialize(),
        			dataType: 'json',
        			success: function(result){
        				$table.bootstrapTable('refresh');
        				if(result.success){
        					toastr.success(result.message);
        				} else {
        					toastr.error(result.message);
        				}
        			}
        		});
        	});
        	
        	// 批量删除
        	$remove.click(function () {
        		bootbox.confirm({
        			size: 'small',
        			message: '确认删除选中项吗？',
        			callback: function(result){
        				if(result){
			            	$.ajax({
			            		url: '${ctx.contextPath}/admin/user/deleteInBatch',
			            		type: 'post',
			            		data: {ids: getIdSelections()},
			            		dataType: 'json',
			            		success: function(result) {
			            			if(result.success){
						           		$remove.prop('disabled', true);
			 		          			$table.bootstrapTable('refresh');
			 		          			toastr.success(result.message);
			            			} else {
			            				toastr.error(result.message);
			            			}
			            		}
			            	});
			            }           	
        			}
        		});
			});
		}
		
		function getIdSelections() {
        	return $.map($table.bootstrapTable('getSelections'), function (row) {
            	return row.id
        	});
    	}
	</script>
</@footer>