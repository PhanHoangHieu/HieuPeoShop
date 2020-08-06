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
								<th>Order ID</th>	
								<th>Order Date</th>
								<th>Shipping Address</th>
								<th>Description</th>
								<th>Total</th>
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
			url : '/pager/order/page-count',
			success : function(response) {
				pageCount = response;

			}
		});

		$(".pager a:eq(0)").click(function() {
			pageNo = 0;
			$.ajax({
				url : '/pager/order/page/' + pageNo,
				success : fnSuccess
			});
			return false;
		});
		$(".pager a:eq(0)").click();

		$(".pager a:eq(1)").click(function() {
			if (pageNo > 0) {
				pageNo--;
				$.ajax({
					url : '/pager/order/page/' + pageNo,
					success : fnSuccess
				});
			}

			return false;
		});
		$(".pager a:eq(2)").click(function() {
			if (pageNo < pageCount - 1) {
				pageNo++;
				$.ajax({
					url : '/pager/order/page/' + pageNo,
					success : fnSuccess
				});
			}

			return false;

		});
		$(".pager a:eq(3)").click(function() {

			pageNo = pageCount - 1;
			$.ajax({
				url : '/pager/order/page/' + pageNo,
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
						function(index, order) {
							var tr = $("<tr/>")
							$("<td/>").html(order.id).appendTo(tr);
							$("<td/>").html(order.orderDate).appendTo(tr);
							$("<td/>").html(order.address).appendTo(tr);
							$("<td/>").html(order.description).appendTo(tr);
							$("<td/>").html(order.amount).appendTo(tr);
							var s = `<td class="text-center"><a class="btn btn-sm btn-info" href="/admin/order/edit/`+order.id+`">Edit</a><a class="btn btn-sm btn-danger" href="/admin/order/delete/`+order.id+`">Delete</a></td>`;
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