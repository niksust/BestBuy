<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Product Details | BestBuy</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/css/prettyPhoto.css" rel="stylesheet">
<link href="resources/css/price-range.css" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
</head>

<body>
		<header>
			<%@include file="template/header.jsp"%>
		</header>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="product-details">
						<!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="resources/images/home/${product.productId}.jpg" alt="" />
								<h3>ZOOM</h3>
							</div>
							<div id="similar-product" class="carousel slide"
								data-ride="carousel">

								<!-- Wrapper for slides -->
								<div class="carousel-inner">
									<div class="item active">
										<a href=""><img
											src="resources/images/product-details/similar1.jpg" alt=""></a>
										<a href=""><img
											src="resources/images/product-details/similar2.jpg" alt=""></a>
										<a href=""><img
											src="resources/images/product-details/similar3.jpg" alt=""></a>
									</div>
									<div class="item">
										<a href=""><img
											src="resources/images/product-details/similar1.jpg" alt=""></a>
										<a href=""><img
											src="resources/images/product-details/similar2.jpg" alt=""></a>
										<a href=""><img
											src="resources/images/product-details/similar3.jpg" alt=""></a>
									</div>
									<div class="item">
										<a href=""><img
											src="resources/images/product-details/similar1.jpg" alt=""></a>
										<a href=""><img
											src="resources/images/product-details/similar2.jpg" alt=""></a>
										<a href=""><img
											src="resources/images/product-details/similar3.jpg" alt=""></a>
									</div>

								</div>

								<!-- Controls -->
								<a class="left item-control" href="#similar-product"
									data-slide="prev"> <i class="fa fa-angle-left"></i>
								</a> <a class="right item-control" href="#similar-product"
									data-slide="next"> <i class="fa fa-angle-right"></i>
								</a>
							</div>

						</div>
						<div class="col-sm-7">
							<div class="product-information">
								<!--/product-information-->
								<img src="resources/images/product-details/new.jpg"
									class="newarrival" alt="" />
								<c:set var="product" value="${product}" />
								<c:url var="add" value="/addProduct">
									<c:param name="productId" value="${product.productId}" />
								</c:url>
								<c:url var="addToWishlist" value="/addToWishlist">
									<c:param name="productId" value="${product.productId}" />
								</c:url>
								<div class="product-title">
									<h2>
										<c:out value="${product.name}" />
									</h2>
								</div>
								<p>Web ID: 1089772</p>
								<span> <span class="product-price"> <c:out
											value="Tk.${product.price}" />
								</span> <a href="${add}" role="button" class="btn btn-default cart">
										<i class="fa fa-shopping-cart"></i> Add to cart
								</a> <a href="${addToWishlist}" role="button"
									class="btn btn-default cart"> <i class="fa fa-star"></i>
										Add to Wishlist
								</a>
								</span>
								<p>
									<b>Availability:</b> In Stock
								</p>
								<p>
									<b>Brand:</b>
									<c:out value="${product.manufacturer}" />
								</p>
								<a href=""><img
									src="resources/images/product-details/share.png"
									class="share img-responsive" alt="" /></a>
							</div>
							<!--/product-information-->
						</div>
					</div>
					<!--/product-details-->
					<c:choose>
						<c:when test="${not empty customer}">
							<div class="category-tab shop-details-tab">
								<div class="col-sm-12">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#reviews" data-toggle="tab">Reviews(<c:out
													value="${fn:length(reviewsList)}" />)
										</a></li>
									</ul>
								</div>
								<div class="tab-content">
									<div class="tab-pane fade active in" id="reviews">
										<div class="col-sm-12">
											<div>
												<c:forEach var="reviewMap" items="${reviewsList}">
													<c:set var="customer" value="${reviewMap.key}" />
													<c:set var="review" value="${reviewMap.value}" />
													<ul>
														<li><a href="account"><i class="fa fa-user"></i>
																<c:out value="${customer.userName}" /></a></li>
														<li><a href=""><i class="fa fa-calendar-o"></i> <c:out
																	value="${review.date}" /></a></li>
													</ul>
													<strong> <c:out value="${review.reviewTitle}" />
													</strong>
													<p>
														<c:out value="${review.reviewText}" />
													</p>
												</c:forEach>
											</div>
											<p>
												<b>Write Your Review</b>
											</p>

											<form method="POST" action="reviews/product">
												<input type="hidden" name="productId"
													value="${product.productId}" /> <span> <input
													type="text" name="reviewTitle" placeholder="Review Title" />
													<input type="email" placeholder="Email Address" />
												</span>

												<textarea name="reviewText"></textarea>
												<b>Rating: </b> <select name="rating">
													<option value="Excellent">Excellent</option>
													<option value="Very Good">Very Good</option>
													<option value="Good">Good</option>
													<option value="Not Bad">Not Bad</option>
													<option value="Bad">Bad</option>
												</select>
												<button type="submit" class="btn btn-default pull-right">
													Submit</button>
											</form>
										</div>
									</div>

								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="category-tab shop-details-tab">
								<div class="col-sm-12">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#reviews" data-toggle="tab">Reviews</a></li>
									</ul>
								</div>
								<div class="tab-content">
									<a href="login">Log In to Create a Review</a>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<!--/category-tab-->

				</div>
			</div>
		</div>
	</section>

	<footer id="footer">
		<!--Footer-->
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">BestBuy WEB All rights
						reserved.</p>
					<p class="pull-right">
						Designed by <span><a target="_blank"
							href="http://www.themeum.com">Themeum</a></span>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!--/Footer-->

	<script src="resources/js/jquery-1.8.0.js"></script>
	<script src="resources/js/price-range.js"></script>
	<script src="resources/js/jquery.scrollUp.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.prettyPhoto.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>

