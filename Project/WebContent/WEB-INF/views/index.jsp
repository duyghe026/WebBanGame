<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<head>
<title>STEAM SHOP</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"
	integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q="
	crossorigin="anonymous" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css"
	integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ="
	crossorigin="anonymous" />
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../css/slider.css" rel="stylesheet" type="text/css"
	media="all" />

</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="headertop_desc">
				<div class="account_desc">
					<ul>
						<li><a href="timkiem.htm">Tìm Kiếm</a></li>
						<c:if test="${user != null}">
							<li><a href="logout.htm">Đăng Xuất</a></li>
							<li><a href="taikhoan.htm">Tài Khoản</a></li>
						</c:if>
						<c:if test="${user == null}">
							<li><a href="login.htm">Đăng Nhập</a></li>
							<li><a href="dangki.htm">Đăng kí</a></li>
						</c:if>						
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div class="header_top">
				<div class="logo">
					<a href="index.htm"><img src="../images/STEAM_logo.png" alt="" /></a>
				</div>
				<div class="cart">
					<a href="giohang.htm"><img src="../images/giohang.png"
						style="width: 70px; height: 70px" alt="" /></a>
				</div>
				<div class="clear"></div>
			</div>
			<div class="header_slide">
				<div class="header_bottom_right">
					<div class="slider" style="width: 75rem;">
						<img src="../images/Game.jpg" alt="learn more" />
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="main">
			<div class="content">
				<div class="section group">
					<c:forEach var="u" items="${dsHangHoa}">
						<form action="addtocart/${u.maHangHoa}.htm" method="post">
							<div class="grid_1_of_4 images_1_of_4">
								<div class="ui fluid image">
									<a class="ui blue right ribbon label"> <i>-${u.phanTram}%</i>
									</a><img src="../images/${u.anh}"
										style="width: 212px; height: 212px" alt="" />
								</div>
								<h2>${u.tenHangHoa}</h2>
								<div class="price-details">
									<div class="price-number">
										<p>
											<span class="rupees"><f:formatNumber type="currency"
													maxFractionDigits="0" currencySymbol=""
													value="${u.donGia  - u.giamGia}" /> đ</span>
										</p>
									</div>
									<div class="add-cart">
										<h4>

											<button>Add to Cart</button>
										</h4>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</form>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>