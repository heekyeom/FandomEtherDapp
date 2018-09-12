<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>FAN-DOM</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/creative.min.css" rel="stylesheet">
<link href="css/superslides.css" rel="stylesheet">
<link href="css/slides.css" rel="stylesheet">
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://github.com/ethereum/web3.js/blob/develop/dist/web3.min.js"></script>
<script>
var masterAddr='0xef6dda3227775c7ba5a2751753694216587ebe41'
var web3=new Web3(web3.currentProvider)
var account=web3.eth.accounts[0]
var masterABI=[
	{
		"constant": false,
		"inputs": [
			{
				"name": "deleteCrowdAddress",
				"type": "address"
			}
		],
		"name": "deleteCrowd",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "showtitles",
		"outputs": [
			{
				"name": "_crowds",
				"type": "address[]"
			},
			{
				"name": "_numTitle",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_idol",
				"type": "string"
			},
			{
				"name": "_title",
				"type": "string"
			},
			{
				"name": "_duration",
				"type": "uint256"
			},
			{
				"name": "_goalAmount",
				"type": "uint256"
			}
		],
		"name": "createCrowdTitle",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	}
]
var crowdABI=[
	{
		"constant": false,
		"inputs": [],
		"name": "checkCrowd",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "ended",
		"outputs": [
			{
				"name": "",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "numInvestors",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "totalAmount",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "goalAmount",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "deadline",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "idol",
		"outputs": [
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "withdraw",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "kill",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "title",
		"outputs": [
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"name": "investors",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "succeeded",
		"outputs": [
			{
				"name": "",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_newOwner",
				"type": "address"
			}
		],
		"name": "changeOwner",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getAddr",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"name": "_idol",
				"type": "string"
			},
			{
				"name": "_title",
				"type": "string"
			},
			{
				"name": "_owner",
				"type": "address"
			},
			{
				"name": "_duration",
				"type": "uint256"
			},
			{
				"name": "_goalAmount",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"payable": true,
		"stateMutability": "payable",
		"type": "fallback"
	}
]
$(function(){
	$('#facilityadd').on('click',function(){
		
	})
})
</script>
</head>

<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">FANDOM</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#about">About</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#services">Services</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#portfolio">Crowd</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header class="masthead text-center text-white d-flex">
		<div class="my-auto">
			<div class="row">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="imgs/title/bts_title.jpg" class="slide-item"
								width="1278" height="700" alt="Cinelli">
						</div>
						<div class="carousel-item">
							<img src="imgs/title/ikon_title.jpg" class="slide-item"
								width="1278" height="700" alt="Surly">
						</div>
						<div class="carousel-item">
							<img src="imgs/title/redvelvet_title.jpg" class="slide-item"
								width="1278" height="700" alt="Cinelli">
						</div>
						<div class="carousel-item">
							<img src="imgs/title/twice_title.jpg" class="slide-item"
								width="1278" height="700" alt="Cinelli">
						</div>
						<div class="carousel-item">
							<img src="imgs/title/winner_title.jpg" class="slide-item"
								width="1278" height="700" alt="Cinelli">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</header>

	<section class="bg-primary" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<h1 class="section-heading text-white">더 안전하고 더 투명한</h1>
					<h2 class="section-heading text-white">블록체인을 활용한 조공 서비스!</h2>
					<hr class="light my-4">
					<p class="text-faded mb-4">아이돌을 위해 모금을 했는데 주최자가 개인적으로 사용하지 않았는지 걱정되나요?</p>
					<p class="text-faded mb-4">->걱정 NO. 모금 주최자가 어디에 썼는지 사이트를 통해 확인할 수 있습니다.</p>
					<p class="text-faded mb-4">목표금액에 도달하지 못했을때 돈을 돌려받고 싶은데 잘 안주나요?</p>
					<p class="text-faded mb-4">->걱정 NO. 목표한 금액에 도달하지 못하면 자동으로 되돌려 드립니다.</p>
					<a class="btn btn-light btn-xl js-scroll-trigger" href="#services">FANDOM을 시작하세요!</a>
				</div>
			</div>
		</div>
	</section>

	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">At Your Service</h2>
					<hr class="my-4">
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box mt-5 mx-auto">
						<i class="fa fa-4x fa-diamond text-primary mb-3 sr-icons"></i>
						<h3 class="mb-3">모금</h3>
						<p class="text-muted mb-0">주소로 이더리움을 보냄으로써 쉽게 모금을 할 수 있습니다.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box mt-5 mx-auto">
						<i class="fa fa-4x fa-paper-plane text-primary mb-3 sr-icons"></i>
						<h3 class="mb-3">페이백</h3>
						<p class="text-muted mb-0">실패한 모금을 빠르게 돌려받을 수 있습니다.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box mt-5 mx-auto">
						<i class="fa fa-4x fa-newspaper-o text-primary mb-3 sr-icons"></i>
						<h3 class="mb-3">이력보기</h3>
						<p class="text-muted mb-0">내가 어떤 모금에 참가했는지 확인할 수 있습니다.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box mt-5 mx-auto">
						<i class="fa fa-4x fa-heart text-primary mb-3 sr-icons"></i>
						<h3 class="mb-3">모금확인</h3>
						<p class="text-muted mb-0">모금의 자세한 내용을 확인할 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="p-0" id="portfolio">
		<div class="container-fluid p-0">
			<div class="row no-gutters popup-gallery">
				<div class="col-lg-3 col-sm-6">
					<div class="portfolio-box" data-toggle="modal"
						data-target="#addCrowd"> <img
						class="img-fluid" src="imgs/idol/bts_logo.jpg" width="500" height="500" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">BTS</div>
								<div class="project-name">지하철 생일 축하 광고</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="portfolio-box" data-toggle="modal"
						data-target="#addCrowd"> <img
						class="img-fluid" src="imgs/idol/ikon_logo.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Ikon</div>
								<div class="project-name">해외 공연 따라가서 사직찍기</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-sm-6">
					<div class="portfolio-box" data-toggle="modal"
						data-target="#addCrowd"> <img
						class="img-fluid" src="imgs/idol/redvelvet_logo.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">RedVelvet</div>
								<div class="project-name">웬디 생일 선물</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="portfolio-box" data-toggle="modal"
						data-target="#addCrowd"> <img
						class="img-fluid" src="imgs/idol/twice_logo.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Twice</div>
								<div class="project-name">공연장으로 도시락 보내기</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="portfolio-box" data-toggle="modal"
						data-target="#addCrowd"> <img
						class="img-fluid" src="imgs/idol/winner_logo.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Winner</div>
								<div class="project-name">Winner</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="portfolio-box" data-toggle="modal"
						data-target="#addCrowd"> <img
						class="img-fluid" src="imgs/idol/redvelvet_logo.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">RedVelvet</div>
								<div class="project-name">생일 축하 팬미팅</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="portfolio-box" data-toggle="modal"
						data-target="#addCrowd"> <img
						class="img-fluid" src="imgs/idol/twice_logo.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Twice</div>
								<div class="project-name">다현 생일 선물</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="portfolio-box" data-toggle="modal"
						data-target="#addCrowd"> <img
						class="img-fluid" src="imgs/idol/bts_logo.jpg" width="500" height="500" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">BTS</div>
								<div class="project-name">포토북 제작</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="portfolio-box" data-toggle="modal"
						data-target="#addCrowd"> <img
						class="img-fluid" src="imgs/idol/twice_logo.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Twice</div>
								<div class="project-name">일본 태풍 피해 기부금</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="portfolio-box" data-toggle="modal"
						data-target="#addCrowd"> <img
						class="img-fluid" src="imgs/idol/ikon_logo.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Ikon</div>
								<div class="project-name">그냥 돈을 모읍시다..</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="bg-dark text-white">
		<div class="container text-center">
			<h2 class="mb-4">지금 바로 FANDOM을 시작하세요! 아래 버튼을 누르면 모금을 만들 수 있습니다.</h2>
			<button class="btn btn-light btn-xl sr-button"
				data-toggle="modal"
				data-target="#addCrowd">모금 생성</button>
		</div>
	</section>

	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<h2 class="section-heading">문의사항이 있으신가요?!</h2>
					<hr class="my-4">
					<p class="mb-5">개선한 내용이나 문의사항이 있으면 즉시 개발자에게 메일을 보내주세요! 최대한 빨리 해결해 드릴게요!</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 ml-auto text-center">
					<i class="fa fa-phone fa-3x mb-3 sr-contact"></i>
					<p>010-6285-0000</p>
				</div>
				<div class="col-lg-4 mr-auto text-center">
					<i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i>
					<p>
						<a href="mailto:your-email@your-domain.com">khk2870@gmail.com</a>
					</p>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="registCrowd.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<!-- Custom scripts for this template -->
	<script src="js/creative.min.js"></script>
</body>

</html>
