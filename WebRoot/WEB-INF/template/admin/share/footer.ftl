<#macro footer>
	<!-- jQuery -->
	<script src="${ctx.contextPath }/assets/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="${ctx.contextPath }/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap table JavaScript -->
	<script src="${ctx.contextPath}/assets/vendor/bootstrap-table/bootstrap-table.min.js"></script>
	<script src="${ctx.contextPath}/assets/vendor/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script src="${ctx.contextPath}/assets/vendor/bootstrap-table/extensions/export/bootstrap-table-export.min.js"></script>
	<!-- Table Export JavaScript -->
	<script src="${ctx.contextPath}/assets/vendor/tableExport/tableExport.min.js"></script>
	<!-- 动态提示框 -->
	<script src="${ctx.contextPath }/assets/vendor/bootstrap-toastr/toastr.min.js"></script>
	<!-- 对话框 -->
	<script src="${ctx.contextPath }/assets/vendor/bootbox/bootbox.min.js"></script>
	<script>
		$(function(){
			<!-- 初始化动态提示对话框 -->
			toastr.options = {  
		        closeButton: false,  
		        debug: false,  
		        progressBar: true,  
		        positionClass: "toast-top-center",  
		        onclick: null,  
		        showDuration: "300",  
		        hideDuration: "1000",  
		        timeOut: "2000",  
		        extendedTimeOut: "1000",  
		        showEasing: "swing",  
		        hideEasing: "linear",  
		        showMethod: "fadeIn",  
		        hideMethod: "fadeOut"  
    		};
    		<!-- 初始化对话框 -->
    		bootbox.setLocale('zh_CN');
		});
	</script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="${ctx.contextPath }/assets/vendor/metisMenu/metisMenu.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="${ctx.contextPath }/assets/dist/js/sb-admin-2.js"></script>
	
<#nested>
</body>
</html>
</#macro>