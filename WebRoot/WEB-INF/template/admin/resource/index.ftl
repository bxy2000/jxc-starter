<#include "../share/header.ftl">
<#include "../share/main.ftl">
<#include "../share/footer.ftl">

<@header title="播思客进销存管理系统V1.0">
	<link href="${ctx.contextPath }/assets/vendor/jstree/themes/default/style.min.css" rel="stylesheet" type="text/css">
</@header>

<@main>
					<div class="row">
						<div class="col-lg-12">
							<h2 class="page-header">系统资源管理</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-lg-4">
							<div class="panel panel-primary">
								<div class="panel-heading">
									资源概要
								</div>
								<div class="panel-body">
									<div id="resourceTree"></div>
								</div>
								<div class="panel-footer">
								</div>
							</div>
					    </div>
					    <div class="col-lg-8">
							<div class="panel panel-info">
								<div class="panel-heading">
									资源详情
								</div>
								<div class="panel-body">
									<form id="resourceForm">
										<div class="form-group">
											<label for="id" class="form-label">资源ID</label>
											<input type="text" id="id" name="id" class="form-control" placeholder="资源id" readonly/>
											<input type="hidden" id="parentId" name="resource.id" />
										</div>
										<div class="form-group">
											<label for="title" class="form-label">资源名称</label>
											<input type="text" id="title" name="title" class="form-control" placeholder="资源名称" />
										</div>
										<div class="form-group">
											<label for="url" class="form-label">url</label>
											<input type="text" id="url" name="url" class="form-control" placeholder="url" />
										</div>
										<div class="form-group">
											<label for="icon" class="form-label">icon</label>
											<input type="text" id="icon" name="icon" class="form-control" placeholder="icon" />
										</div>
									</form>
								</div>
								<div class="panel-footer">
									<button type="button" class="btn btn-primary save"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
								</div>
							</div>					    
						</div>
				    </div>
</@main>

<@footer>
	<script src="${ctx.contextPath }/assets/vendor/jstree/jstree.min.js"></script>
	<script>
		$(function(){
			$('#resourceTree').on('loaded.jstree', function() {
    			$('#resourceTree').jstree('open_all');
  			}).on('changed.jstree', function(e, data){
				var node = data.instance.get_node(data.selected[0]);
				//alert(JSON.stringify(node));
				
				$.ajax({
					url: '${ctx.contextPath}/admin/resource/details/'+node.id,
					data:{},
					type:'post',
					success: function(result){
						//alert(JSON.stringify(result));
						$("#id").val(result.id);
						$("#parentId").val( result.resource ? result.resource.id : null);
						$("#title").val(result.title);
						$("#url").val(result.url);
						$("#icon").val(result.icon);
					},
					dataType: 'json'
				});				
			}).jstree({
				core:{
					themes : {
                    	responsive: false
                	},
					data: {
						url: '${ctx.contextPath}/admin/resource/tree'
					}
				},
				types: {
					default:{
						icon: 'fa fa-folder icon-state-default icon-lg'
					},
					file: {
						icon: 'fa fa-file icon-state-default icon-lg'
					}
				},
				plugins: ['types']
			});
		});
		
		$('.save').click(function(){
			alert($('#resourceForm').serialize());
			$.ajax({
				url: '${ctx.contextPath}/admin/resource/save',
				data: $('#resourceForm').serialize(),
				type:'post',
				success: function(result){
					alert(result.message);
				},
				dataType: 'json'
			});
		});
	</script>
</@footer>