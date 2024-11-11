<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Gass | Log in</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{$config->theme_path}plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="{$config->theme_path}plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{$config->theme_path}dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="../../index2.html" class="h1"><b>Gass</b>.co.id</a>
    </div>
    <div class="card-body">
       {if isset($msg)}
			{if $msg['code'] == 1}
			<div class="alert alert-success" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">×</span>
			  </button>
			  <strong>Success!</strong> {$msg['msg']}
			</div>
			{else}
			<div class="alert alert-danger" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">×</span>
			  </button>
			  <strong>Error!</strong>  {$msg['msg']}
			</div>
			{/if}
		{/if}
   
      <form action="" method="post">
        <input type="hidden" name="frmtoken" value="{$frmtoken}"> 
        <input type="hidden" name="act" value="user_login"> 
        <div class="input-group mb-3">
          <input type="tel" class="form-control" name="phone" placeholder="Phone">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-phone"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="password" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <!--
              <input type="checkbox" id="remember">
              <label for="remember">
                Remember Me
              </label>
              -->
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
<!--
      <div class="social-auth-links text-center mt-2 mb-3">
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
        </a>
      </div>
    -->
      <!-- /.social-auth-links -->
<!--
      <p class="mb-1" style="margin-top: 50px;">
        <a href="forgot.html">Forgot Password</a>
      </p>
      <p class="mb-0"  style="margin-top: 20px;">
        <a href="register.html" class="text-center">Register</a>
      </p>
    -->
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="{$config->theme_path}plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="{$config->theme_path}plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="{$config->theme_path}dist/js/adminlte.min.js"></script>
</body>
</html>
