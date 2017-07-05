			
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li>
							<a href="${ctx.contextPath }/admin/home/index">
								<i class="fa fa-dashboard fa-fw"></i> 功能导航
							</a>
						</li>
					<#list _resources_ as r1>
						<li>
							<a href="#"><i class="fa ${r1.icon} fa-fw"></i> ${r1.title}<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
							<#list r1.resources as r2>
								<li><a href="${ctx.contextPath}/${r2.url}">${r2.title}</a></li>
							</#list>
							</ul>
							<!-- /.nav-second-level -->
						</li>
					</#list>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
