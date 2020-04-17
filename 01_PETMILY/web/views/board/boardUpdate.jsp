<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import=" com.petmily.board.model.vo.PetSitterBoard" %>
    <%@ include file="/views/common/header.jsp" %>
    <% 
    PetSitterBoard pb = (PetSitterBoard)request.getAttribute("pb");
    String plus ="";
    String basic ="";
    String img = "";
    if(pb.getPlus()!=null) {
      for(int i=0;i<pb.getPlus().size();i++) {
         plus+=pb.getPlus().get(i);
      }
    }
    if(pb.getServiceTypes()!=null) {
      for(int i=0;i<pb.getServiceTypes().size();i++) {
         basic+=pb.getServiceTypes().get(i);
      }
    }
    if(pb.getBoardImages()!=null) {
      for(int i=0;i<pb.getBoardImages().size();i++) {
    	  img=pb.getBoardImages().get(i);
      }
    }
    %>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21457534dfe681cc96c51d32694dc5a9&libraries=services"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/boardWrite.css">
<style>
	span.imgs {
		position:absolute;
		left:79px;
		top:7px;
		width:258px;
		background-color:lightgray;
	}
</style>
</head>
<body>
    <section>
        <div class="container">
            <form action="<%=request.getContextPath() %>/sitter/updateEndd?id=<%=pb.getUserId() %>&no=<%=pb.getBoardNo()%>"  method="post" onsubmit="return test();" enctype="multipart/form-data">
            <div class="row">
            	<%@ include file="/views/petsitterMypage/petSitterSideBar.jsp" %>
            <div class="vl"></div>
            <div class="col-9" style="padding:0;">
                <div class="row top-div" style="height: 200px;overflow: hidden;">
                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item">작성글 보기</li>
                    <li class="breadcrumb-item active">글 작성하기</li>
                    
                </ul>
                    <table>
                        <tr>
                            <td class="sub-title" style="width: 100px;" >제목</td>
                            <td>
                              <input type="text" name="title" class="title" style="width: 500px" required value="<%=pb.getBoardTitle()%>">
                              
                            </td>
                        </tr>
                        <tr>
                        
                            <td class="sub-title" style="width: 100px;">파일 첨부</td>
                            <!-- <td class="sub-title" style="width: 100px;">파일 첨부</td> -->
                            <td colspan="1">
                                <div class="input-group mb-3" style="width: 500px; height: 25px; margin-top: 10px;">
                                    <div class="files">
                                       <input style="height:40px;" type="button" value="파일첨부" class="addFlie_"onclick="addFile();">
                                     
                                    </div>
                                    <div class="selectFile" style="position:absolute">
                                      
                                     <input type="hidden"class="fileNo" name="count">
                                    </div>
                                    </div>
                                      
                            </td>
                              
                        </tr>
                       
                        <tr>
                            
                        </tr>
                        <tr>
                            <td colspan="2" class="sub-title">
                            <br>
                            펫 시터 소개글
                            <hr  id="line"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input id="intro" class="intro" type="text" name="introduce" style="width: 750px; margin-left: 5px;"
                                placeholder="&nbsp;&nbsp;300자 내외로 작성해주세요." required value="<%=pb.getBoardInfo()%>">
                            </td>
                        </tr>
                        <!-- 기본 이용 요금 -->
                        <tr>
                            <td colspan="2" class="sub-title">
                                <br/>
                                <br/>
                                기본 이용 요금 설정
                                <hr  id="line"/>
                            </td>
                        </table>
                        <div class="row">
                        <div class="in-table d-flex justify-content-center">
                            <table id="inner" style="width: 750px; margin-left: 60px;" >
                                <tr>
                                
                                    <td style="width: 150px;">반려 동물 유형
                                    <button type="button" class="btn btn-secondary" data-container="body"
                                        data-toggle="toggle" data-placement="right"
                                        title="소형견 : 7kg 미만, &#10;&#13; 중형견 : 7kg-14.9kg, &#10;&#13; 대형견 : 15kg 이상">
                                            ?
                                          </button>
                                        </td>
                                    <td>1박 케어</td>
                                    
                                    <td rowspan="4" style="text-align: left;">
                                        <p style="text-align: center; margin-bottom: 0px; font-weight: 500;">< 공휴일, 연휴 요금관련 안내 ></p><br/>
                                        ‘펫 플래닛’은 공휴일, 연휴 할증 정책을 시행합니다.
                                        공휴일, 연휴에 예약시 자동으로 기존 요금에서 1만 원이 추가됩니다.
                                        </td>
                                </tr>
                                <tr>
                                    <td>소형견</td>
                                    <td><input name="small" style="width: 150px; height: 25px; font-size: 12px;"type="number" class="form-control onecare"  step="5000" min='20000' max='50000' value="<%=pb.getSmallPrice()%>"></td>
                                    
                                    
                                </tr>
                                <tr>
                                    <td>중형견</td>
                                    <td><input name="middle" style="width: 150px; height: 25px; font-size: 12px;"type="number" class="form-control onecare" step="5000" min='30000' max='50000' value="<%=pb.getMiddlePrice()%>"></td>
                                    
                                </tr>
                                <tr>
                                    <td>대형견</td>
                                    <td><input name="big" style="width: 150px; height: 25px; font-size: 12px;"type="number" class="form-control onecare" step="5000" min='40000' max='50000' value="<%=pb.getBigPrice()%>"></td>
                                    
                                </tr>
                            </table>
                        </div>
                        </div><!-- 기본 이용 요금 -->
                        
                        <!-- 반려동물 추가비 할인 -->
                        <div class="row">
                         <table style="margin-top: 30px;">
                             <tr>
                                 <td class="sub-title">
                                    <div class="chiller_cb">
                                    <%if(plus.contains("추가할인")){ %>
                                        <input onclick="toggle1();"  name="plusOption" class="chkbox" id="myCheckbox2" type="checkbox" value="추가할인" checked>
                                        <label class="lab" for="myCheckbox2">반려동물 추가비 할인 </label>
                                        <span></span>
                                        <button type="button" class="btn btn-secondary" data-container="body"
                                        data-toggle="tooltip" data-placement="right"
                                        title="1마리 이상의 반려동물을 맡길 시에, 할인을 적용할지 여 부를 선택하고 새로 추가 되는 1마리당 할인 되는 가격을 적어주세요.">
                                            ?
                                          </button>
                                           <%}else{ %>
                                        <input onclick="toggle1();"  name="plusOption" class="chkbox" id="myCheckbox2" type="checkbox" value="추가할인" >
                                        <label class="lab" for="myCheckbox2">반려동물 추가비 할인 </label>
                                        <span></span>
                                        <button type="button" class="btn btn-secondary" data-container="body"
                                        data-toggle="tooltip" data-placement="right"
                                        title="1마리 이상의 반려동물을 맡길 시에, 할인을 적용할지 여 부를 선택하고 새로 추가 되는 1마리당 할인 되는 가격을 적어주세요.">
                                            ?
                                          </button>
                                          <%} %>
                                      </div>
                                     
                                     <hr  id="line"/>
                                 </td>
                             </tr>
                                                   
                        </table>
                        
                        <div class="row1" style="display: none;">
                            <table style="text-align: center; margin-top:0px;">
                                 <tr>
                                     <td style="width: 50px;">1박</td style="width: 100px;">
                                     <td>
                                     <input name="sale" style="width: 100px; height: 25px; font-size: 12px;"type="number" id="onecare2" class="form-control onecare2" step="5000" min="5000" max='20000' value="<%=pb.getSalePrice()%>">
                                     </td>
                                     <td>할인</td>
                                 </tr>
                                
                             </table>
                            </div>
                            <div>
                         <!-- 반려동물 추가비 할인 -->
                        </div>
                    </div>
                    <!-- 펫 시터님 위치 -->
                    <table style= "margin-top:20px;">
                        <tr>
                            <td class="sub-title">
                            <br>
                            펫 시터님 위치
                            <hr  id="line"/>
                            </td>
                        </tr>
                    </table>
                    <table style="margin-top:0px;">
                         <tr>
                             <td class="sub-title" style=" margin-left: 10px; width: 80px;">주소 검색</td>
                             <td style="margin-left: 0px;">
                             <input class="address" type="text" name="map" style="width: 485px;"required value="<%=pb.getBoardAddress() %>">
                             <input type="button" value="검색" style="margin-left: 10px;width:50px;height:30px;" class="btn btn-outline-warning"" onclick="searchMap(false);">
                             
                             </td>
                         </tr>
                         <tr>
                             <td></td>
                             <td>
                                <div id="map" style="width: 600px; height: 250px; border: 1px solid lightgray;"></div>
                             </td>
                        </tr>
                        <tr>
                            <td class="sub-title">추가 코멘트</td>
                            <%if(pb.getBoardAddressContent()!=null) {%>
                            <td><input type="text" name="comment" style="width: 600px" placeholder=" &nbsp;&nbsp;예 ) 혜화역 도보 10분내에 있습니다 / 건대 입구 cgv에서 10분 거리입니다." value="<%=pb.getBoardAddressContent()%>"></td>
                        	<%}else { %>
                        	<td>-</td>
                        	<%} %>
                        </tr>
                     </table><!-- 펫 시터님 위치 -->

                     <!-- 기본 제공 서비스 -->
                     <table style= "margin-top:20px;">
                        <tr>
                            <td class="sub-title">
                            <br>
                            기본 제공 서비스<sup style="color: grey;">* 추가 요금을 청구할 수 있습니다.</sup>
                            <hr  id="line"/>
                            </td>
                        </tr>
                    </table>

                    <table style="margin-top:0px;">
                        <tr>
                            <td>
                                <div class="chiller_cb">
                                <%if(basic.contains("실내놀이")){ %>
                                    <input id="myCheckbox3" name="defaultOption" type="checkbox" value="실내놀이" checked>
                                    <label for="myCheckbox3">실내 놀이</label>
                                    <span></span>
                                    <%}else { %>
                                    <input id="myCheckbox3" name="defaultOption" type="checkbox" value="">
                                    <label for="myCheckbox3">실내 놀이</label>
                                    <span></span>
                                    <%} %>
                                  </div>
                            </td>
                            <td>
                                <div class="chiller_cb">
                                <%if(basic.contains("매일산책")) {%>
                                    <input id="myCheckbox4" name="defaultOption"type="checkbox" value="매일산책" checked>
                                    <label for="myCheckbox4">매일 산책</label>
                                    <span></span>
                                    <%}else {  %>
                                    <input id="myCheckbox4" name="defaultOption"type="checkbox" value="매일산책" >
                                    <label for="myCheckbox4">매일 산책</label>
                                    <span></span>
                                    <%} %>
                                  </div>
                            </td>
                        </tr>
                    </table><!-- 기본 제공 서비스 -->

                    <!-- 추가 옵션 -->
                    <table style= "margin-top:20px;">
                        <tr>
                            <td class="sub-title">
                            <br>
                            추가 옵션 <sup style="color: grey;">* 일부 옵션에서 추가 요금을 청구할 수 있습니다.</sup>
                            <hr  id="line"/>
                            </td>
                        </tr>
                    </table>

                    <table style="margin-top:0px;">
                        <tr>
                            <td>
                                <div class="chiller_cb">
                                <%if(plus.contains("노견케어")) {%>
                                    <input name="plusOption"id="myCheckbox5" type="checkbox" value="노견케어" checked>
                                    <label for="myCheckbox5">노견 케어</label>
                                    <span></span>
                                    <%} else { %>
                                    <input name="plusOption"id="myCheckbox5" type="checkbox" value="노견케어" >
                                    <label for="myCheckbox5">노견 케어</label>
                                    <span></span>
                                    <%} %>
                                    
                                  </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="chiller_cb">
                                <%if(plus.contains("목욕가능")) { %>
                                    <input name="plusOption"id="myCheckbox6" onclick="toggle2();" type="checkbox" value="목욕가능" checked>
                                    <label for="myCheckbox6">목욕 가능</label>
                                    <span></span>
                                    <%}else {  %>
                                     <input name="plusOption"id="myCheckbox6" onclick="toggle2();" type="checkbox" value="목욕가능">
                                    <label for="myCheckbox6">목욕 가능</label>
                                    <span></span>
                                    <%} %>
                                  </div>
                            </td>
                        </tr>
                    </table><!-- 추가 옵션 -->

                    <div class="row2" >
                        <div class="in-table d-flex justify-content-center">
                            <table id="inner" style="width: 300px; margin-left: 60px;" >
                                <tr>
                                    <td style="width: 160px;">반려 동물 유형 
                                        <button type="button" class="btn btn-secondary" data-container="body"
                                        data-toggle="tooltip" data-placement="right"
                                        title="소형견 : 7kg 미만, &#10;&#13; 중형견 : 7kg-14.9kg, &#10;&#13; 대형견 : 15kg 이상">
                                            ?
                                          </button>
                                        </td>
                                    <td style="width: 150px;">1회 당 목욕 비용</td>
                                    
                                </tr>
                                <tr>
                                    <td>소형견</td>
                                    <td style="text-align:center;"><input  id="small1" name="small1" style=" margin-left: 10px; width: 150px; height: 25px; font-size: 12px;"type="number"  class="form-control shower" step="1000" min="1000" max='5000' value="<%=pb.getSmallPrice1()%>"></td>
                                    
                                </tr>
                                <tr>
                                    <td>중형견</td>
                                    <td><input id="middle1" name="middle1" style="margin-left: 10px;  width: 150px; height: 25px; font-size: 12px;"type="number" class="form-control shower" step="1000" min="1000" max='5000' value="<%=pb.getMiddlePrice1()%>"></td>
                                    
                                </tr>
                                <tr>
                                    <td>대형견</td>
                                    <td><input  id="big1" name="big1" style="margin-left: 10px;  width: 150px; height: 25px; font-size: 12px;"type="number"  class="form-control shower" step="1000" min="1000" max='5000' value="<%=pb.getBigPrice1()%>"></td>
                                </tr>
                            </table>
                        </div>
                        </div>

                    <!-- 추가 옵션 -->
                    <table style="margin-top:0px;">
                        <tr>
                            <td>
                                <div class="chiller_cb">
                                <%if(plus.contains("약물복용")){ %>
                                    <input name="plusOption" id="myCheckbox7" type="checkbox" value="약물복용" checked>
                                    <label for="myCheckbox7">약물 복용</label>
                                    <span></span>
                                    <%}else {  %>
                                    <input name="plusOption" id="myCheckbox7" type="checkbox" value="약물복용" >
                                    <label for="myCheckbox7">약물 복용</label>
                                    <span></span>
                                    <%} %>
                                  </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="chiller_cb">
                                <%if(plus.contains("집앞픽업")) {%>
                                    <input name="plusOption" onclick="toggle3();" id="myCheckbox8" type="checkbox" value="집앞픽업" checked>
                                    <label for="myCheckbox8">집 앞 픽업</label>
                                    <span></span>
                                    <%} else { %>
                                     <input name="plusOption" onclick="toggle3();" id="myCheckbox8" type="checkbox" value="집앞픽업" >
                                    <label for="myCheckbox8">집 앞 픽업</label>
                                    <span></span>
                                    <%} %>
                                  </div>
                            </td>
                        </tr>
                    </table><!-- 추가 옵션 -->

                    <div class="row3" >
                        <div class="in-table d-flex justify-content-center">
                            <table id="inner" style="width: 300px; margin-left: 60px;" >
                                <tr>
                                    <td style="width: 100px;">픽업 횟수</td>
                                    <td style="width: 150px;">픽업 비용</td>
                                    
                                </tr>
                                <tr>
                                    <td>편도</td>
                                    <td style="text-align:center;"><input id="oneWay" name="oneWay" style=" margin-left: 10px; width: 150px; height: 25px; font-size: 12px;" type="number" class="form-control pick" step="1000" min='5000' max='30000' value="<%=pb.getOneWayPrice()%>"></td>
                                    
                                </tr>
                                <tr>
                                    <td>왕복</td>
                                    <td><input id="allWay" name="allWay" style="margin-left: 10px;  width: 150px; height: 25px; font-size: 12px;"type="number" class="form-control pick" step="1000" min='5000' max='30000' value="<%=pb.getAllWayPrice()%>"></td>
                                    
                                </tr>

                            </table>
                        </div>
                        </div>

                        <div class="row" style="margin-left: 35%;">
                            <div style="margin-top:80px; margin-bottom: 100px;">
                                <button style="color:white; border: solid 1px black; background-color :black" class="btn1" type="submit">등록</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        </div>
    </section>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
