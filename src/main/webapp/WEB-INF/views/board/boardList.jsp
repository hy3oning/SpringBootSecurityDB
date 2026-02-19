<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Community | Board List</title>
<style>
:root {
	--t1-red: #E2012D;
	--t1-black: #ffffff;
	--t1-gray: #f5f5f5;
	--t1-gold: #8b6b3e;
	--t1-table-hover: #f0f0f0;
}

body {
	background-color: var(--t1-black);
	font-family: 'Pretendard', sans-serif;
	color: #222;
	margin: 0;
	padding: 50px 0;
}

.container {
	max-width: 1000px;
	margin: 0 auto;
	padding: 0 20px;
}

.header-box {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	border-bottom: 3px solid var(--t1-red);
	padding-bottom: 15px;
	margin-bottom: 30px;
}

.header-box h1 {
	font-size: 2.5rem;
	font-weight: 900;
	margin: 0;
	letter-spacing: -1.5px;
	color: #111;
}

.header-box h1 span {
	color: var(--t1-red);
}

.btn-write {
	background: var(--t1-red);
	color: white;
	text-decoration: none;
	padding: 10px 25px;
	font-weight: bold;
	border-radius: 4px;
	transition: 0.3s;
	text-transform: uppercase;
}

.btn-write:hover {
	background: #c50026;
}

/* Table Styles */
.t1-table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 15px rgba(0,0,0,0.08);
}

.t1-table th {
	background: #fafafa;
	color: var(--t1-red);
	padding: 15px;
	font-size: 0.9rem;
	text-transform: uppercase;
	border-bottom: 2px solid #e5e5e5;
}

.t1-table td {
	padding: 15px;
	text-align: center;
	border-bottom: 1px solid #eee;
	font-size: 0.95rem;
	color: #333;
}

.t1-table tr:last-child td {
	border-bottom: none;
}

/* Hover Effect */
.t1-table tbody tr {
	transition: 0.2s;
	cursor: pointer;
}

.t1-table tbody tr:hover {
	background-color: var(--t1-table-hover);
	color: #000;
}

.title-cell {
	text-align: left !important;
	padding-left: 30px !important;
}

.title-cell a {
	color: #222;
	text-decoration: none;
	font-weight: 500;
}

.title-cell a:hover {
	color: var(--t1-red);
}

/* Footer */
.table-footer {
	margin-top: 20px;
	text-align: right;
	font-size: 0.8rem;
	color: #777;
	font-family: monospace;
}

/* Search Bar */
.search-container {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
	gap: 10px;
}

.search-form {
	display: flex;
	background: white;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 5px;
	transition: 0.3s;
}

.search-form:focus-within {
	border-color: var(--t1-red);
	box-shadow: 0 0 8px rgba(226, 1, 45, 0.25);
}

.search-select {
	background: transparent;
	color: #444;
	border: none;
	outline: none;
	padding: 5px 10px;
	font-weight: bold;
	cursor: pointer;
}

.search-input {
	background: transparent;
	border: none;
	border-left: 1px solid #ddd;
	color: #222;
	padding: 8px 15px;
	width: 200px;
	outline: none;
}

.btn-search {
	background: transparent;
	border: none;
	color: var(--t1-red);
	font-weight: 800;
	cursor: pointer;
	padding: 0 15px;
	transition: 0.3s;
}

.btn-search:hover {
	color: #c50026;
}
</style>
</head>
<body>

	<div class="container">
		<div class="header-box">
			<h1>
				BOARD <span>LIST</span>
			</h1>
			<a href="/board/insertForm" class="btn-write">게시글 작성</a>
			<a href="/board/boardList" class="btn-write">새로고침</a>
		</div>

		<div class="search-container">
			<form action="/board/search" method="get" class="search-form">
				<select name="searchType" class="search-select">
					<option value="title">TITLE</option>
					<option value="writer">WRITER</option>
					<option value="content">CONTENT</option>
				</select> <input type="text" name="keyword" class="search-input"
					placeholder="Search">
				<button type="submit" class="btn-search">SEARCH</button>
			</form>
		</div>

		<table class="t1-table">
			<thead>
				<tr>
					<th width="10%">No</th>
					<th width="50%">Title</th>
					<th width="15%">Writer</th>
					<th width="25%">Date</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty boardList}">
						<c:forEach var="board" items="${boardList}">
							<tr>
								<td>${board.no}</td>
								<td class="title-cell"><a
									href="/board/detail?no=${board.no}">${board.title}</a></td>
								<td>${board.writer}</td>
								<td><fmt:formatDate value="${board.regDate}"
										pattern="yyyy.MM.dd" /></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" style="padding: 50px; color: #555;">작성된 게시글이
								없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<div class="table-footer">[ SYSTEM: CONNECTED TO
			JDBCBOARD_SEQ.NEXTVAL ]</div>
	</div>

</body>
</html>