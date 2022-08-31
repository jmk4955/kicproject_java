<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/view/css/petBoard.css">
</head>
<body>
 <section class="module petBoard">
    <div class="inner">
      <div class="modHead center">
        <h2>입양공고</h2>
        <div class="box center">
          <div class="searchBox center">
            <input type="text">
            <div class="searchIcon">
              <svg viewBox="0 0 512 512">
                <path d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z"/>
              </svg>
            </div>
          </div>
          <a href="${ pageContext.request.contextPath }/board/adoptBoardForm" class="btn white">
            글쓰기?
          </a>
        </div>
      </div>

      <div class="modContent center">
        <c:if test="${ boardCount == 0 }">
        	<p>등록된 게시물이 없습니다. 작성부터 하고 좀 조회하세여</p>
        </c:if>
        
        <c:if test="${ boardCount > 0 }">
        
        <c:forEach var="b" items="${ list }">
        <a href="${ pageContext.request.contextPath }/board/adoptBoardInfo?adoptId=${b.adoptId}">
        <div class="modCard">
          <div class="cardImg">
            <img src="${ pageContext.request.contextPath }/view/board/img/${ b.petImg }" alt="">
          </div>
          <div class="cardInfo">
            <div class="inner">

              <div class="infoContent center">
                <div class="name">조회수 :</div> 
                <div>
                  ${ b.readCnt }
                </div>
              </div>

              <div class="infoContent center">
                <div class="name">이름 :</div>
                <div>
                 ${ b.petName }
                </div>
              </div>

              <div class="infoContent center">
                <div class="name">성별 :</div>
                <div>
                  ${ b.petGender == 1 ? "남아" : "여아" }
                </div>
              </div>

              <div class="infoContent center">
                <div class="name">특징 :</div>
                <div>
                  ${ b.petDetail }
                </div>
              </div>

              <div class="infoContent center">
                <div class="name">중성화 :</div>
                <div>
                  ${ b.neuter == 0 ? "미완료" : "완료" }
                </div>
              </div>

              <div class="infoContent center">
                <div class="name">접종 :</div>
                <div>
                  ${ b.vaccin == 0 ? "미완료" : "완료" }
                </div>
              </div>

              <div class="infoContent center regDate">
                <div class="name">작성일 :</div>
                <div>
                  ${ b.regDate }
                </div>
              </div>

            </div>
          </div>
        </div>
        </a>
        </c:forEach>
        
        </c:if>
      </div>

      <div class="modPage center">
        <a <c:if test="${ start >= 3}" >href="${ pageContext.request.contextPath }/board/adoptBoard?pageNum=${start-3}"</c:if> ><<</a>
        <c:forEach var="p" begin="${ start }" end="${ end }">
		  	<a href="${ pageContext.request.contextPath }/board/adoptBoard?pageNum=${p}" >${ p }</a>
		</c:forEach>
		<a <c:if test="${ end < maxPage }">href="${ pageContext.request.contextPath }/board/petBoard?pageNum=${end + 3}"</c:if>>>></a>
      </div>
    </div>
  </section>
</body>
</html>