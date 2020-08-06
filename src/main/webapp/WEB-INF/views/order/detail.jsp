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
					<span class="mr-2"><a href="index.html">Home</a></span> <span>Order
						Infomation</span>
				</p>
				<h1 class="mb-0 bread">ORDER INFOMATION</h1>
			</div>
		</div>
	</div>
</div>


<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="card" style="margin-top: 4em;">
				<div class="card-header">Information</div>
				<div class="card-body">
					<form:form action="/order/checkout" method="post"
						modelAttribute="order" class="form-horizontal">

						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Order
								ID</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="id" class="form-control" readonly="true" />
								</div>
							</div>
						</div>
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
								<form:input path="address" class="form-control" readonly="true" />
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
										readonly="true" />
								</div>
							</div>
						</div>
					</form:form>
				</div>

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
							<c:forEach var="d" items="${details}">
								<tr>
									<td class="price">${d.product.id}</td>

									<td class="image-prod"><div class="img"
											style="background-image: url(/static/images/${d.product.image});"></div></td>

									<td class="product-name">
										<h3>${d.product.name}</h3>
										<p>Far far away, behind the word mountains, far from the
											countries</p>
									</td>

									<td class="price">${d.unitPrice}</td>
									<td class="price">${d.discount}</td>
									<td class="quantity">
										<div class="input-group mb-3">${d.quantity}</div>
									</td>
									<td class="total amt"><f:formatNumber value="${d.quantity*d.unitPrice*(1-d.discount/100)}" pattern="#,###.00"/>$</td>
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