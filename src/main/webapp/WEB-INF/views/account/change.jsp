<%@ page pageEncoding="utf-8"%>

<div class="hero-wrap hero-bread"
	style="background-image: url('/static/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/home/index">Home</a></span> <span>Change 
						Password</span>
				</p>
				<h1 class="mb-0 bread">CHANGE PASSWORD</h1>
			</div>
		</div>
	</div>
</div>
<div class="container">
<h4 class ="badge badge-success">${message}</h4>
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="card" style="margin-top: 4em; margin-bottom: 3em;">
				<div class="card-header">Change Password</div>
				<div class="card-body">
					<form action="/account/change" method="post" class="form-horizontal">

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">UserName</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input name="id" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Current Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input name="pw" class="form-control" type="password"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">New Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input name="pw1" class="form-control" type="password" />
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Confirm New Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input name="pw2" class="form-control" type="password" />
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<button class="btn btn-primary btn-lg btn-block login-button">Change</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>
