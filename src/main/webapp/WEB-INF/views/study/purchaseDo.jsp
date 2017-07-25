<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/css/temp/basic_table.css">
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/css/study/purchaseDo.css">
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" ></script>
<script type="text/javascript">
 $(function () {
	 
		var payCheck = false;
		
	$("#ch_cardNum").click(function() {
		
		var cardNum1 = $("#cardNum1").val();
		var cardNum2 = $("#cardNum2").val();
		var cardNum3 = $("#cardNum3").val();
		var cardNum4 = $("#cardNum4").val();
		
		var str = cardNum1+cardNum2+cardNum3+cardNum4;
		
		
		$.post("cardNumCheck",{str:str}, function(data) {
		
			if(data.trim()=='true'){
				payCheck = true;
				alert("카드정보가 확인되었습니다.");
			}else if(str.length<16){
				alert("카드번호 16자리를 확인해주세요");
			}else{
				alert("카드 번호를 정확하게 입력해주시기 바랍니다.");
				payCheck = false;
				
			}
		});
		
	});
	
	$("#payCard").click(function() {
		

			if(payCheck==false){
				alert("올바르지 않은 정보입니다.");
				return false;
			}else{
				alert("결제가 완료되었습니다. 내역은 마이페이지에서 확인가능합니다.");
		 		$("#p_frm").submit();
		 		window.close();
		 		window.opener.top.location.href="/learn_run/study/payComplete?id=${member.id}&product=${dto.title}&price=${dto.price}&name=${member.name}&type=${type}";
			}
		
	});
	
	$("#paySmart").click(function() {
		if(payCheck==false){
			alert("올바르지 않은 정보입니다.");
			return false;
		}else{
			alert("결제가 완료되었습니다. 내역은 마이페이지에서 확인가능합니다.");
	 		$("#p_frm").submit();
	 		window.close();
	 		window.opener.top.location.href="/learn_run/study/payComplete?id=${member.id}&product=${dto.title}&price=${dto.price}&name=${member.name}&type=${type}";
		}
	});
	
	$("#payAccount").click(function() {
		
			if($(".account").val() != null){
				href.location="";
			}else{
				alert("계좌번호를 정확히 입력해주시기 바랍니다.")
			}
	});
		
		
	 
	});

