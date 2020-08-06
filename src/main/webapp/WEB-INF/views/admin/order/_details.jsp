<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<section style="padding: 0;" class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>ID</th>
								<th>Image</th>
								<th>Name</th>
								<th>Quantity</th>
								<th>Amount</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${details}">
								<tr>
									<td class="price">${e.product.id}</td>
									<td class="image-prod"><div class="img"
											style="background-image: url(/static/images/${e.product.image});"></div></td>
									<td class="product-name">
										<h3>${e.product.name}</h3>
									</td>

									<td class="price">${e.quantity}</td>
									<td class="price">${e.unitPrice*e.quantity*(1-e.discount/100)}</td>

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
