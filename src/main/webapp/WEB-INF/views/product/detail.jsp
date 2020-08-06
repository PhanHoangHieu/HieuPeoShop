<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<div class="hero-wrap hero-bread"
	style="background-image: url('/static/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home/index">Home</a></span> <span
						class="mr-2"><a href="/home/index">Product</a></span> <span>Product
						Single</span>
				</p>
				<h1 class="mb-0 bread">Product Single</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 mb-5 ftco-animate">
				<a href="/static/images/${prod.image}" class="image-popup"><img
					src="/static/images/${prod.image}" class="img-fluid"
					alt="Colorlib Template"></a>
			</div>
			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
				<h3>${prod.name}</h3>
				<div class="rating d-flex">
					<p class="text-left mr-4">
						<a href="#" class="mr-2">5.0</a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a> <a href="#"><span
							class="ion-ios-star-outline"></span></a>
					</p>
					<p class="text-left mr-4">
						<a href="#" class="mr-2" style="color: #000;">${prod.viewCount}<span
							style="color: #bbb;">Views</span></a>
					</p>
					<p class="text-left">
						<a href="#" class="mr-2" style="color: #000;">${prod.discount}%<span
							style="color: #bbb;">Discount</span></a>
					</p>
				</div>
				<p class="price">
					<span>$<f:formatNumber value="${prod.unitPrice}"
							pattern="#,###.00" /></span>
				</p>
				<p>${prod.description}</p>
				<div class="row mt-4">
					<div class="w-100"></div>
					<div class="w-100"></div>
					<div class="col-md-12">
						<p style="color: #000;">${prod.quantity} productsavailable</p>
					</div>
				</div>
				<div data-id="${prod.id}">
					<a href="/cart/view"
						class="btn btn-black py-3 px-5 btn-add-to-cart">Add to Cart</a>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-3 pb-3">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<span class="subheading">Products</span>
				<h2 class="mb-4">Related Products</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<c:forEach var="p" items="${list}">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="/product/detail/${p.id}" class="img-prod"><img
							class="img-fluid" src="/static/images/${p.image}"
							alt="Colorlib Template"> <span class="status">${p.discount}
								%</span></a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">${p.name}</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="mr-2 price-dc">${p.unitPrice}</span><span
											class="price-sale"><f:formatNumber
												value="${p.unitPrice*(1-p.discount/100)}" pattern="#,###.00" /></span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="pull-right" data-id="${p.id}">
									<button class="btn btn-sm btn-danger ">
										<i class="	fa fa-cart-arrow-down btn-add-to-cart"></i>
									</button>
									<button class="btn btn-sm btn-warning btn-star">
										<i class="fa fa-star"></i>
									</button>
									<button class="btn btn-sm btn-success btn-open-dialog"
										data-toggle="modal" data-target="#myModal">
										<i class="fa fa-envelope-o"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<div class="container">
	<ul class="nav nav-pills">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#home">Favorite Products</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#menu1">Viewed Products</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div class="tab-pane container active" id="home">
			<c:forEach var="p" items="${favo}">
				<a href="/product/detail/${p.id}"> <img class="thumb"
					src="/static/images/${p.image}">
				</a>
			</c:forEach>
		</div>
		<div class="tab-pane container fade" id="menu1">
			<c:forEach var="p" items="${viewed}">
				<a href="/product/detail/${p.id}"> <img class="thumb"
					src="/static/images/${p.image}">
				</a>
			</c:forEach>
		</div>
	</div>
</div>

