<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section style=" padding: 0; "class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>Category ID</th>
								<th>Image</th>
								<th>Name</th>
								<th>NameVN</th>
								
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items ="${list}">
								<tr>
									<td class="price">${e.id}</td>

									<td class="image-prod"><div class="img"
											style="background-image: url(/static/images/${e.image});"></div></td>

									<td class="product-name">
										<h3>${e.name}</h3>
									</td>

									<td class="price">${e.nameVN}</td>

									<td class="product-remove">
									<a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Edit</a>
									<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Delete</a>
									</td>
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