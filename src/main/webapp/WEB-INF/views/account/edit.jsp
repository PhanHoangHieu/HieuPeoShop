<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="hero-wrap hero-bread"
	style="background-image: url('/static/images/bg_1.jpg');">
	<div class="container">
	
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home/index">Home</a></span> <span>Update
						Profile</span>
				</p>
				<h1 class="mb-0 bread">UPDATE PROFILE</h1>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="card" style="margin-top: 4em; margin-bottom: 3em;">
				<div class="card-header">Update Profile</div>
				<div class="card-body">
					<form:form action="/account/edit" method="post"
						modelAttribute="form" enctype="multipart/form-data"
						class="form-horizontal">

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">UserName</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="id" class="form-control" readonly="true" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">FullName</label>


							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="fullName" class="form-control" />
								</div>
							</div>
							<form:errors path="fullName" class="error" />
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="email" class="form-control" />

								</div>
							</div>
							<form:errors path="email" class="error" />
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Avatar</label>
							<img src="/static/images/customer/${form.photo}"
								style="width: 80px; height: 90px;margin-left: 3em; margin-bottom: 1em; border: 1px solid bisque;">
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="file" name="photo_file" class="form-control">
									<form:hidden path="photo" class="form-control" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:hidden path="password" />
							<form:hidden path="activated" />
							<form:hidden path="admin" />
							<div class="form-group">
								<button class="btn btn-primary btn-lg btn-block login-button">Update
									Profile</button>
							</div>
						</div>
					</form:form>
				</div>

			</div>
		</div>
	</div>
</div>
