<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<div class="hero-wrap hero-bread"
	style="background-image: url('/static/images/admin_db.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home/index">Home</a></span> <span>Inventory By Year
						</span>
				</p>
				<h1 class="mb-0 bread">INVENTORY BY Year</h1>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<jsp:include page="_revenue_year_chart.jsp"/>
</div>
<section  class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">

								<th>Year </th>
								<th>Quantity </th>
								<th>Revenue </th>
								<th>Latest price </th>
								<th>The highest selling price</th>
								<th>Average selling price</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${data}">
								<tr>
									<td class="price">${e[0]}</td>

									<td class="product-name">
										<h3>${e[1]}</h3>
									</td>

									<td class="price">$<f:formatNumber value="${e[2]}"
											pattern="#,###.00" /></td>

									<td class="price">$<f:formatNumber value="${e[3]}"
											pattern="#,###.00" /></td>
									<td class="price">$<f:formatNumber value="${e[4]}"
											pattern="#,###.00" /></td>

									<td class="total amt">$<f:formatNumber value="${e[5]}"
											pattern="#,###.00" /></td>
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