<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<base href="${pageContext.servletContext.contextPath}/">
<title>FrontendFunn - Semantic UI - Sample Admin Dashboard
	Template</title>

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
					<form class="ui form" action="admin/xem.htm" method="post">
						<div class="field">
							<label>Từ Ngày</label> <input name="tuNgay" type="date" /> <label>Tới
								Ngày</label> <input name="toiNgay" type="date" />
						</div>
						<button class="ui button">Xem Doanh Thu</button>
					</form>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<c:if test="${tongTien > 0}">
						<div class="ui massive label">
							<div style="color: red">
								<f:formatNumber type="currency" maxFractionDigits="0"
									currencySymbol="" value="${tongTien}" />
								đ
							</div>
						</div>
					</c:if>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<table class="ui blue table">
						<thead>
							<tr>
								<th>Mã Hóa Đơn</th>
								<th>Ngày Bán</th>
								<th>Tổng Tiền</th>
								<th>Mã Khách Hàng</th>
								<th>Tình Trạng</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${dsHoaDon}">
								<tr>
									<td>${u.maHoaDon}</td>
									<td>${u.ngayBan}</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.tongTien}" /> đ</td>
									<td>${u.user.iDUser}</td>
									<td>${u.tinhTrang==false?'Chưa Thanh Toán':'Đã Thanh Toán'}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>