<script>
 

$(function () {
	searchMap();
	/* addFile().trigger('click'); */
	})
	if(document.getElementById("myCheckbox8").checked==true) {
		$(".row3").show();
	}else { 
		$(".row3").hide();
		document.getElementById("oneWay").value ="";
		document.getElementById("allWay").value ="";
	}
	
	 if(document.getElementById("myCheckbox6").checked==true) {
		$(".row2").show();
	}else { 
		$(".row2").hide();
		document.getElementById("small1").value ="";
		document.getElementById("middle1").value ="";
		document.getElementById("big1").value ="";
	}
	 
	 if(document.getElementById("myCheckbox2").checked==true) {
		$(".row1").show();
	}else { 
		$(".row1").hide();
		document.getElementById("onecare2").value ="";
	}

	
	

 function toggle1(){ //on/off하나의 버튼으로 가능.

    $('.row1').slideToggle(1000); //시간 부여
    
}

function toggle2(){ //on/off하나의 버튼으로 가능.
 
    $('.row2').slideToggle(1000); //시간 부여
    }; 

function toggle3(){ //on/off하나의 버튼으로 가능.

    $('.row3').slideToggle(1000); //시간 부여
    }; 


    $(function () {
   $('[data-toggle="tooltip"]').tooltip()
})

