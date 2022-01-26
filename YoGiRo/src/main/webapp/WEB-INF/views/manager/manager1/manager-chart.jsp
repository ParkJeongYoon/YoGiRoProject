<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <script src="https://kit.fontawesome.com/79203d0d3b.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		
			<jsp:include page="../../includes/header.jsp"></jsp:include>
		
		
			
		<div class="middle-container">
			<aside>
				
				 <div class="sidemenubar">
				         <a href="${pageContext.request.contextPath}/manager/manager1/manager-chart"><div><h3>방문자수 통계</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager2/manager-que"><div><h3>문의내역 보기</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager3/manager-member"><div><h3>회원관리</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager4/manager-block-member"><div><h3>차단회원 관리</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager5/manager-community"><div><h3>게시글 관리</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager6/manager-delete-community"><div><h3>삭제된 게시글 관리</h3><i class="fas fa-angle-right"></i></div></a>
				 </div>
		   </aside>
		   <main>
		   		<div class="main2">
		   			<h1>방문자 수</h1>
		   			<div class="chart-text">
		   				<div>	
		   					<h3>오늘 방문자 수 </h3>
		   					<p>321</p>
		   				</div>
		   				<div>
		   					<h3>총 방문자 수 </h3>
		   					<p>4711</p>
		   				</div>
		   			</div>
				   
				   	
				   	<div class="chart-box"> 
				   		 <div>
					        <canvas id="myChart" style="width:600px; height:500px;"></canvas>
					     </div>
					
					     <div>
					        <canvas id="myChart2" style="width:600px; height:500px;"></canvas>
					     </div>
				   		
				   	</div>
				 </div>  
		   </main>
		</div>	 
			<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
	<script>
    // 우선 컨텍스트를 가져옵니다. 
    var ctx = document.getElementById("myChart").getContext('2d');
    var ctx2 = document.getElementById("myChart2").getContext('2d');
    /*
    - Chart를 생성하면서, 
    - ctx를 첫번째 argument로 넘겨주고, 
    - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
    */

    // 차트 그리기
    var myChart = new Chart(ctx, {
        type: 'bar', // 차트 타입 지정
        data: {
            labels: ["01.16", "01.17", "01.18", "01.19", "01.20", "01.21",
            		 "01.22", "01.23", "01.24", "01.25", "01.26", "01.27",
            		 "01.28", "01.29", "01.30", "01.31"], // 데이터 라벨(제목)
            datasets: [{
                label: '1월 하반기 방문자 수', // 데이터 시트 제목
                data: [800, 1300, 1600, 2050, 1860, 2400 , 2020, 1730], // 데이터 : 1월 ~ 6월
                backgroundColor: [ // 막대 배경 색상
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)'
                  
                  
                ],
                borderColor: [ // 막대 테두리 색상
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'
                    
                    
                ],
                borderWidth: 1 // 막대 테두리 굵기 설정
            }]
        },
        options: {
            title:{
                display : true,
                text: '상반기 방문자 수 통계',
            },
            maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });

    var myChart = new Chart(ctx2, {
        type: 'bar', // 차트 타입 지정
        data: {
            labels: ["1월", "2월", "3월", "4월", "5월", "6월"], // 데이터 라벨(제목)
            datasets: [{
                label: '희망 월별 상반기 방문자 수', // 데이터 시트 제목
                data: [800, 1300, 1600, 2050, 1860, 2400], // 데이터 : 1월 ~ 6월
                backgroundColor: [ // 막대 배경 색상
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [ // 막대 테두리 색상
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1 // 막대 테두리 굵기 설정
            }]
        },
        options: {
            title:{
                display : true,
                text: '상반기 방문자 수 통계',
            },
            maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
    </script>
</body>
</html>