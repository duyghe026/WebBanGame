<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0043)https://semantic-ui.com/examples/login.html -->
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<!-- Standard Meta -->

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<!-- Site Properties -->
<title>Login Example - Semantic</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"
	integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q="
	crossorigin="anonymous" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css"
	integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ="
	crossorigin="anonymous" />

<style type="text/css">
body {
	background-color: #DADADA;
}

body>.grid {
	height: 100%;
}

.image {
	margin-top: -100px;
}

.column {
	max-width: 450px;
}
</style>
</head>
<body>
	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<h2 class="ui blue image header">
				<div class="content">Quên Mật Khẩu</div>
			</h2>
			<form class="ui large form" action="main/quenmatkhau.htm" method="post">
				<div class="ui stacked segment">
					<div class="field">
						<div class="ui left icon input">
							<i class="user icon"></i> <input type="email" name="email"
								placeholder="Email" required>
						</div>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<h1>${message}</h1>
						</div>
					</div>
					<button class="ui fluid large blue submit button">Gửi</button>
				</div>
			</form>
			<div class="ui message">
				<a href="main/login.htm">Đăng Nhập</a>
			</div>
			<div class="ui message">
				<a href="main/index.htm">Trang Chủ</a>
			</div>
		</div>
	</div>
</body>
</html>