<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<section id="home-section" class="hero">
	<div class="home-slider owl-carousel">
		<div class="slider-item"
			style="background-image: url(/static/images/bg_1.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true">

					<div class="col-md-12 ftco-animate text-center">
						<h1 class="mb-2">We serve Fresh Vegestables &amp; Fruits</h1>
						<h2 class="subheading mb-4">We deliver organic vegetables
							&amp; fruits</h2>
						<form action="/product/list-by-keywords" method="post">
							<input
								style="padding: 0.5em; border-radius: 5px; margin-bottom: 1em;"
								value="${param.keywords}" name="keywords"
								placeholder="Search...">
						</form>
						<p>
							<a href="#" class="btn btn-primary">View Details</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="slider-item"
			style="background-image: url(/static/images/bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true">

					<div class="col-sm-12 ftco-animate text-center">
						<h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
						<h2 class="subheading mb-4">We deliver organic vegetables
							&amp; fruits</h2>
						<form action="/product/list-by-keywords" method="post">
							<input style="padding: 0.5em; border-radius: 5px; margin-bottom: 1em;" value="${param.keywords}" name="keywords"
								placeholder="Search...">
						</form>
						<p>
							<a href="#" class="btn btn-primary">View Details</a>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row no-gutters ftco-services">
			<div
				class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-shipped"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Free Shipping</h3>
						<span>On order over $100</span>
					</div>
				</div>
			</div>
			<div
				class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-diet"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Always Fresh</h3>
						<span>Product well package</span>
					</div>
				</div>
			</div>
			<div
				class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-award"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Superior Quality</h3>
						<span>Quality Products</span>
					</div>
				</div>
			</div>
			<div
				class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-customer-service"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Support</h3>
						<span>24/7 Support</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-category ftco-no-pt">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-6 order-md-last align-items-stretch d-flex">
						<div
							class="category-wrap-2 ftco-animate img align-self-stretch d-flex"
							style="background-image: url(/static/images/category.jpg);">
							<div class="text text-center">
								<h2>Vegetables</h2>
								<p>Protect the health of every home</p>
								<p>
									<a href="#" class="btn btn-primary">Shop now</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div
							class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
							style="background-image: url(/static/images/category-1.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0">
									<a href="/product/list-by-category/1">Fruits</a>
								</h2>
							</div>
						</div>
						<div class="category-wrap ftco-animate img d-flex align-items-end"
							style="background-image: url(/static/images/category-2.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0">
									<a href="/product/list-by-category/3">Vegetables</a>
								</h2>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div
					class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
					style="background-image: url(/static/images/category-3.jpg);">
					<div class="text px-3 py-1">
						<h2 class="mb-0">
							<a href="/product/list-by-category/2">Juices</a>
						</h2>
					</div>
				</div>
				<div class="category-wrap ftco-animate img d-flex align-items-end"
					style="background-image: url(/static/images/category-4.jpg);">
					<div class="text px-3 py-1">
						<h2 class="mb-0">
							<a href="/product/list-by-category/4">Dried</a>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-3 pb-3">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<span class="subheading">Featured Products</span>
				<h2 class="mb-4">New Products</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center">
				<ul class="product-category">
					<li><a href="/product/list-by-special/0" class="active">New</a></li>
					<li><a href="/product/list-by-special/1">Selling</a></li>
					<li><a href="/product/list-by-special/2">Care</a></li>
					<li><a href="/product/list-by-special/3">Discount</a></li>
					<li><a href="/product/list-by-special/4">Special</a></li>
				</ul>
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
							alt="Colorlib Template"> <span class="status">${p.discount}%</span></a>
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

<section class="ftco-section img"
	style="background-image: url(/static/images/bg_3.jpg);">
	<div class="container">
		<div class="row justify-content-end">
			<div
				class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
				<span class="subheading">Best Price For You</span>
				<h2 class="mb-4">Deal of the day</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia</p>
				<h3>
					<a href="#">Spinach</a>
				</h3>
				<span class="price">$10 <a href="#">now $5 only</a></span>
				<div id="timer" class="d-flex mt-5">
					<div class="time" id="days"></div>
					<div class="time pl-3" id="hours"></div>
					<div class="time pl-3" id="minutes"></div>
					<div class="time pl-3" id="seconds"></div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section testimony-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section ftco-animate text-center">
				<span class="subheading">Testimony</span>
				<h2 class="mb-4">Our satisfied customer says</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia, there live the blind texts.
					Separated they live in</p>
			</div>
		</div>
		<div class="row ftco-animate">
			<div class="col-md-12">
				<div class="carousel-testimony owl-carousel">
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5"
								style="background-image: url(/static/images/person_1.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line">Far far away, behind the word
									mountains, far from the countries Vokalia and Consonantia,
									there live the blind texts.</p>
								<p class="name">Garreth Smith</p>
								<span class="position">Marketing Manager</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5"
								style="background-image: url(/static/images/person_2.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line">Far far away, behind the word
									mountains, far from the countries Vokalia and Consonantia,
									there live the blind texts.</p>
								<p class="name">Garreth Smith</p>
								<span class="position">Interface Designer</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5"
								style="background-image: url(/static/images/person_3.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line">Far far away, behind the word
									mountains, far from the countries Vokalia and Consonantia,
									there live the blind texts.</p>
								<p class="name">Garreth Smith</p>
								<span class="position">UI Designer</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5"
								style="background-image: url(/static/images/person_1.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line">Far far away, behind the word
									mountains, far from the countries Vokalia and Consonantia,
									there live the blind texts.</p>
								<p class="name">Garreth Smith</p>
								<span class="position">Web Developer</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="testimony-wrap p-4 pb-5">
							<div class="user-img mb-5"
								style="background-image: url(/static/images/person_1.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text text-center">
								<p class="mb-5 pl-4 line">Far far away, behind the word
									mountains, far from the countries Vokalia and Consonantia,
									there live the blind texts.</p>
								<p class="name">Garreth Smith</p>
								<span class="position">System Analyst</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<hr>

<section class="ftco-section ftco-partner">
	<div class="container">
		<div class="row">
			<div class="col-sm ftco-animate">
				<a href="#" class="partner"><img
					src="/static/images/partner-1.png" class="img-fluid1"
					alt="Colorlib Template"></a>
			</div>
			<div class="col-sm ftco-animate">
				<a href="#" class="partner"><img
					src="/static/images/partner-2.png" class="img-fluid1"
					alt="Colorlib Template"></a>
			</div>
			<div class="col-sm ftco-animate">
				<a href="#" class="partner"><img
					src="/static/images/partner-3.png" class="img-fluid1"
					alt="Colorlib Template"></a>
			</div>
			<div class="col-sm ftco-animate">
				<a href="#" class="partner"><img
					src="/static/images/partner-4.png" class="img-fluid1"
					alt="Colorlib Template"></a>
			</div>
			<div class="col-sm ftco-animate">
				<a href="#" class="partner"><img
					src="/static/images/partner-5.png" class="img-fluid1"
					alt="Colorlib Template"></a>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../product/dialog.jsp"></jsp:include>