<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${book.name} - 상세 정보</title>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        .book-detail-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
        }

        .book-cover {
            width: 400px; /* 기존 크기의 2배 */
            height: 600px; /* 기존 크기의 2배 */
            margin-right: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .book-cover img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .book-info {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .book-info h2 {
            margin-bottom: 20px;
        }

        .book-meta {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<header>
    <h1>책 상세 정보</h1>
</header>

<div class="book-detail-container">
    <!-- 책 표지 -->
    <div class="book-cover">
        <c:choose>
            <c:when test="${not empty book.coverImage}">
                <img src="${book.coverImage}" alt="${book.name}의 표지" />
            </c:when>
            <c:otherwise>
                <img src="https://via.placeholder.com/400x600" alt="기본 표지 이미지" />
            </c:otherwise>
        </c:choose>
    </div>

    <!-- 책 기본 정보 -->
    <div class="book-info">
        <h2>${book.name}</h2>
        <p><strong>작가:</strong> ${book.writer}</p>
        <p><strong>출판사:</strong> ${book.pub}</p>
        <p><strong>출판년도:</strong> ${book.year}</p>

        <!-- 책 평점, 좋아요 및 리뷰 정보 -->
        <div class="book-meta">
            <p><strong>평점:</strong> ${book.rating} / 5.0</p>
            <p><strong>좋아요 수:</strong> ${book.likeCount}</p>
            <p><strong>리뷰 수:</strong> ${book.reviewCount}</p>
        </div>
    </div>
</div>

<!-- 리뷰 리스트 -->
<div class="review-list">
    <h3>리뷰 목록</h3>
    <c:forEach var="review" items="${reviewList.content}">
    <div class="review-item">
        <div class="review-meta">
            <p>작성자: ${review.memberName} : 내용: ${review.content} : 평점: ${review.rating} / 5.0</p>
        </div>
    </div>
</c:forEach>

    <!-- 페이징 처리 -->
    <div class="pagination">
        <c:if test="${reviewList.hasPrevious()}">
            <a href="?page=${reviewList.number - 1}">이전</a>
        </c:if>
        <c:if test="${reviewList.hasNext()}">
            <a href="?page=${reviewList.number + 1}">다음</a>
        </c:if>
    </div>
</div>


<footer>
    <p>&copy; 2024 Book4W. All rights reserved.</p>
</footer>
</body>
</html>
