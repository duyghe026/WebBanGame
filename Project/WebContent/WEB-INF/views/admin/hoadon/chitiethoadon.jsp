<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
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
					<div>Trang Ch???</div>
				</a> <a href="admin/logout.htm" class="item">
					<div>????ng xu???t</div>
				</a>
			</div>
		</div>

		<div class="item">
			<div class="header">Qu???n L??</div>
			<div class="menu">
				<a href="admin/user/index.htm" class="item">
					<div>Qu???n L?? User</div>
				</a> <a href="admin/hanghoa/index.htm" class="item">
					<div>Qu???n L?? H??ng H??a</div>
				</a> <a href="admin/hoadon/index.htm" class="item">
					<div>Qu???n L?? H??a ????n</div>
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
								<th>M?? Chi Ti???t H??a ????n</th>
								<th>M?? H??a ????n</th>
								<th>M?? H??ng H??a</th>
								<th>S??? L?????ng</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${hoaDon.dsCTHoaDon}">
								<tr>
									<td>${u.maCTHoaDon}</td>
									<td>${u.hoaDon.maHoaDon}</td>
									<td>${u.hangHoa.maHangHoa}</td>
									<td>${u.soLuong}</td>
									<td><a
										href="admin/hoadon/chitiethoadon/${maHoaDon}/update/${u.maCTHoaDon}.htm"><button
												class="ui green basic button">S???a</button></a></td>
									<td><a
										href="admin/hoadon/chitiethoadon/${maHoaDon}/delete/${u.maCTHoaDon}.htm"><button
												class="ui red basic button">X??a</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="admin/hoadon/index.htm"><div
							class="ui right floated button">Tr??? L???i</div></a> ${message}
				</div>
			</div>
			<div class="ui grid stackable padded">
				<form:form class="ui form"
					action="admin/hoadon/chitiethoadon/${maHoaDon}/insert.htm"
					method="post" modelAttribute="cTHoaDon">
					<form:input path="HoaDon.maHoaDon" value="${maHoaDon}"
						type="hidden" />
					<div class="field">
						<label>M?? H??ng H??a</label>
						<form:select path="HangHoa.maHangHoa" items="${dsHangHoa}"
							itemValue="maHangHoa" itemLabel="tenHangHoa" />
					</div>
					<div class="field">
						<label>S??? L?????ng</label>
						<form:input path="soLuong" type="number" min="1"/>
					</div>
					<div class="field">
						<button class="ui button">Save</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>