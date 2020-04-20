<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.menubar.controller.*, 
				com.kh.menubar.controller.TopMovieDto,
				com.kh.movie.model.service.MovieService,
				com.kh.menubar.controller.NewMoviesDto" %>    
<%

	List<TopMovieDto> tmdSlide = new MovieService().topFiveMovies(2);
	List<TopMovieDto> tmdPoster = new MovieService().topFiveMovies(0);
	List<NewMoviesDto> nm = new MovieService().newMovies();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		height:1600px;
		width:1200px;
		margin:auto;
		margin-top:50px;
		
	}
	#movieChart{
		width:50px;
		height:50px;
		margin-top:70px;
		margin-left:50px;
		color:black;
	}
	#name1{
		width:200px;
		font-size:30px;
		font-weight:bold;
		display:inline-block;
		float:left;
	}
	
	#movieMain{
		border:1px solid black;
		width:450px;
		height:650px;
		margin-top:100px;
		position:static;
		
	}
	.movieSub{
		border:1px solid black;
		width:300px;
		height:300px;
	}
	
	#movieSub1{
		margin-top:-655px;
		margin-left:550px;
	}
	#movieSub2{
		margin-left:900px;
		margin-top:-300px;
	}
	#movieSub3{
		margin-left:550px;
		margin-top:50px;
	}
	#movieSub4{
		margin-left:900px;
		margin-top:-300px
		}
	#commingSoon{
		width:50px;
		height:50px;
		margin-top:100px;
		margin-left:50px;
		color:black;
	}
		#name2{
		width:200px;
		font-size:30px;
		font-weight:bold;
		display:inline-block;
		float:left;
		color:black;
	}
	.commingMovieChart{
		border:1px solid black;
		width:250px;
		height:250px;
		float:left;
		margin:20px;
	}
	#nowList{
		width:300px;
		height:400px;
		border:1px solid black;
		margin-left:950px;
		margin-top:-500px;
	}
	.movie:hover{cursor:pointer;opacity:0.7;}
	.commingMovieChart:hover{cursor:pointer;opacity:0.7;}
	
	.movie-news:after{content:""; display: block; clear: both;}
        .movie-news > p {font-size: 35px; font-weight: 700; padding: 20px; padding-left: 40px;}
        .movie-new { width: 22%; height: 250px; float: left; margin-left:4%; margin-top:1%}
        .movie-new.first{margin-left:0;}
        .movie-new a { display:block; text-align:center; cursor: pointer;}
        .movie-new a img {display:inline-block; width: 150px; height: 200px; background: lightsteelblue;}
        .movie-new .cont {padding:0 30px; color:#000}
        .movie-new .cont p {margin:7px; font-weight: 700;}
</style>
</head>
<body>


	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
	<br clear="both">
	<div id="movieChart">
		<img src="<%=contextPath %>/resources/images/movieChart2.png" width="50px" height="50px" align="center">
		<div id="name1">Movie Chart
		<img src="<%=contextPath %>/resources/images/line.png" width="300px" height="20px" >
		</div>
	</div>
		<br clear="both">

						<!-- Thumbnails -->
							<form action="<%=contextPath%>/movieDetail.mo">
							<% if(tmdPoster.size()>= 5){%>
							
								<div class="movie" id="movieMain">
									<input type="hidden" value="1" name="topMovieThumbnail">
									<img src="<%=contextPath %>/resources/images/<%= tmdPoster.get(0).getModifyName() %>" width="450px" height="650px">
								</div>
								
								
								
								<div class="movieSub movie" id="movieSub1">
									<input type="hidden" value="2">
									<img src="<%=contextPath %>/resources/images/<%= tmdPoster.get(1).getModifyName() %>" width="300" height="300">
								</div>
								<div class="movieSub movie" id="movieSub2">
									<input type="hidden" value="3">
									<img src="<%=contextPath %>/resources/images/<%= tmdPoster.get(2).getModifyName() %>" width="300" height="300">
								</div>
								<div class="movieSub movie" id="movieSub3">
									<input type="hidden" value="4">
									<img src="<%=contextPath %>/resources/images/<%= tmdPoster.get(3).getModifyName() %>" width="300" height="300">
								</div>
								<div class="movieSub movie" id="movieSub4">
									<input type="hidden" value="5">
									<img src="<%=contextPath %>/resources/images/<%= tmdPoster.get(4).getModifyName() %>" width="300" height="300">	
								</div>
								<%} %>
							</form>
							
							<br clear="both"><br>
							
				<script>
				
					$(".movie").click(function(){
						
						var value = $(this).children().eq(0).val();
						
						console.log(value);
						
						location.href="<%=contextPath%>/movieDetail.mo?movieNo=" + value;
						
					});
				
				</script>
							
		<div id="commingSoon">	
			<img src="<%=contextPath %>/resources/images/movieChart2.png" width="50px" height="50px" align="center">
			<div id="name2">CommingSoon
				<img src="<%=contextPath %>/resources/images/line.png" width="300px" height="20px" >
			</div>
		</div>		
		<br clear="both"><br><br>
		
		<form>
		<% boolean isFirst = true;
		for(NewMoviesDto nmd: nm) { %>
 	   <div class="movie-new <%= isFirst ? "first" : "" %>">
	      <a href="<%=contextPath%>/detail.mo?movieNo=<%=nmd.getMovieNo()%>">
	      	<img src="<%= request.getContextPath() %>/resources/images/<%= nmd.getModifyName() == null ? "noImageMain.jpg" : nmd.getModifyName() %>"
	      		 alt="no-image"/>
	      </a>
	      <div class="cont">
	        <p>영화제목 : <%= nmd.getTitle() %></p>
	        <p>영화개봉일 : <%= nmd.getOnDate() %> </p>
	      </div>
    	</div>
	<%} %>
	<% for (int i = 0; i < 4 - nm.size(); i++) { %>
	 	   <div class="movie-new <%= isFirst ? "first" : "" %>">
	      <a style="cursor:default;"><img src="<%= request.getContextPath() %>/resources/images/noImageMain.jpg" alt="no-image" /></a>
	      <div class="cont">
	        <p>영화제목 : 미개봉 </p>
	        <p>영화개봉일 : 미개봉 </p>
	      </div>
    	</div>
	<% } %>
	
		</form>
		
		<br clear="both">
</div>

						
<%@ include file="/views/common/footer.jsp" %>						
</body>
</html>