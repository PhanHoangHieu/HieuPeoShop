<%@ page pageEncoding="utf-8"%>
<div class="hero-wrap hero-bread"
	style="background-image: url('/static/images/admin_db.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home/index">Home</a></span> <span>Admin Page
					</span>
				</p>
				<h1 class="mb-0 bread">ADMINISTRATOR</h1>
			</div>
		</div>
	</div>
</div>

<div style="display: flex">
	<jsp:include page="_inventory_chart.jsp" />
	<jsp:include page="_revenue_customer_chart.jsp" />
</div>