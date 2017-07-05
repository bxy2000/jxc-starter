<#macro header title="管理系统" keywords="" description="" author="">
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="${keywords}">
<meta name="description" content="${description}">
<meta name="author" content="${author}">

<title>${title}</title>

<!-- Bootstrap Core CSS -->
<link href="${ctx.contextPath }/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- MetisMenu CSS -->
<link href="${ctx.contextPath }/assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet" type="text/css">
<!-- Custom CSS -->
<link href="${ctx.contextPath }/assets/dist/css/sb-admin-2.css" rel="stylesheet" type="text/css">
<!-- Custom Fonts -->
<link href="${ctx.contextPath }/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Bootstrap table CSS -->
<link href="${ctx.contextPath }/assets/vendor/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" type="text/css">
<!-- 动态提示框 -->
<link href="${ctx.contextPath }/assets/vendor/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css">	
<#nested>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
</#macro>
