<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="hero-wrap hero-bread"
	style="background-image: url('/static/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Order
						List</span>
				</p>
				<h1 class="mb-0 bread">List Order</h1>
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
								<th>ID</th>
								<th>ORDER DATE</th>
								<th>ADDRESS</th>
								<th>AMOUNT</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="o" items="${orders}">
								<tr>
									<td class="price">${o.id}</td>

									<td class="price">${o.orderDate}</td>

									<td class="product-name">${o.address}</td>
									<td class="price">${o.amount}</td>

									<td><a href="/order/detail/${o.id}"
										class="btn btn-sm btn-warning">DETAIL</a></td>
								</tr>
								<!-- END TR-->
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>