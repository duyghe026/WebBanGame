<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>FrontendFunn - Semantic UI - Sample Admin Dashboard
	Template</title>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"
	integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q="
	crossorigin="anonymous" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css"
	integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ="
	crossorigin="anonymous" />
<style type="text/css">
@import
	url("https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap")
	;

:root { -
	-tablet: 768px; -
	-smallMonitor: 992px; -
	-largeMonitor: 1200px; -
	-font-family: 'Open Sans', sans-serif;
}

body {
	font-family: var(- -font-family) !important;
}

body ::-webkit-scrollbar {
	width: 6px;
}

.ui.vertical.menu.sidebar-menu {
	margin-top: 0px !important;
	max-height: calc(100% - 0px) !important;
	height: calc(100% - 0px) !important;
}

.ui.vertical.menu.sidebar-menu .item i.icon {
	float: left;
	margin: 0em 0.5em 0em 0em;
}

.main-content {
	margin-top: 40px;
}

@media ( min-width : 768px) {
	.ui.vertical.menu.sidebar-menu {
		visibility: visible;
		-webkit-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
		width: 15rem !important;
	}
	.main-content {
		margin-left: 15rem;
	}
	.sidebar-menu-toggler {
		display: none !important;
	}
}
</style>
</head>
<body>
	<div class="ui sidebar inverted vertical menu sidebar-menu"
		id="sidebar">
		<div class="item">
			<div class="header">Administration</div>
			<div class="menu">
				<a href="admin/admin.htm" class="item">
					<div>Trang Chủ</div>
				</a> <a href="admin/logout.htm" class="item">
					<div>Đăng xuất</div>
				</a>
			</div>
		</div>

		<div class="item">
			<div class="header">Quản Lý</div>
			<div class="menu">
				<a href="admin/user/index.htm" class="item">
					<div>Quản Lý User</div>
				</a> <a href="admin/hanghoa/index.htm" class="item">
					<div>Quản Lý Hàng Hóa</div>
				</a> <a href="admin/hoadon/index.htm" class="item">
					<div>Quản Lý Hóa Đơn</div>
				</a>
			</div>
		</div>

		<a href="admin/admin.htm" class="item">
			<div>
				<i class="icon chart line"></i> Charts
			</div>
		</a>
	</div>
	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="column">
					<form class="ui form" action="admin/hanghoa/insert.htm"
						method="post" enctype="multipart/form-data">
						<div class="ui two column centered grid">
							<div class="column">
								<label>Mã Hàng Hóa</label>
								<form:input type="text" path="hangHoa.maHangHoa" />
								<div style="color: red">
									<form:errors path="hangHoa.maHangHoa" />
								</div>
							</div>
							<div class="column">
								<label>Tên Hàng Hóa</label>
								<form:input path="hangHoa.tenHangHoa" />
								<div style="color: red">
									<form:errors path="hangHoa.tenHangHoa" />
								</div>
							</div>
							<div class="column">
								<label>Đơn Giá</label>
								<form:input type="number" path="hangHoa.donGia" value="1000"
									min="1000" />
							</div>
							<div class="column">
								<label>Giảm Giá</label>
								<form:input type="number" path="hangHoa.giamGia" value="0"
									min="0" />
								<div style="color: red">
									<form:errors path="hangHoa.giamGia" />
								</div>
							</div>
							<div class="column">
								<label>Thể Loại</label>
								<form:select path="hangHoa.theLoai.maLoai" items="${dsLoai}"
									itemValue="maLoai" itemLabel="tenLoai" />
							</div>
							<div class="column">
								<label>Tình Trạng</label>
								<form:select path="hangHoa.tinhTrang">
									<form:option value="1">Bán</form:option>
									<form:option value="0">Không Bán</form:option>
								</form:select>
							</div>
							<div class="column">
								<label>Hình ảnh</label> <input type="file" name="photo">
								<div style="color: red">${message1}</div>
							</div>
							<div class="column"></div>
							<div class="column"></div>
						</div>
						<div>
							<button class="ui button" type="submit">Thêm</button>
							<a href="admin/hanghoa/index.htm"><div class="ui button">Trở
									Lại</div></a> ${message}
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>