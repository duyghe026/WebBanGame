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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"
	integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q="
	crossorigin="anonymous" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css"
	integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ="
	crossorigin="anonymous" />
<base href="${pageContext.servletContext.contextPath}/">
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
			<div class="header">User</div>
			<div class="menu">
				<a href="main/index.htm" class="item"> Trang Ch??? </a> <a
					href="main/lichsu.htm" class="item"> L???ch S??? </a> <a
					href="main/logout.htm" class="item"> ????ng xu???t </a>
			</div>
		</div>
	</div>

	<div class="pusher">
		<div class="main-content">
			<div class="ui grid stackable padded">
				<div class="ui fluid card">
					<div class="content">
						<div class="ui right floated header red">
							<i class="icon shopping cart"></i>
						</div>
						<div class="header">
							<div class="ui red header">M?? ????n H??ng : ${hoaDon.maHoaDon}</div>
						</div>
						<div class="meta">Order</div>
						<div class="description">C??n Nhi???u S???n Ph???m H???p D???n Kh??c B???n
							C?? Th??? Mua</div>
					</div>
					<div class="extra content">
						<div class="ui two buttons">
							<a href="main/index.htm"><button class="ui red button">Ti???p
									T???c Mua H??ng</button></a>
						</div>
					</div>
				</div>
			</div>
			<div class="ui grid stackable padded">
				<div class="column">
					<table class="ui blue table">
						<thead>
							<tr>
								<th>T??n S???n Ph???m</th>
								<th>???nh</th>
								<th>????n Gi??</th>
								<th>Gi???m Gi??</th>
								<th>S??? L?????ng</th>
								<th>Th??nh Ti???n</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${hoaDon.dsCTHoaDon}">
								<tr>
									<td>${u.hangHoa.tenHangHoa}</td>
									<td><img src="images/${u.hangHoa.anh}"
										style="width: 100px; height: 100px" alt="" /></td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.hangHoa.donGia}" /> ??</td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol="" value="${u.hangHoa.giamGia}" /> ??</td>
									<td><div class="large ui buttons">
											<a href="main/tru/${u.maCTHoaDon}.htm"><button
													class="ui button">-</button></a>
											<button class="ui button">${u.soLuong}</button>
											<a href="main/cong/${u.maCTHoaDon}.htm"><button
													class="ui button">+</button></a>
										</div></td>
									<td><f:formatNumber type="currency" maxFractionDigits="0"
											currencySymbol=""
											value="${u.hangHoa.donGia - u.hangHoa.giamGia}" /> ??</td>
									<td><a href="main/xoa/${u.maCTHoaDon}.htm"><button
												class="ui red basic button">X??a</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="main/index.htm"><button class="ui left floated button">Tr???
							L???i</button></a>
					<div class="ui right floated button">
						<div class="ui animated fade button" tabindex="0">
							<div class="visible content">Thanh To??n</div>
							<div class="hidden content">
								<a href="main/thanhtoan.htm"><f:formatNumber type="currency"
										maxFractionDigits="0" currencySymbol=""
										value="${hoaDon.tongTien}" />??</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>