<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

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

<jsp:include page="dialog.jsp" />
