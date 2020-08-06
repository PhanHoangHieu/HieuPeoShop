<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<section style="padding: 0;" class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>Product ID</th>
								<th>Product Image</th>
								<th>Product name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="tbody">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>

<ul class="div pager">
	<li><a href="#"><i class="fa fa-arrow-circle-up"></i></a></li>
	<li><a href="#"><i class="fa fa-arrow-circle-left"></i></a></li>
	<li><a href="#"><i class="fa fa-arrow-circle-right"></i></a></li>
	<li><a href="#"><i class="fa fa-arrow-circle-down"></i></a></li>
</ul>


<script>
	$(function() {
		var pageNo;
		var pageCount;

		$.ajax({
			url : '/pager/product/page-count',
			success : function(response) {
				pageCount = response;

			}
		});

		$(".pager a:eq(0)").click(function() {
			pageNo = 0;
			$.ajax({
				url : '/pager/product/page/' + pageNo,
				success : fnSuccess
			});
			return false;
		});
		$(".pager a:eq(0)").click();

		$(".pager a:eq(1)").click(function() {
			if (pageNo > 0) {
				pageNo--;
				$.ajax({
					url : '/pager/product/page/' + pageNo,
					success : fnSuccess
				});
			}

			return false;
		});
		$(".pager a:eq(2)").click(function() {
			if (pageNo < pageCount - 1) {
				pageNo++;
				$.ajax({
					url : '/pager/product/page/' + pageNo,
					success : fnSuccess
				});
			}

			return false;

		});
		$(".pager a:eq(3)").click(function() {

			pageNo = pageCount - 1;
			$.ajax({
				url : '/pager/product/page/' + pageNo,
				success : fnSuccess
			});

			return false;
		});
	});

	function fnSuccess(response) {
		pageCount = response;
		$("#tbody").html("")
		$(response)
				.each(
						function(index, product) {
							var tr = $("<tr/>")
							$("<td/>").html(product.id).appendTo(tr);
							var img = `<td class="image-prod"><div class="img"
								style="background-image: url(/static/images/`+product.image+`);"></div></td>`;
								$(img).appendTo(tr);	
							
							$("<td/>").html(product.name).appendTo(tr);
							$("<td/>").html(product.unitPrice).appendTo(tr);
							$("<td/>").html(product.quantity).appendTo(tr);
							var s = `<td class="text-center"><a class="btn btn-sm btn-info" href="/admin/product/edit/`+product.id+`">Edit</a><a class="btn btn-sm btn-danger" href="/admin/product/delete/`+product.id+`">Delete</a></td>`;
							$(s).appendTo(tr);
							tr.appendTo("#tbody")
						})
	}
</script>

<style>
.div {
	display: flex;
	list-style-type: none;
	justify-content: center;
	font-size: 1.5em;
}

.div li {
	margin-left: 1em;
}
</style>