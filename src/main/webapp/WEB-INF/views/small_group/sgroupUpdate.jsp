<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>SgroupUpdate</title>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/temp/HF.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/small_group/sgroupUpdate.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
</head>
<body>
<c:import url="../temp/header.jsp" />
	<section id="sgroup_eventUpdate_page">
	<form action="sgroupUpdate" method="post" id="frm" name="frm" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${dto.num }">
		<div class="update_wrap_1">
			<div class="update_1_picture">썸네일 사진<br><input type="file" name="f1" style="width: 500px; height: 500px;"></div>
			<div class="update_1_content_detail">
				<div class="update_1_tag">태그 : <input class="update_1_tag_input" id="tag" name="tag" type="text" value="${dto.tag }"></div>
				<div class="update_1_title">제목 : <br><textarea id="title" name="title" class="update_1_title_input" rows="3" cols="25" >${dto.title }</textarea></div>
				<div class="update_1_date">날짜 : <input class="update_1_date_input" id="c_day" name="c_day" type="text" value="${dto.c_day }"></div>
				<div class="update_1_time">시간 : <input class="update_1_time_input" id="c_time" name="c_time" type="text" value="${dto.c_time }"></div>
				<div class="update_1_location">장소 : <input class="update_1_location_input" id="location" name="location" type="text" value="${dto.location }"></div>
				<div class="update_1_price">
					<div class="update_1_price_per">참가비 : <input class="update_1_price_per_input" id="price" min="0" name="price" type="text" value="${dto.price }">원</div>
					<div class="update_1_price_detail">세부사항 : ( <input class="update_1_price_detail_input" id="detail" name="detail" type="text" value="${dto.detail }"> )</div>
				</div>
				<div class="update_1_people">인원 : 선착순 <input class="update_1_people_input" type="text" id="people" name="people" value="${dto.people }">명(최소 : 10명, 최대 : 40명)</div>
			</div>
		</div>
		<div class="update_wrap_2">
			<div class="update_2">
				<div class="update_2_sgroupEvent">#@월 @@일, 소그룹 Event!< 장소사진 첨부 부탁드려요 :) ></div>
				<div class="update_2_content"><textarea id="contents" name="contents" class="update_2_content_input">${dto.contents }</textarea></div>
				<div class="update_2_host">#Special 호스트 소개</div>
				<div class="update_2_host_picture"><div style="margin-top: 15px; font-weight: 600px;">등록된<br>얼굴 사진</div></div>
				<div class="update_2_host_detail">
					<div class="update_2_special_host">SPECIAL HOST</div>
					<div class="update_2_host_name">이름 : ${member.name } </div>
					<input type="hidden" value="${member.id }" name="id">
					<input type="hidden" value="${member.name }" name="writer">
				</div>
			</div>
		</div>
		<div class="update_wrap_3">
			<div class="update_3_picture"><img class="update_3_picture_img" src="<%=application.getContextPath()%>/resources/img/sgroup/sgroupWrite.png"></div>
		</div>
		<div class="update_wrap_4">
			<div class="update_4">
				<div class="update_4_qna">#Q&A</div>
				<div class="update_4_qna_1st">
					<div class="update_4_qna_1st_q">Q. 리더분이<br>&nbsp;&nbsp;&nbsp;&nbsp;영어로만 말하시나요?<br>&nbsp;&nbsp;&nbsp;&nbsp;못 알아들을까봐 걱정이...</div>
					<div class="update_4_qna_1st_a">아니요~ 영어를하시더라도 한국어로 한번 더 설명을 해주실 거에요~<br>너무 걱정하지 않으셔도 되니 편한 마음으로 오세용 :D</div>
				</div>
				<div class="update_4_qna_2nd">
					<div class="update_4_qna_2nd_q">Q. 지각할 것 같아요./<br>&nbsp;&nbsp;&nbsp;&nbsp;먼저 나가봐야 할 것 같아요.</div>
					<div class="update_4_qna_2nd_a">첫 순서로 멤버들과의 Ice breaking 시간이 마련되어 있기 때문에 지각은 삼가<br>주세요ㅠ 또 먼저 나가시는 분들이 많아지면 분위기가 안좋아지겠죠? 시간을<br>편히 내실 수 있을 때 신청해주세요~</div>
				</div>
				<div class="update_4_qna_3rd">
					<div class="update_4_qna_3rd_q">Q. 친구도 와도 되나요?<br>&nbsp;&nbsp;&nbsp;&nbsp;Learn%Run 멤버는 아닌데...</div>
					<div class="update_4_qna_3rd_a_1">외부인은 선착순으로 3-5명 참가 가능합니다!</div>
					<div class="update_4_qna_3rd_a_2">친구분과 함께 오시고 싶다면 서둘러 신청해주세요!:)</div>
				</div>
			</div>
		</div>
		<div class="update_wrap_5">
			<div class="update_5_picture">
				<div class="update_5_content">
					<div class="update_5_host_picture_info">등록된 얼굴 사진이 나옵니다 :)</div>
					<div class="update_5_host_picture"></div>
					<div class="update_5_1st">Will you come join us?</div>
					<div class="update_5_2nd">It's gonna be fun!</div>
					<div class="update_5_3rd">본 이벤트는 Learn&Run 멤버만 참여 가능합니다.</div>
				</div>
			</div>
		</div>
		<input type="submit" id="savebutton" value="Submit!" class="sgroup_submit">
	</form>
	</section>
<c:import url="../temp/footer.jsp" />
<script type="text/javascript">
var contents = document.getElementById("contents");
//전역변수선언
var editor_object = [];

nhn.husky.EZCreator.createInIFrame({
  oAppRef: editor_object,
  elPlaceHolder: "contents",
  sSkinURI: "<%=application.getContextPath()%>/resources/SE2/SmartEditor2Skin.html", 
  htParams : {
      // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseToolbar : true,             
      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseVerticalResizer : true,     
      // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
      bUseModeChanger : true, 
  }
});

var contents = document.getElementById("title");
//전역변수선언
var editor_object1 = [];

nhn.husky.EZCreator.createInIFrame({
  oAppRef: editor_object1,
  elPlaceHolder: "title",
  sSkinURI: "<%=application.getContextPath()%>/resources/SE2/SmartEditor2Skin.html", 
  htParams : {
      // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseToolbar : true,             
      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseVerticalResizer : false,     
      // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
      bUseModeChanger : true, 
  }
});

    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
    	
        if(		$("#tag").val()== "" ||
    			$("#c_day").val()== "" ||
    			$("#c_time").val()== "" ||
    			$("#location").val()== "" ||
    			$("#detail").val()== "" ||
    			$("#price").val()*1 <=0*1 ||
    			$("#people").val()*1<10*1 ||
    			$("#people").val()*1>40*1
    			){
    			
    			alert("누락된 정보가 있거나 정보입력이 잘못되었습니다.");
    			return false;
    	        }
        
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
        editor_object1.getById["title"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#frm").submit();
        
        //폼 submit
        
    });

</script>
</body>
</html>