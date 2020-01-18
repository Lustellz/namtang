<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .left-box {
            background: red;
            float: left;
            width: 50%;
        }

        .right-box {
            background: blue;
            float: right;
            width: 50%;
        }
    </style>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawStuff);

        function drawStuff() {
            var dataArray = [['날짜', '매출액', '방문수']];
            <c:forEach  items="${list}" var="liststr" >
            dataArray.push(["${liststr.saleDate}", ${liststr.salePrice}, ${liststr.userCount}]);
            </c:forEach>
            var button = document.getElementById('change-chart');
            var chartDiv = document.getElementById('chart_div');

            var data = google.visualization.arrayToDataTable(dataArray);

            var materialOptions = {
                width: 900,
                chart: {
                    title: '일별 매출 및 방문수',
                    subtitle: '일별 매출 및 방문수 그래프'
                },
                series: {
                    0: {axis: '매출'}, // Bind series 0 to an axis named 'distance'.
                    1: {axis: '방문수'} // Bind series 1 to an axis named 'brightness'.
                },
                axes: {
                    y: {
                        distance: {label: 'parsecs'}, // Left y-axis.
                        brightness: {side: 'right', label: 'apparent magnitude'} // Right y-axis.
                    }
                }
            };

            var classicOptions = {
                width: 900,
                series: {
                    0: {targetAxisIndex: 0},
                    1: {targetAxisIndex: 1}
                },
                title: '일별 매출 및 방문수 그래프',
                vAxes: {
                    // Adds titles to each axis.
                    0: {title: '매출'},
                    1: {title: '방문수'}
                }
            };

            function drawMaterialChart() {
                var materialChart = new google.charts.Bar(chartDiv);
                materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
                button.innerText = 'Change to Classic';
                button.onclick = drawClassicChart;
            }

            function drawClassicChart() {
                var classicChart = new google.visualization.ColumnChart(chartDiv);
                classicChart.draw(data, classicOptions);
                button.innerText = 'Change to Material';
                button.onclick = drawMaterialChart;
            }

            drawMaterialChart();
        };

        <!--사이드바 -->
        function w3_open() {
            document.getElementById("mySidebar").style.display = "block";
        }

        function w3_close() {
            document.getElementById("mySidebar").style.display = "none";
        }
        
        $(function () {
     		 $.ajax({
     			 url: "${pageContext.request.contextPath}/admin/getlist", //서버요청주소
     			 type:"post", //요청방식(get|post|put:patch:delete)
     			 dataType:"json", //서버가 보내온 데이터 타입(text,html,xml,json)
     			 data:"${_csrf.parameterName}=${_csrf.token}",
     			 success:function(result){
     				 /*
     				var data="<table border='1' cellpadding='5'> 실시간 구매자 정보 ";
     				<c:forEach var="i" begin="0" end="15">
     				
     				 data+="<tr>";
					    data+="<td>"+result.get(i).userIdx+"</td>";
						data+="<td>"+result.purchaseOrderIdx+"</td>";
						data+="<td>"+result.deliveryAddress+"</td>";
						data+="<td>"+result.updateDate+"</td>";
						data+="<td>"+result.billKey+"</td>";
						data+="</tr>";

     			</c:forEach>
     			*/
     				 var data="<table border='1' cellpadding='5'> 실시간 구매자 정보 ";
					 $.each(result, function(index, item){
						 data+="<tr>";
						    data+="<td>"+item.userIdx+"</td>";
							data+="<td>"+item.purchaseOrderIdx+"</td>";
							data+="<td>"+item.deliveryAddress+"</td>";
							data+="<td>"+item.updateDate+"</td>";
							data+="<td>"+item.billKey+"</td>";
							data+="</tr>";
						
					 }) 
					data+="</table>";
					
					$("#memberListView").html(data);
 				   
     			 } ,//성공했을대
     			 error:function(err){
     				 alert(err+"오류 발생..");
     			 }//오류발생했을때
     		 }); 
		})
    </script>
</head>
<body>
<div class="w3-sidebar w3-bar-block w3-collapse w3-card w3-animate-left" style="width:10%;" id="mySidebar">
    <button class="w3-bar-item w3-button w3-large w3-hide-large" onclick="w3_close()">Close &times;</button>
    <a href="dashBoard" class="w3-bar-item w3-button">종합 통계</a>
    <a href="상세 통계" class="w3-bar-item w3-button">상세 통계</a>
    <a href="회원 상품 통계" class="w3-bar-item w3-button">회원 상품 통계</a>
    <a href="/logout" class="w3-bar-item w3-button">Logout</div>
    
</a>
<div style="margin-left:10%; ">
    현재 관리자 번호 : ${pageContext.request.userPrincipal.name}<br>
	
</div>
<div style="margin-left:10%; height: 100%">
    <div style=" margin-left:10%;">
        <h1>종합 통계</h1>
        <button id="change-chart">Change to Classic</button>
        <div id="chart_div" style="width: 50%; height: 20%;"></div>
    </div>
	<div></div>
	
<div id="memberListView"> 실시간 구매자 정보 <br></div>

</div>
</body>
</html>