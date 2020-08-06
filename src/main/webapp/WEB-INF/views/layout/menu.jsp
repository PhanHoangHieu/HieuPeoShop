<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
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
		<a class="navbar-brand" href="/home/index"><img
			style="width: 23%; padding-top: 10px" src="/static/images/logo.png"></a>


		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
		
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="/home/index"
					class="nav-link">Home</a></li>
				<li class="nav-item active"><a
					href="/product/list-by-category/1" class="nav-link">Product</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<c:choose>
							<c:when test="${empty sessionScope.user}">
								<a class="dropdown-item" href="/account/login">Login</a>
								<a class="dropdown-item" href="/account/register">Register</a>
								<a class="dropdown-item" href="/account/forgot">Forget
									Password</a>
							</c:when>
							<c:otherwise>
								<a class="dropdown-item" href="/account/logoff">Logout</a>
								<a class="dropdown-item" href="/account/change">Change
									Password</a>
								<a class="dropdown-item" href="/account/edit">Update Profile</a>
								<a class="dropdown-item" href="/order/list">Order</a>
								<a class="dropdown-item" href="/order/items">Goods purchased</a>
							</c:otherwise>
						</c:choose>
					</div></li>
				<li class="nav-item"><a href="/home/about" class="nav-link">About</a></li>
				<li class="nav-item"><a href="/home/blog" class="nav-link">Blog</a></li>
				<li class="nav-item"><a href="/home/contact" class="nav-link">Contact</a></li>
				<li class="nav-item cta cta-colored"><a href="/cart/view"
					class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>

			</ul>
		</div>
	</div>
</nav>