</script>	
<title>Insert title here</title>
</head>
<body>

			<div class="titleContainer">
				<div id="p-step1">
					<div class="p-stepTitle">
						<h5>step 1. 참여 정보 확인</h5>
					</div>
				</div>
				<div id="p-step2">
					<div class="p-stepTitle">
						<h5>step 2. 강의 결제하기</h5>
					</div>
				</div>
				<div id="p-step3">
					<div class="p-stepTitle">
						<h5>step 3. 강의 신청 완료</h5>
					</div>
				</div>
			</div>
				<div class="clear"></div>
				<div class="containerContents">
					<c:if test="${type eq 'card'}">
						<h3>카드 결제</h3>
						<form action="payDo" id="p_frm">
							<input type="hidden" name="product" value="${dto.title}">
							<input type="hidden" name="price" value="${dto.price}">
							<input type="hidden" name="name" value="${member.name}">
							<input type="hidden" name="id" value="${member.id}">
							<input type="hidden" name="type" value="${type}">
							</form>
							<table class="p-table">
								<thead>
									<tr>
										<td class="p-index p-lecture">강의명</td>
										<td class="p-index p-leader">튜터</td>
										<td class="p-index p-price">가격</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${dto.title }</td>
										<td>${dto.tid }</td>
										<td>${dto.price }</td>
									</tr>
								</tbody>
							</table>
							<div class="clear"></div>
							<h4>구매자 정보</h4>
							<table class="memberInfo">
								<tr>
									<td>이름</td>
									<td colspan="2">${member.name}</td>
								</tr>
								<tr>
									<td>카드사</td>
									<td>
										<select id="cardCom">
											<option>BC</option>
											<option>국민</option>
											<option>신한</option>
											<option>삼성</option>
											<option>롯데</option>
											<option>신한</option>
											<option>우리</option>
											<option>현대</option>
										</select>
									</td>
								</tr>
									<tr>
									<td>카드번호</td>
									<td>
									<input type="number" class="cardNum" id="cardNum1" maxlength="4">-<input type="number" class="cardNum" id="cardNum2" maxlength="4">-<input type="number" class="cardNum" id="cardNum3" maxlength="4">-<input type="number" class="cardNum" id="cardNum4" maxlength="4">
									</td>
									</tr>
									<tr>
									<td rowspan="2">
									<input type="button" value="카드번호확인" id="ch_cardNum">
									</td>
									</tr>
									
							</table>
							
							<a role="button" class="payDo" id="payCard">결제하기</a>
							
						
					</c:if>
					<c:if test="${type eq 'smart'}">
					<h3>스마트 결제</h3>
						<form action="payDo" id="p-frm">
							<table class="p-table">
								<thead>
									<tr>
										<td class="p-index p-lecture">강의명</td>
										<td class="p-index p-leader">튜터</td>
										<td class="p-index p-price">가격</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${dto.title }</td>
										<td>${dto.tid }</td>
										<td>${dto.price }</td>
									</tr>
								</tbody>
							</table>
							<div class="clear"></div>
							<h4>구매자 정보</h4>
							<table class="memberInfo">
								<tr>
								<td>이름</td>
								<td>${member.name}</td>
								</tr>
								<tr>
								<td>생년월일</td>
								<td>
								<select>
									<c:forEach begin="1910" end="2017" var="i">
									<option value="${i}" name="birth1">${i}</option>년
									</c:forEach>	
								</select>
								<select>
									<c:forEach begin="1" end="12" var="i">
									<option value="${i}" name="birth2">${i}</option>월
									</c:forEach>
								</select>
								<select>
									<c:forEach begin="1" end="31" var="i">
									<option value="${i}" name="birth3">${i}</option>일
									</c:forEach>
								</select>
								</td>
								</tr>
								<tr>
								<td>휴대폰 번호 </td> 
								<td id="phone_all">
								<span id="phone">*가입 시 입력한 연락처를 입력해주세요*</span>
								<br>
								<input type="text" name="phone" placeholder="예) 010-0000-0000">
								</td>
								</tr>
							</table>
							<a role="button" class="payDo" id="paySmart">결제하기</a>
						</form>
					</c:if>
					<c:if test="${type eq 'account'}">
					<h3>무통장입금</h3>
						<form action="payDo">
							<table class="p-table">
								<thead>
									<tr>
										<td class="p-index p-lecture">강의명</td>
										<td class="p-index p-leader">튜터</td>
										<td class="p-index p-price">가격</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${dto.title }</td>
										<td>${dto.tid }</td>
										<td>${dto.price }</td>
									</tr>
								</tbody>
							</table>
							<div class="clear"></div>
							<h4>구매자 정보</h4>
							<table class="memberInfo">
								<tr>
									<td>이름</td>
									<td>${member.name}</td>
									
								</tr>
								<tr>
									<td>은행</td>
									<td>
									<select id="bank">
									<option value="국민">국민</option>
									<option value="신한">신한</option>
									<option value="우리">우리</option>
									<option value="농협">농협</option>
									<option value="하나">하나</option>
									<option value="기업">기업</option>
									<option value="외환">외환</option>
									<option value="부산">부산</option>
									<option value="제주">제주</option>
									</select>
									</td>
								</tr>
								<tr>
									<td>계좌입력</td>
									<td><input type="text" id="account1" class="account">-<input type="text" id="account2" class="account">-<input type="text" id="account3" class="account"></td>
								</tr>
							</table>
							<a role="button" class="payDo" id="payAccount">결제하기</a>
							
				
						</form>
					</c:if>
				</div>
</body>
</html>