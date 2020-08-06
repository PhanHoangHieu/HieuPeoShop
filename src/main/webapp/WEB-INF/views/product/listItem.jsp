<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<div class="hero-wrap hero-bread"
	style="background-image: url('/static/images/admin_db.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home/index">Home</a></span> 
					<span>Products purchased</span>
				</p>
				<h1 class="mb-0 bread">PRODUCTS  PURCHASED</h1>
			</div>
		</div>
	</div>
</div>
<div style="margin-top: 3em;" class="container">
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
