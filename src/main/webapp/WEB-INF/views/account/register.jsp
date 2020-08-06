<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="hero-wrap hero-bread"
	style="background-image: url('/static/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home/index">Home</a></span> <span>Form
						Register</span>
				</p>
				<h1 class="mb-0 bread">FORM REGISTER</h1>
			</div>
		</div>
	</div>
</div>
<div class="container">
<h4 class ="badge badge-success">${message}</h4>
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="card" style="margin-top: 4em; margin-bottom: 3em;">
				<div class="card-header">Form Register</div>
				<div class="card-body">
					<form:form action="/account/register" method="post"
						modelAttribute="form" enctype="multipart/form-data"
						class="form-horizontal">

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">UserName</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="id" class="form-control" />
									
								</div>
							</div>
							<form:errors path="id" class="error"/>
						</div>
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="password" class="form-control" type="password" />
									
								</div>
							</div>
							<form:errors path="password" class="error"/>
						</div>
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">FullName</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="fullName" class="form-control" />
									
								</div>
							</div>
							<form:errors path="fullName"  class="error"/>
						</div>
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<form:input path="email" class="form-control" />
									
								</div>
							</div>
							<form:errors path="email" class="error"/>
						</div>
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Avatar</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="file" name="photo_file" class="form-control">
									<form:hidden path="photo" class="form-control" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<button class="btn btn-primary btn-lg btn-block login-button">Register</button>
						</div>
					</form:form>
				</div>

			</div>
		</div>
	</div>
</div>