$(function(){
      $("#intro").keyup(function(){
         if($(this).val().length>300){
            $(this).val($(this).val().substring(0,300));
         }
      })
   })
     
    var onecare= document.getElementsByClassName("onecare");
   var onecare2 = document.getElementsByClassName("onecare2");
   var shower = document.getElementsByClassName("shower");
   var pick = document.getElementsByClassName("pick");

      $(onecare).change(function(){
              
        if(event.target.value<20000) {
          $(event.target).val(event.target.min);
        }else if(event.target.value>50000){
            $(event.target).val(event.target.max);
        }
      });

      $(onecare2).change(function(){
              
              if(event.target.value<5000) {
                $(event.target).val(event.target.min);
              }else if(event.target.value>20000){
            $(event.target).val(event.target.max);
        }
            });

      $(shower).change(function(){
              
              if(event.target.value<1000) {
                $(event.target).val(event.target.min);
              }else if(event.target.value>5000){
            $(event.target).val(event.target.max);
        }
            });
            
      $(pick).change(function(){
              
              if(event.target.value<500) {
                $(event.target).val(event.target.min);
              }else if(event.target.value>10000){
            $(event.target).val(event.target.max);
        }
            });

         function test() {
                if(document.getElementById("myCheckbox2").checked==true && $("#onecare2").val().trim().length==0) {
                    alert("추가비 할인액을 입력하세요.");
                    return false;
                }if(document.getElementBy2("myCheckbox6").checked==true && $(".shower").val().trim().length==0) {
                    alert("목욕 비용을 입력하세요.");
                    return false;
                }if(document.getElementById("myCheckbox8").checked==true && $(".pick").val().trim().length==0) {
                    alert("픽업 비용을 입력하세요.");
                    return false;
                }
                
                return true;
         };
         
         var num =1;
         function addFile() {
             
             let file =$("<input>").attr({
                 "type":"file",
                 "name": "file"+num,
                 "id":"file"+num
                 
             }).css({
            	 "height":"40px",
            	 "width":"200px"
            	 
            	 });
             let label = $("<label>").attr({
                 'for':'file'+num
             
             });
             $(".fileNo").attr({
                 "value":num
             })
             var s = $(".selectFile").append(file);
             s.append(label);
             s.append("<br>");
               num++;
         }
	
		<%for(int i=0;i<pb.getBoardImages().size();i++) {%>
		
         var files =$("<input>").attr({
             "type":"file",
             "name": "file"+num,
             "id":"file"+num
             
         }).css({
        	 "height":"40px",
        	 "width":"200px"
        	 
        	 });
         var labels = $("<label>").attr({
             'for':'file'+num
         
         });
         $(".fileNo").attr({
             "value":num
         })
         <%if(i>0) {%>
          var span = $("<span>").attr({
        	 "class":"imgs img"+<%=i+1%>
         }). css({
        	 "top":"55px",
        	 "left":"80px",
        	 "height":"20px",
        	 "width":"100px"
         }).html("<%=pb.getBoardImages().get(i)%>");
          
         <%} else { %>
         var span = $("<span>").attr({
        	 "class":"imgs img"+<%=i+1%>
         }).css({
        	 "top":"15px",
        	 "left":"80px",
        	 "height":"20px",
        	 "width":"100px"
         }).html("<%=pb.getBoardImages().get(i)%>");
         <%}%>
          
         var s = $(".selectFile").append(files);
         s.append(labels);
         s.append(span);
         s.append("<br>");
           
           $("#file"+<%=i+1%>).change(function() {
        	  $(".img"+<%=i+1%>).hide();
           })
          num++;
           <%}%>
           
		
		

         
         
         
         
         function searchMap(draggable) { 
        	
        	 var search= $(".address").val();
        	
        	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        	    mapOption = {
        	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        	        level: 3 // 지도의 확대 레벨
        	    };  

        	// 지도를 생성합니다    
        	var map = new kakao.maps.Map(mapContainer, mapOption); 
        	
        	// 주소-좌표 변환 객체를 생성합니다
        	var geocoder = new kakao.maps.services.Geocoder();

        	// 주소로 좌표를 검색합니다
        	geocoder.addressSearch(search, function(result, status) {

        	    // 정상적으로 검색이 완료됐으면 
        	     if (status === kakao.maps.services.Status.OK) {

        	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        	        // 결과값으로 받은 위치를 마커로 표시합니다
        	        var marker = new kakao.maps.Marker({
        	            map: map,
        	            position: coords
        	        });

        	        // 인포윈도우로 장소에 대한 설명을 표시합니다
        	        var infowindow = new kakao.maps.InfoWindow({
        	            content: '<div style="width:150px;text-align:center;padding:6px 0;">당신의 위치입니다.</div>'
        	        });
        	        infowindow.open(map, marker);

        	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        	        map.setCenter(coords);
        	    } 
        	});  
        	 map.setDraggable(draggable);  
        	};
        	
        
         
        	
  
    
    


</script>
</body>
</html>