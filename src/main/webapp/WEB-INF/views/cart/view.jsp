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
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span>
				</p>
				<h1 class="mb-0 bread">My Cart</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>Product ID</th>
								<th>Product Image</th>
								<th>Product name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Discount</th>
								<th>Total</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p"
								items="${sessionScope['scopedTarget.cartService'].items}">
								<tr class="text-center" data-id="${p.id}"
									data-price="${p.unitPrice}" data-discount="${p.discount}">
									<td class="price">${p.id}</td>

									<td class="image-prod"><div class="img"
											style="background-image: url(/static/images/${p.image});"></div></td>

									<td class="product-name">
										<h3>${p.name}</h3>
										<p>Far far away, behind the word mountains, far from the
											countries</p>
									</td>

									<td class="price">${p.unitPrice}</td>

									<td class="quantity">
										<div class="input-group mb-3">
											<input value="${p.quantity}"
												class="quantity form-control input-number" type="number"
												min="1" max="10"style="width: 70px;">
										</div>
									</td>
									<td class="price">${p.discount}</td>

									<td class="total amt"><f:formatNumber value="${p.quantity*p.unitPrice*(1-p.discount/100)}" pattern="#,###.00"/>$</td>
									<td class="product-remove"><a href="#"><span
											class="ion-ios-close btn-cart-remove"></span></a></td>
								</tr>
								<!-- END TR-->
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row justify-content-end">
			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
				<p>
					<button  class="btn btn-danger py-3 px-4 btn-cart-clear">Clear
						Cart</button>
				</p>
			</div>
			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
				<p>
					<a href="/home/index" class="btn btn-primary py-3 px-4 btn-info">Coutinue Shopping</a>
				</p>
			</div>
			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
				<p>
					<a href="/order/checkout" class="btn btn-success py-3 px-4">Proceed
						to Checkout</a>
				</p>
			</div>
		</div>
	</div>
</section>