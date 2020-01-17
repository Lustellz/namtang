<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Login</title>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <style type="text/css">

	#textP{
  		font-size:10px; color:red; margin-top: -20px; margin-left:20px;
  	}
  	
  	.pw{
  		margin-top: -20px; margin-left:20px;
  	}
  	
  	#pwSuccess{
  		color:blue; font-size:10px;
  	}
  	
  	#pwFail{
  		color:red; font-size:10px;
  	}
  
  	.login_box_area .login_box_img:before{
  		height:810px;
  	}
  	
  	#userId{
  		 width:280px; display:inline-block; 
  	}
  	
  	#userIdC div:nth-child(1){
  		display:inline-block;	
  	}
	
	
	</style>

	<script type="text/javascript" src="/js/json.js"></script>
	<script type="text/javascript" >

		$(function() {
			$.ajax({
				type : "get" ,
				url : "/api/v1/account/updateAccount",
				dataType : "json",

				success : function(result) {
					console.log(result.statusCode);
					if(result.statusCode === "Success") {
						let obj = JSON.parse(result.message);
						// user 정보 뿌리기
						$("#userName").val(obj.userName);

					} else {
						alert("회원요청이 잘못되었습니다");
					}
				},
				error : function(error) {
					console.log(error);
					alert("오류 발생");
				}
			});//ajax끝
		})

		$(function(){
			$("#register").click(function(){
				let user = $("#register_form").serializeObject();

				console.log(user);
				$.ajax({
					type : "post" ,
					url : "/api/v1/account/updateUser",
					dataType : "json",
					data : JSON.stringify(user),
					contentType: 'application/json; charset=utf-8',
					success : function(result) {
						console.log(result.statusCode);
						if(result.statusCode === "Success") {
							alert("회원정보가 수정되었습니다");
						} else {
							alert("회원가입이 잘못되었습니다");
						}
					},
					error : function(error) {
						console.log(error);
						alert("오류 발생");
					}
				});//ajax끝
			})
			
			/* 비밀번호 입력 */
	  		/* $("#userPassword").mouseenter(function(){
	  			$("#textP").text("숫자 또는 문자로만 4~12자리 입력하세요.")
	  		});
	  		$("#userPassword").mouseleave(function(){
	  			$("#textP").text(" ");
	  		}); */
	  		
			/* 비밀번호 일치여부*/
			$("#pwSuccess").hide();
			$("#pwFail").hide();
				$("input").keyup(function() {
					var pwd1 = $("#userPassword").val();
					var pwd2 = $("#confirmPassword").val();
					if (pwd1 != "" || pwd2 != "") {
						if (pwd1 == pwd2) {
							$("#pwSuccess").show();
							$("#pwFail").hide();
							$("#confirmPassword").blur(function(){
								$("#pwSuccess").hide();
							}); 
							$("#submit").removeAttr("disabled");
						} else {
							$("#pwFail").show();
							$("#pwSuccess").hide();
							$("#submit").attr("disabled", "disabled");
						}
					}
					
				 	//$("#confirmPassword").blur(function(){
						//$("#pw-success").hide();
					//}); 

				});
				
			}); //js 끝
		
		/* 주소찾기 */
	  	function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					$("#postcode1").val(data.postcode1);
					$("#postcode2").val(data.postcode2);
					$("#zonecode").val(data.zonecode);
					$("#address").val(data.address);
					$("#address_etc").focus();
					console.log(data);
				}
			}).open();
		}

	</script>

</head>
<body>
  
  <!-- ================ start banner area ================= -->	
<%--	<section class="blog-banner-area" id="category">--%>
<%--		<div class="container h-100">--%>
<%--			<div class="blog-banner">--%>
<%--				<div class="text-center">--%>
<%--					<h1>Register</h1>--%>
<%--					<nav aria-label="breadcrumb" class="banner-breadcrumb">--%>
<%--            <ol class="breadcrumb">--%>
<%--              <li class="breadcrumb-item"><a href="#">Home</a></li>--%>
<%--              <li class="breadcrumb-item active" aria-current="page">Register</li>--%>
<%--            </ol>--%>
<%--          </nav>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--    </div>--%>
<%--	</section>--%>
	<!-- ================ end banner area ================= -->
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>로그아웃 하시겠어요?</h4>
							<p>로그아웃을 하시려면 버튼을 눌러주세요.</p>
							<a class="button button-account" href="login">로그아웃</a>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>개인정보 수정</h3>
						<form class="row login_form" action="/#" id="register_form" method="post">
							<div class="col-md-12 form-group" id="userIdC">
								<input type="text" class="form-control" id="userId" name="userId" placeholder="기존 비밀번호" onblur="this.placeholder = '기존 비밀번호'">
								<input type="button" id="confirmId" name="confirmId" class="confirmId" value="중복확인" >	
			                </div>
			                
			                <div class="check_font" id="checkId"></div>
			                <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="userPassword" name="password" placeholder="새로운 비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '새로운 비밀번호'">
			                </div>
			                <p id="textP"></p>
			                <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="새로운 비밀번호 확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '새로운 비밀번호 확인'">
							</div>
							<div class="pw" id="pwSuccess">비밀번호가 일치합니다.</div>
							<div class="pw" id="pwFail">비밀번호가 일치하지 않습니다.</div>
							<!-- <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일 주소" onblur="this.placeholder = '이메일 주소'">
			                </div> -->
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="userName" name="userName" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="전화번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '전화번호'">
							</div>
							<div class="col-md-12 form-group">
								
								<input type="text" id="userPost" name="userPost" style="width:278px;" value="우편번호" readonly/>
								<input type="button" onClick="openDaumZipAddress()" value = "주소 찾기" />
								<br/>
								<input type="text" id="userAddress" name="userAddress" style="width:355px;" value="주소" readonly/>
								<input type="text" id="userAddressDetail" name="userAddressDetail" style="width:355px;" placeholder="상세주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '상세주소'"/>
							</div>
							<input type="checkbox" id="checkPersonalDate"><a href="https://hankkuu.tistory.com/77?category=1062143" id="personalDate" target="_blank">개인정보 수집 및 활용 동의</a>
							<div class="col-md-12 form-group">
								<button type="button" value="button" class="button button-register w-100">개인정보 수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->

</body>
</html>