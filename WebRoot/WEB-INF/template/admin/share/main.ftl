<#macro main>
	<div id="wrapper">
		<!-- Navigation -->
		<#include "_navigator.ftl">
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<#nested>
			</div><!-- /.container-fluid -->
		</div><!-- /#page-wrapper -->
	</div>
</#macro>
