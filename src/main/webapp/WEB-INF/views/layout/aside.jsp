<%@ page pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<c:set var="cart" value = "${sessionScope['scopedTarget.cartService']}"/>
<div class="panel panel-default">
	<div class="panel-heading">Shopping Card</div>
	<div class="panel-body">
		<img id ="cart-img" alt="" src="/static/images/shopping-cart.jpg" class="col-sm-5">
		<ul  class="col-sm-7">
			<li><b id="cart-cnt">${cart.count}</b>mặt hàng</li>
			<li><b id="cart-amt">
				<f:formatNumber value = "${cart.amount}" pattern = "#,###.00"></f:formatNumber>
				</b>USD</li>
			<li>
				<a href="/cart/view">Xem giỏ hàng</a>
			</li>
		</ul>
	</div>
</div>


<div class="panel panel-default">
	<div class="panel-heading">Tìm kiếm</div>
	<div class="panel-body">
		<form action="/product/list-by-keywords" method="post">
			<input value="${param.keywords}" name ="keywords" class= "form-control" placeholder= "Search...">
		</form>
	</div>
</div>


<div class="panel panel-default">
	<div class="panel-heading">DANH MỤC</div>
	<div class="list-group">
	<c:forEach var = "c" items = "${cates}">
		<a href="/product/list-by-category/${c.id}" class="list-group-item">${c.nameVN}</a> 
	</c:forEach>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">ĐẶC BIỆT</div>
	<div class="list-group">
		<a href="/product/list-by-special/0" class="list-group-item">Hàng mới</a> 
		<a href="/product/list-by-special/1" class="list-group-item">Bán chạy</a> 
		<a href="/product/list-by-special/2" class="list-group-item">Quan tâm</a>
		<a href="/product/list-by-special/3" class="list-group-item">Giảm giá</a>
		<a href="/product/list-by-special/4" class="list-group-item">Đặc biệt</a>
	</div>
</div>



<style id = "cart-css"></style>