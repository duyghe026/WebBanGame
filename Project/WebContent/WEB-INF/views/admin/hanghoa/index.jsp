<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
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
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Mã Hàng Hóa</th>
								<th>Ảnh</th>
								<th>Tên Hàng Hóa</th>
								<th>Đơn Giá</th>
								<th>Giảm Giá</th>
								<th>Thể Loại</th>
								<th>Tình Trạng</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dshangHoa}">
								<tr>
									<td>${u.maHangHoa}</td>
									<td><img src="images/${u.anh}"
										style="width: 100px; height: 100px" alt="" /></td>
									<td>${u.tenHangHoa}</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.donGia}"/> đ</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.giamGia}"/> đ</td>
									<td>${u.theLoai.tenLoai}</td>
									<td>${u.tinhTrang==false?'Ẩn':'Bán'}</td>
									<td><a href="admin/hanghoa/update/${u.maHangHoa}.htm"><button
												class="ui green basic button">Sửa</button></a></td>
									<td><a href="admin/hanghoa/delete/${u.maHangHoa}.htm"><button
												class="ui negative basic button">Xóa</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="admin/hanghoa/insert.htm"><div class="ui button">Thêm</div></a>
					${message}
				</div>
			</div>
		</div>
	</div>
</body>
</html>