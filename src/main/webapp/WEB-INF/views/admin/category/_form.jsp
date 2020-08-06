<%@ page pageEncoding="utf-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="card" style="margin-bottom:1em;">
	<div class="card-header">Edit Category</div>
	<div class="container">
		<div class="card-block">
			<form:form action="${base}/index" modelAttribute="entity">
				<div class="form-group">
					<label>ID</label>
					<form:input path="id" class="form-control" readonly="true"
						placeholder="Auto Number" />
					<form:errors path ="id"/>
				</div>

				<div class="form-group">
					<label>Name</label>
					<form:input path="name" class="form-control" />
					<form:errors class="error" path ="name"/>
				</div>

				<div class="form-group">
					<label>NameVN</label>
					<form:input path="nameVN" class="form-control" />
					<form:errors class="error" path ="nameVN"/>
				</div>

				<div class="form-group">
					<button class="btn btn-primary" formaction="${base}/create">Create</button>
					<button class="btn btn-warning" formaction="${base}/update">Update</button>
					<button class="btn btn-danger" formaction="${base}/delete">Delete</button>
					<a class="btn btn-default" href="${base}/index">Reset</a>
				</div>
			</form:form>
		</div>
	</div>
</div>
