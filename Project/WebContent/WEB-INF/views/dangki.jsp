<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				<div class="content">Đăng Kí</div>
			</h2>
			<form:form class="ui large form" action="main/dangki.htm"
				modelAttribute="user" method="post">
				<div class="ui stacked segment">
					<div class="field">
						<div class="ui left icon input">
							<i class="user icon"></i>
							<form:input type="text" path="iDUser" placeholder="Tài Khoản" />
						</div>
						<div style="color: red">
							<form:errors path="iDUser" />
						</div>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<i class="lock icon"></i>
							<form:input type="password" path="password"
								placeholder="Mật Khẩu" />

						</div>
						<div style="color: red">
							<form:errors path="password" />
						</div>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<i class="user icon"></i>
							<form:input type="text" path="userName"
								placeholder="Tên Người Dùng" />

						</div>
						<div style="color: red">
							<form:errors path="userName" />
						</div>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<i class="user icon"></i>
							<form:input type="email" path="email" placeholder="Email" />
						</div>
						<div style="color: red">
							<form:errors path="email" />
						</div>
					</div>
					<div class="field">
						<h2>${message}</h2>
					</div>
					<button class="ui fluid large blue submit button">Đăng Kí</button>
				</div>
			</form:form>
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