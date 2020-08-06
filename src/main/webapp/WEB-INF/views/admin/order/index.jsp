<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="hero-wrap hero-bread"
	style="background-image: url('/static/images/admin_db.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home/index">Home</a></span> <span>Order 
						Manager </span>
				</p>
				<h1 class="mb-0 bread">ORDER MANAGER</h1>
			</div>
		</div>
	</div>
</div>

<c:set var = "base" value="/admin/order" scope ="request"/>

<div class="container">
<h4 class ="badge badge-success">${message}${param.message}</h4>
	<ul class="nav nav-pills">
		<li class="nav-item"><a
			style="display: block; padding: 0.25rem 4rem; margin-left: 1em;margin-bottom: 1em;"
			class="nav-link active" data-toggle="tab" href="#home">Edit</a></li>
		<li class="nav-item"><a class="nav-link"
			style="display: block; padding: 0.25rem 4rem;margin-bottom: 1em;"
			data-toggle="tab" href="#menu1">List</a></li>
	</ul>


	<!-- Tab panes -->
	<div class="tab-content">
		<div class="tab-pane container active" id="home">
			<jsp:include page="_form.jsp"></jsp:include>
		</div>
		<div class="tab-pane container fade" id="menu1">
			<jsp:include page="_table.jsp"></jsp:include>
		</div>
	</div>
</div>
