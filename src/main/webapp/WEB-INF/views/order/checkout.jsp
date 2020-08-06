<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="hero-wrap hero-bread"
	style="background-image: url('/static/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home/index">Home</a></span> <span>Checkout</span>
				</p>
				<h1 class="mb-0 bread">CHECKOUT</h1>
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
								<th>PRODUCT ID</th>
								<th>PRODUCT IMAGE</th>
								<th>PRODUCT NAME</th>
								<th>PRICE</th>
								<th>DISCOUNT</th>
								<th>QUANTITY</th>
								<th>AMOUNT</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p"
								items="${sessionScope['scopedTarget.cartService'].items}">
								<tr>
									<td class="price">${p.id}</td>

									<td class="image-prod"><div class="img"
											style="background-image: url(/static/images/${p.image});"></div></td>

									<td class="product-name">
										<h3>${p.name}</h3>
										<p>Far far away, behind the word mountains, far from the
											countries</p>
									</td>

									<td class="price">${p.unitPrice}</td>
									<td class="price">${p.discount}</td>
									<td class="quantity">${p.quantity}</td>
									<td class="total amt"><f:formatNumber value="${p.quantity*p.unitPrice*(1-p.discount/100)}" pattern="#,###.00"/>$</td>
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
<h4>${message}</h4>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="card" style="margin-top: 1em;margin-bottom:3em;">
				<div class="card-header">Information Order</div>
				<div class="card-body">
					<form:form action="/order/checkout" method="post" modelAttribute="order" class="form-horizontal">

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Customer</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="customer.id" class="form-control"
										readonly="true" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Order
								Date</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="orderDate" class="form-control"
										readonly="true" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Shipping
								Address</label>
							<div class="cols-sm-10">
								<form:input path="address" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Total
								Amount</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="amount" class="form-control" readonly="true" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Notes</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:textarea path="description" rows="3" class="form-control"
										/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<button class="btn btn-primary btn-lg btn-block login-button">Perchase</button>
						</div>
					</form:form>
				</div>

			</div>
		</div>
	</div>
</div>
