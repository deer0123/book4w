<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>도서 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: #f9f9f9;
        }

        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px;
        }

        h2 {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            gap: 30px;
            padding: 20px;
        }

        .card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 16px;
            flex: 1 1 calc(33.333% - 40px); /* flex-grow, flex-shrink, flex-basis 조정 */
            box-sizing: border-box;
            text-align: center;
            transition: transform 0.2s;
            cursor: pointer;
            min-width: 250px; /* 최소 너비 설정 */
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            font-size: 1.2em;
            margin: 10px 0;
        }

        .card p {
            margin: 5px 0;
            color: #555;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            padding: 20px 0;
        }

        .pagination a {
            margin: 0 5px;
            padding: 8px 16px;
            text-decoration: none;
            color: #000;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .pagination a:hover {
            background-color: #ddd;
        }

        .pagination .active {
            background-color: #4CAF50;
            color: white;
        }

        .sort-container {
            margin-left: auto;
        }

        .search-container {
            margin-right: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>
        <a href="${pageContext.request.contextPath}/board/list" style="text-decoration: none; color: black;">도서 목록</a>
        <div class="sort-container">
            <form action="${pageContext.request.contextPath}/board/list" method="get">
                <input type="hidden" name="page" value="0" />
                <input type="hidden" name="query" value="${param.query}" />
                <label for="sort">정렬 기준:</label>
                <select name="sort" id="sort" onchange="this.form.submit()">
                    <option value="">기본 정렬</option>
                    <option value="likeCount" <c:if test="${param.sort == 'likeCount'}">selected</c:if>>좋아요 순</option>
                    <option value="reviewCount" <c:if test="${param.sort == 'reviewCount'}">selected</c:if>>리뷰 수 순</option>
                    <option value="rating" <c:if test="${param.sort == 'rating'}">selected</c:if>>평점 수 순</option>
                </select>
            </form>
        </div>
    </h2>

    <div class="card-container">
        <c:if test="${not empty bList}">
            <c:forEach var="book" items="${bList}">
                <a href="${pageContext.request.contextPath}/board/detail/${book.id}" class="card-link" style="text-decoration: none; color: inherit;">
                    <div class="card">
                        <h3>${book.name}</h3>
                        <p><strong>저자:</strong> ${book.writer}</p>
                        <p><strong>출판사:</strong> ${book.pub}</p>
                        <p><strong>출판 연도:</strong> ${book.year}</p>
                        <p><strong>평점:</strong> ${book.rating}</p>
                        <p><strong>리뷰 수:</strong> ${book.reviewCount}</p>
                        <p><strong>좋아요 수:</strong> ${book.likeCount}</p>
                    </div>
                </a>
            </c:forEach>
        </c:if>

        <c:if test="${empty bList}">
            <p>검색 결과가 없습니다.</p>
        </c:if>
    </div>

    <!-- 페이지네이션 -->
    <div class="pagination">
        <c:if test="${maker.hasPrevious()}">
            <a href="?sort=${param.sort}&query=${param.query}&page=${maker.number - 1}" class="prev">&laquo; 이전</a>
        </c:if>

        <c:if test="${maker.totalPages > 0}">
            <c:forEach var="i" begin="0" end="${maker.totalPages - 1}">
                <a href="?sort=${param.sort}&query=${param.query}&page=${i}" class="${i == maker.number ? 'active' : ''}">${i + 1}</a>
            </c:forEach>
        </c:if>

        <c:if test="${maker.hasNext()}">
            <a href="?sort=${param.sort}&query=${param.query}&page=${maker.number + 1}" class="next">다음 &raquo;</a>
        </c:if>
    </div>

</div>

</body>
</html>
