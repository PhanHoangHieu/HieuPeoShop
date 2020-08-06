<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="py-1 bg-primary">
	<div class="container">
		<div
			class="row no-gutters d-flex align-items-start align-items-center px-md-0">
			<div class="col-lg-12 d-block">
				<div class="row d-flex">
					<div class="col-md pr-4 d-flex topper align-items-center">
						<div
							class="icon mr-2 d-flex justify-content-center align-items-center">
							<span class="icon-phone2"></span>
						</div>
						<span class="text">+ 1235 2355 98</span>
					</div>
					<div class="col-md pr-4 d-flex topper align-items-center">
						<div
							class="icon mr-2 d-flex justify-content-center align-items-center">
							<span class="icon-paper-plane"></span>
						</div>
						<span class="text">youremail@email.com</span>
					</div>
					<div
						class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						<span class="text">3-5 Business days delivery &amp; Free
							Returns</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="/home/index"><img style ="width:23%;padding-top:10px" src="/static/images/logo.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="/home/index"
					class="nav-link">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Manager</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="/admin/category/index">Category</a> <a
							class="dropdown-item" href="/admin/product/index">Product</a> <a
							class="dropdown-item" href="/admin/customer/index">Customer</a> 
							<a class="dropdown-item" href="/admin/order/index">Order</a> 
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Statistical</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="/admin/inventory/index">Inventory By Category</a> <a
							class="dropdown-item" href="/admin/revenue/category">Revenue By Category</a> <a
							class="dropdown-item" href="/admin/revenue/customer">Revenue By Customer</a> 
							<a class="dropdown-item" href="/admin/revenue/year">Revenue By Year</a> 
							<a class="dropdown-item" href="/admin/revenue/quater">Revenue By Quater</a>
							<a class="dropdown-item" href="/admin/revenue/month">Revenue By Month</a>
					</div></li>
			</ul>
		</div>
	</div>
</nav>

