<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/memberInfo.css">
</head>
<body>
 <form action="${ pageContext.request.contextPath }/member/memberUpdatePro" method="post">
<section class="module memberInfo center">
    <div class="inner center">
        <h2 class="subject center">
          회원수정
        </h2>
       <input type="hidden" value="${mem.userId }" name="userId" >
     
          <div class="name center">
            <h3>아이디</h3>
            <span>${sessionScope.userId }</span>
          </div>
          <div class="center">
            <h3>비밀번호</h3>
            <input type="password" name="pwd" required>
          </div>
          <div class="center">
            <h3>주소</h3>
            <div class="address center" style="height: auto;">
            	<input type="text" id="roadAddress" name="address" readonly placeholder="예)서울 관악구" value="${mem.address }">
          		<input style="height: 30px; margin-left: 3px;" type="button" onclick="execDaumPostcode()" class="btn white" value="주소 검색">
          	</div>
          </div>
          <div class="center">
            <h3>이메일</h3>
            <span>
            	<input type="email" name="email" value="${mem.email }">
            </span>
          </div>
          <div class="center">
            <h3>전화번호</h3>
            <span>
            	<input type="number" name="tel" value="${ mem.tel }" oninput="maxLengthCheck(this)" maxlength="11" placeholder="예) 01012345678">
            </span>            
          </div>
          <div class="center">
            <h3>반려동물 이름</h3>
            <input type="text" name="petName" maxlength="10" value="${mem.petName }">
          </div>
          <div class="box center ">
            <input type="submit" class="btn white" value="수정완료">
          </div>
  		
      </div>
</section>
</form>

<script type="text/javascript">

function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("roadAddress").value = roadAddr;
              
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                
               <%-- if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }
				--%>
				<%--
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                --%>
            }
        }).open();
    }
</script>
</body>
</html>