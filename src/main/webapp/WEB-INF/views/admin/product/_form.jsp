<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"%>

<div class="card" style="margin-bottom: 1em;">
	<div class="card-header">Edit Order</div>
	<div class="container">
		<div class="card-block">
			<form:form action="${base}/index" modelAttribute="entity" enctype="multipart/form-data">
			<div class="row">
				<div class="form-group col-sm-6">
					<label>ID</label>
					<form:input path="id" class="form-control"  readonly="true" placeholder="Auto Number"/>
				</div>
				<div class="form-group col-sm-6">
					<label>Name</label>
					<form:input path="name" class="form-control" />
					<form:errors class="error" path ="name"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Unit Price</label>
					<form:input path="unitPrice" class="form-control" />
					<form:errors class="error" path ="unitPrice"/>
				</div>

				<div class="form-group col-sm-6">
					<label>Quantity</label>
					<form:input path="quantity" class="form-control" />
					<form:errors class="error" path ="quantity"/>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Discount</label>
					<form:input path="discount" class="form-control" />
					<form:errors class="error" path ="discount"/>
				</div>

				<div class="form-group col-sm-6">
					<label>Order Date</label>
					<form:input path="productDate" class="form-control" />
					<form:errors class="error" path ="productDate"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Special?</label>
					<div class="form-control">
						<form:radiobutton path="special" value="true" label="Yes" />
						<form:radiobutton path="special" value="false" label="No" />
					</div>
				</div>
				<form:errors class="error" path ="special"/>

				<div class="form-group col-sm-6">
					<label>Available?</label>
					<div class="form-control">
						<form:radiobutton path="available" value="true" label="Yes" />
						<form:radiobutton path="available" value="false" label="No" />
					</div>
				</div>
				<form:errors class="error" path ="available"/>
			</div>
			
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Category</label>
					<form:select path="category.id" class="form-control">
						<form:options items="${cates}" itemLabel="Name" itemValue="id" />
					</form:select>
				</div>
				
				<div class="form-group col-sm-6">
					<label>ViewCount</label>
					<form:input path="viewCount" class="form-control" />
					<form:errors class="error" path ="viewCount"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<label>Image</label>
					<input type="file" name="image_file" class="form-control">
					<form:hidden path="image"/>
					
				</div>
			</div>

			<div class="row">
				<div class="form-group col-sm-12">
					<label>Description</label>
					<form:textarea path="description" row="3" class="form-control" />
					<form:errors class="error" path ="description"/>
				</div>
				<div class="form-group col-sm-12">
					<button class="btn btn-primary" formaction="${base}/create">Create</button>
					<button class="btn btn-warning" formaction="${base}/update">Update</button>
					<button class="btn btn-danger" formaction="${base}/delete">Delete</button>
					<a class="btn btn-default" href="${base}/index">Reset</a>
				</div>
			</div>
		</form:form>
		</div>
	</div>
</div>



<script type="text/javascript">
//<![CDATA[
        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
  //]]>
  </script>
