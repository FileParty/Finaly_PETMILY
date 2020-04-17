   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import=" com.petmily.board.model.vo.PetSitterBoard"%>
     <%
     PetSitterBoard pb = (PetSitterBoard)request.getAttribute("board");
     String plus ="";
     String basic ="";
     if(pb.getPlus()!=null) {
       for(int i=0;i<pb.getPlus().size();i++) {
          plus+=pb.getPlus().get(i);
       }
     }
       for(int i=0;i<pb.getServiceTypes().size();i++) {
          basic+=pb.getServiceTypes().get(i);
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
</head>
<body>
    <section>
        <div class="container">

            <div class="row">
            	<%@ include file="/views/petsitterMypage/petSitterSideBar.jsp" %>
            <div class="vl"></div>
            <div class="col-9" style="padding:0;">
                <div class="row top-div" style="height: 200px;overflow: hidden;">
                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item">게시글 상세보기</li>
                   
                </ul>
                    <table>
                        <tr>
                            <td class="sub-title" style="width: 100px;" >제목</td>
                            <td>
                                <input type="text" name="title" class="title" style="width: 500px"  value="<%=pb.getBoardTitle()%>" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="sub-title" style="width: 100px;">파일 첨부</td>
                            <!-- <td class="sub-title" style="width: 100px;">파일 첨부</td> -->
                            <td colspan="1">
                                <div class="input-group mb-3" style="width: 500px; height: 25px; margin-top: 10px;">
                                    <div class="files">
                                    	<%for(int i=0;i<pb.getBoardImages().size();i++) { %>
                                       <img style="letter-spacing:5px;width:50px;height:50px;"src="<%=request.getContextPath() %>/upload/board/<%=pb.getBoardImages().get(i)%>">
                                       
                                       <%} %>
                                    </div>
                                    <div class="selectFile">
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
                                placeholder="&nbsp;&nbsp;300자 내외로 작성해주세요."  value="<%=pb.getBoardInfo()%>" readonly>
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
                                    <td><input name="small" style="width: 150px; height: 25px; font-size: 12px;"type="number" class="form-control onecare"  step="5000" min='20000' max='50000' value="<%=pb.getSmallPrice()%>" readonly></td>
                                    
                                    
                                </tr>
                                <tr>
                                    <td>중형견</td>
                                    <td><input name="middle" style="width: 150px; height: 25px; font-size: 12px;"type="number" class="form-control onecare" step="5000" min='30000' max='50000' value="<%=pb.getMiddlePrice()%>" readonly></td>
                                    
                                </tr>
                                <tr>
                                    <td>대형견</td>
                                    <td><input name="big" style="width: 150px; height: 25px; font-size: 12px;"type="number" class="form-control onecare" step="5000" min='40000' max='50000' value="<%=pb.getBigPrice()%>" readonly></td>
                                    
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
                                    
                                        <%if(plus.contains("추가할인")==true){ %>
                                        <input onclick="toggle1();"  name="plusOption" class="chkbox" id="myCheckbox2" type="checkbox" value="추가할인" checked disabled>
                                        <label class="lab" for="myCheckbox2">반려동물 추가비 할인 </label>
                                        <span></span>
                                        <button type="button" class="btn btn-secondary" data-container="body"
                                        data-toggle="tooltip" data-placement="right"
                                        title="1마리 이상의 반려동물을 맡길 시에, 할인을 적용할지 여 부를 선택하고 새로 추가 되는 1마리당 할인 되는 가격을 적어주세요.">
                                            ?
                                          </button>
                                          <%} else {%>
                                            <input onclick="toggle1();"  name="plusOption" class="chkbox" id="myCheckbox2" type="checkbox" value="추가할인" disabled>
                                        <label class="lab" for="myCheckbox2">반려동물 추가비 할인 </label>
                                        <span></span>
                                        <button type="button" class="btn btn-secondary" data-container="body"
                                        data-toggle="tooltip" data-placement="right"
                                        title="1마리 이상의 반려동물을 맡길 시에, 할인을 적용할지 여 부를 선택하고 새로 추가 되는 1마리당 할인 되는 가격을 적어주세요.">
                                            ?
                                          </button>
                                           <%} %>
                                 </td>
                                 </tr>
                                 </div>
                             </table>
                                     </div>                                                                                 
                                          
                                         
                                    
                                       
                                
                                    
                           
                         <div class="row1">
                            <table style="text-align: center; margin-top:0px;">
                                 <tr>
                                     <td style="width: 50px;">1박</td style="width: 100px;">
                                     <td><input name="sale" style="width: 100px; height: 25px; font-size: 12px;"type="number" id="onecare2" class="form-control onecare2" step="5000" min="5000" max='20000' value="<%=pb.getSalePrice() %>"readonly></td>
                                     <td>할인</td>
                                 </tr>
                                
                             </table>
                            </div> 
                           
                         <!-- 반려동물 추가비 할인 -->
                        
                    
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
                             <input class="address" type="text" name="map" style="width: 485px;"required value="<%=pb.getBoardAddress()%>" readonly>
                             <input type="button" onclick="mapOff(false,false)" id="mapOff" hidden>
                             
                             
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
                            <td>
                            <%if(pb.getBoardAddressContent()!=null) {%>
                            <input type="text" name="comment" style="width: 600px" placeholder=" &nbsp;&nbsp;예 ) 혜화역 도보 10분내에 있습니다 / 건대 입구 cgv에서 10분 거리입니다."  value="<%=pb.getBoardAddressContent() %>" readonly>
                            <%}else { %>
                            <input type="text" name="comment" style="width: 600px" placeholder=" &nbsp;&nbsp;예 ) 혜화역 도보 10분내에 있습니다 / 건대 입구 cgv에서 10분 거리입니다."  value="-" readonly>
                            <%} %>
                            </td>
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
                                
                                <%if(basic.contains("실내놀이")==true) {%>
                                    <input id="myCheckbox3" name="defaultOption" type="checkbox" value="실내놀이" checked disabled>
                                    <label for="myCheckbox3">실내 놀이</label>
                                    <span></span>
                                  <%} else { %>
                                  <input id="myCheckbox3" name="defaultOption" type="checkbox" value="실내놀이" disabled>
                                    <label for="myCheckbox3">실내 놀이</label>
                                    <span></span>
                                    <%} %>
                                  </div>
                            </td>
                            <td>
                                <div class="chiller_cb">
                                <% if(basic.contains("매일산책")==true) { %>
                                    <input id="myCheckbox4" name="defaultOption"type="checkbox" value="매일산책"  checked disabled>
                                    <label for="myCheckbox4">매일 산책</label>
                                    <span></span>
                                
                                    <%} else { %>
                                     <input id="myCheckbox4" name="defaultOption"type="checkbox" value="매일산책" disabled>
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
                                   <%if(plus.contains("노견케어")==true) {%>
                                    <input name="plusOption"id="myCheckbox5" type="checkbox" value="노견케어" checked disabled>
                                    <label for="myCheckbox5">노견 케어</label>
                                    <span></span>
                                    <%}else { %>
                                    <input name="plusOption"id="myCheckbox5" type="checkbox" value="노견케어" disabled>
                                    <label for="myCheckbox5">노견 케어</label>
                                    <span></span>
                                    <%} %>
                                  </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="chiller_cb">
                                <%if(plus.contains("목욕가능")==true) {%>
                                    <input name="plusOption"id="myCheckbox6" type="checkbox" value="목욕가능" checked disabled>
                                    <label for="myCheckbox6">목욕 가능</label>
                                    <span></span>
                                    <%}else {  %>
                                    <input name="plusOption"id="myCheckbox6"  type="checkbox" value="목욕가능" disabled>
                                    <label for="myCheckbox6">목욕 가능</label>
                                    <span></span>
                                    <%} %>
                                  </div>
                            </td>
                        </tr>
                    </table><!-- 추가 옵션 -->

                    <div class="row2"style="margin-right:20px;">
                        <div class="in-table d-flex justify-content-center">
                            <table id="inner" style="width: 300px; margin-left: 60px;" >
                                <tr>
                                    <td style="width: 130px;">반려 동물 유형 
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
                                    <td style="text-align:center;"><input name="small1" style=" margin-left: 10px; width: 150px; height: 25px; font-size: 12px;"type="number"  class="form-control shower" step="1000" min="1000" max='5000' value="<%=pb.getSmallPrice1()%>" readonly></td>
                                    
                                </tr>
                                <tr>
                                    <td>중형견</td>
                                    <td><input name="middle1" style="margin-left: 10px;  width: 150px; height: 25px; font-size: 12px;"type="number" class="form-control shower" step="1000" min="1000" max='5000' value="<%=pb.getMiddlePrice1()%>" readonly></td>
                                    
                                </tr>
                                <tr>
                                    <td>대형견</td>
                                    <td><input name="big1" style="margin-left: 10px;  width: 150px; height: 25px; font-size: 12px;"type="number"  class="form-control shower" step="1000" min="1000" max='5000' value="<%=pb.getBigPrice1()%>" readonly></td>
                                </tr>
                            </table>
                        </div>
                        </div>

                    <!-- 추가 옵션 -->
                    <table style="margin-top:0px;">
                        <tr>
                            <td>
                                <div class="chiller_cb">
                                <% if(plus.contains("약물복용")==true) {%>
                                    <input name="plusOption" id="myCheckbox7" type="checkbox" value="약물복용" checked disabled>
                                    <label for="myCheckbox7">약물 복용</label>
                                    <span></span>
                                    <%} else {%>
                                    <input name="plusOption" id="myCheckbox7" type="checkbox" value="약물복용" disabled>
                                    <label for="myCheckbox7">약물 복용</label>
                                    <span></span>
                                    <%} %>
                                  </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="chiller_cb">
                                 <% if(plus.contains("집앞픽업")==true) {%>
                                    <input name="plusOption"  id="myCheckbox8" type="checkbox" value="집앞픽업" checked disabled>
                                    <label for="myCheckbox8">집 앞 픽업</label>
                                    <span></span>
                                    <%}else { %>
                                      <input name="plusOption" " id="myCheckbox8" type="checkbox" value="집앞픽업" disabled>
                                    <label for="myCheckbox8">집 앞 픽업</label>
                                    <span></span>
                                    <%} %>
                                  </div>
                            </td>
                        </tr>
                    </table><!-- 추가 옵션 -->

                    <div class="row3">
                        <div class="in-table d-flex justify-content-center">
                            <table id="inner" style="width: 300px; margin-left: 60px;" >
                                <tr>
                                    <td style="width: 100px;">픽업 횟수</td>
                                    <td style="width: 150px;">픽업 비용</td>
                                    
                                </tr>
                                <tr>
                                    <td>편도</td>
                                    <td style="text-align:center;"><input name="oneWay" style=" margin-left: 10px; width: 150px; height: 25px; font-size: 12px;" type="number" class="form-control pick" step="1000" min='5000' max='30000' value="<%=pb.getOneWayPrice()%>" readonly></td>
                                    
                                </tr>
                                <tr>
                                    <td>왕복</td>
                                    <td><input name="allWay" style="margin-left: 10px;  width: 150px; height: 25px; font-size: 12px;"type="number" class="form-control pick" step="1000" min='5000' max='30000' value="<%=pb.getAllWayPrice()%>" readonly></td>
                                    
                                </tr>

                            </table>
                        </div>
                        </div>

                        <div class="row" style="margin-left: 35%;">
                            <div style="margin-top:80px; margin-bottom: 100px;">
                                
                                <button style="color:white; border: solid 1px black; background-color :black" class="btn1" onclick="location.replace('<%=request.getContextPath()%>/sitter/update?id=<%=pb.getUserId()%>')">수정하기</button>
                            </div>
                        </div>

                    </div>
                </div>
           
        <div>
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
   $('[data-toggle="tooltip"]').tooltip();

})



  
        
           
            var search= $(".address").val();
            console.log(search);
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
           
           $("#mapOff").trigger('click');
           function mapOff(draggable,zoomable) {
           		  map.setDraggable(draggable);  
           		  map.setZoomable(zoomable); 
           }
          
              var chk2 = document.getElementById("myCheckbox2");
            var chk6 = document.getElementById("myCheckbox6");
            var chk8 = document.getElementById("myCheckbox8");
            
            
            var row1 = $(".row1");
            var row2 = $(".row2");
            var row3 = $(".row3");
            if(chk2.checked!=true) {
               row1.hide();
               }else {
                  row1.show();
               }
               
           if(chk6.checked!=true) {
           row2.hide();
           }else { 
              row2.show();
           }
           if(chk8.checked!=true) {
               row3.hide();
               }else { 
                  row3.show();
               }
           
     
         
           
  
    
    


</script>
</body>
</html> 