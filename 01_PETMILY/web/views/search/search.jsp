<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.util.List,com.petmily.search.model.vo.PetsitterSearch" %>

<% 
	List<PetsitterSearch> list=(List)request.getAttribute("list");
%>

<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mhindex.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

  <div class="container">
    <nav>
      <div>
        menu
      </div>
    </nav>
    <main>
      <section class="filter_container mt-4 mb-3">
        <div class="row justify-content-center">
          <div class="col-1"></div>
          
          <div class="col-5">
          
          <form action="<%=request.getContextPath()%>/search/locationFinder" method="post">
            <div class="place_container row align-items-center" id="search_box">
            
              <label class="ml-3">장소</label>
              <input type="text" placeholder="동 이름을 검색하세요" name="searchKeyword"/>
            </div>
          </form>
          
          </div>
       
          
          
          <div class="col-1"></div>
        </div>
        <div class="filter_box mt-5">
       
          <article class="filter_btn_box row mt-4">
            <div class="col-1"></div>
            <div class="col-10 row justify-content-between">
              <button type="button" class="btn" onclick="location.replace('<%=request.getContextPath()%>/search/filterProPetsitter')">프로 펫 시터</button>
              <button type="button" class="btn" onclick="location.replace('<%=request.getContextPath()%>/filterSearch/takingDrug')">약물 복용</button>
              <button type="button" class="btn" onclick="location.replace('<%=request.getContextPath()%>/filterSearch/pickup')" >집앞 픽업 가능</button>
              <button type="button" class="btn" onclick="location.replace('<%=request.getContextPath()%>/filterSearch/indoorPlay')" >실내 놀이</button>
              <button type="button" class="btn" onclick="location.replace('<%=request.getContextPath()%>/filterSearch/oldDogCare')">노견 케어</button>
             
            </div>
            <div class="col-1"></div>
          </article>
       
        </div>
      </section>
      <section class="pet_sitter_container border-top">
        <header class="mt-4 row justify-content-center">
          <div class="col-1"></div>
          <div class="col-5">
            <p id="textArea" class="text-dark">해당 지역에 대해 200개 이상의 후기가 있으며, 평점은 5점 만점에 4.7점 입니다.</p>
            <br>
            
            <div class="input-group" style="border:solid 1px #6d7884;">
            
	            <div class="input-group-prepend align-items-center">
	                <span class="input-group-text fas fa-search fa-1x" style="background-color:white; border-style: none;"></span>
	            </div>
	            <form action="<%=request.getContextPath()%>/searchTitle" method="post">
	            	<input class="form-control" style="border-style: none;"  type="text"  placeholder="제목 검색" name="searchTitle" autocomplete="off">
	            </form>
            
         	</div>
            
          </div>
          <div class="col-5">
            <ul class="nav justify-content-end">
              <li class="nav-item inactive" id="popularity" value="popularity">인기순</li>
              <li class="nav-item inactive" id="newestPost">최신 글</li>
            </ul>
            
          </div>
          <div class="col-1"></div>
        </header>
        <section class="mt-5 row justify-content-center">
        
          <div class="col-2">
          </div>
          
          
          <div class="col-8" id="area">
          
          <%for(PetsitterSearch ps:list) {%>
            <div class="pet_sitter_info_container border-top row px-5 py-3">
              <div class="col-6 text-center " >
              
              
                <div id="demo" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
				  </ul>
				  
				  <!-- The slideshow -->
				  <div class="carousel-inner">
				  <% //if(ps.getImgFile()!=null){
				  	for(String img : ps.getImgFile()) {%>
					    <div class="carousel-item active">
					      <img src="<%=request.getContextPath()%>/upload/<%=img %>" alt="" width="320" height="210">
					    </div>
				     <%}
				  	//} %>
				  </div>
				  
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
				</div>
                
              </div>
              <div class="col-6" >
                <div class="row align-items-center">
                <%if(ps.getProPetsitter()!=null&&ps.getProPetsitter().equals("프로펫시터")){ %>
                  <button class="btn btn-outline-secondary rounded-pill" >프로 펫 시터</button>
                  <%} %>
                  <span class="ml-2"><%= ps.getBoardAddress() %></span>
                  <button class="ml-auto bookmark" value=<%=ps.getPetsitterId() %>><i class="far fa-heart"></i></button>
                </div>
                <div class="mt-3">
                  <p class="h6"><%=ps.getBoardTitle() %></p>
                </div>
                <div class="align-items-end row justify-content-between">
                  <div>후기 <%=ps.getReviewCount() %>   </div>
                  <div>
                  <% if(ps!=null){%>
                    <div>소형 <%=ps.getOneDayCareSprice() %></div>
                    <div>중형 <%=ps.getOneDayCareMprice() %></div>
                    <div>대형 <%=ps.getOneDayCareBprice() %></div>
                   <%} %>
                  </div>
                </div>
              </div>
            </div>
            
            <% } %>
            
            <hr>
            
            <div class="row justify-content-center">
                  <button class="btn btn-outline-secondary rounded-pill">글쓰기</button>  
            </div>
            <br>
            <br>
            <div class="row justify-content-center" id="pageBar">
            	<%=request.getAttribute("pageBar") %>
            </div>
            
            <br>
            <br>
            <br>
          </div>
             
          <div class="col-2">
          </div>
        </section>
      </section>
    </main>  
  </div> 
  
  <script>
  	$(function(){
  		
  		$("#priceOrder").hide();
  		
  		$("#price").click(function(){
  			
  			$("#priceOrder").show();
  		
  			// 클래스 제거 
  			$(this).removeClass("inactive");
  			//클래스 추가
  			$(this).addClass("active");
  			 
  		})
  		
  		$(".nav-item").click(function(){
  			
  			// 클래스 제거 
  			$('.nav-item').removeClass("active");
  			$(".nav-item").addClass("inactive");
  			$(this).removeClass("inactive");
  			//클래스 추가
  			$(this).addClass("active");
  			
  		})
  	})
  	
  	$(function(){
  		let p=$("#popularity").text();
  		console.log(p);
  	})
  	
  	$(function(){
  		
  		$("#popularity").click(()=>{
  			//console.log("test");
  			
  			$.ajax({
  				url:"<%=request.getContextPath()%>/filterpopularity",
  				data:{name:$("#popularity").text()},
  				error : function() {
  		            alert('통신실패');
  		            //console.log($("#popularity").text());
  		        },
  				success:data=>{
  					//console.log(data);
  					$("#area").html(data);
  				}
  			})
  		});
  	});
  	
  	
  	$(function(){
  		
  		$("#newestPost").click(()=>{
  			//console.log("test");
  			
  			$.ajax({
  				url:"<%=request.getContextPath()%>/search/filterNewestPost",
  				data:{name:$("#newestPost").text()},
  				error : function() {
  		            alert('통신실패');
  		        },
  				success:data=>{
  					$("#area").html(data);
  				}
  			})
  		});
  	});
  	
  	$(function(){
  		$.ajax({
  			url:"<%=request.getContextPath()%>/search/textArea",
  			data:{name:$("#textArea").text()},
  			error:function(){
  				alert('실패');
  			},
  			success:data=>{
				$("#textArea").html(data);  				
  			}
  		});
  	});
  	
  	
  	$(".bookmark").click(function(){
  		
  		$.ajax({
  			url:"<%=request.getContextPath()%>/search/bookmark",
  			data:{petsitterId:$(this).val()},
  			error:function(){
  				alert("실패");
  			},
  			success:data=>{
  				console.log($(this).val());
  				$(this).html(data);
  			}
  		});
  	});
  	
  	
  	
  </script>
