<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Community | Mission Detail</title>
<style>
:root {
	--t1-red: #E2012D;
	--t1-black: #ffffff;
	--t1-gray: #f6f6f6;
	--t1-gold: #8b6b3e;
}

body {
	background-color: #fafafa;
	font-family: 'Pretendard', sans-serif;
	color: #222;
	margin: 0;
	padding: 50px 0;
}

.detail-container {
	max-width: 800px;
	margin: 0 auto;
	background: #ffffff;
	border: 2px solid var(--t1-red);
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	overflow: hidden;
}

/* 상단 헤더 영역 */
.detail-header {
	background: #ffffff;
	padding: 30px;
	border-bottom: 1px solid #e5e5e5;
}

.detail-header .post-no {
	color: var(--t1-red);
	font-weight: bold;
	font-size: 0.9rem;
	margin-bottom: 10px;
	display: block;
}

.detail-header h1 {
	margin: 0;
	font-size: 1.9rem;
	letter-spacing: -1px;
	color: #111;
}

.post-info {
	margin-top: 15px;
	font-size: 0.9rem;
	color: #666;
	display: flex;
	gap: 20px;
}

.post-info span b {
	color: var(--t1-gold);
}

/* 본문 영역 */
.detail-content {
	padding: 40px 30px;
	min-height: 300px;
	line-height: 1.8;
	font-size: 1.05rem;
	white-space: pre-wrap;
	border-bottom: 1px solid #e5e5e5;
	background: #ffffff;
}

/* 하단 버튼 영역 */
.btn-area {
	padding: 20px 30px;
	background: #fafafa;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.btn {
	padding: 10px 25px;
	font-weight: bold;
	border-radius: 5px;
	text-decoration: none;
	transition: 0.25s;
	cursor: pointer;
	border: none;
	font-size: 0.9rem;
}

.btn-list {
	background: #e0e0e0;
	color: #222;
}

.btn-list:hover {
	background: #d5d5d5;
}

.btn-group {
	display: flex;
	gap: 10px;
}

.btn-edit {
	background: var(--t1-gold);
	color: #fff;
}

.btn-edit:hover {
	background: #75572f;
}

.btn-delete {
	background: var(--t1-red);
	color: #fff;
}

.btn-delete:hover {
	background: #c50026;
}

.btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 10px rgba(0,0,0,0.12);
}

/* 데코레이션 */
.footer-deco {
	padding: 15px;
	text-align: center;
	font-size: 0.75rem;
	color: #999;
	background: #fafafa;
}
</style>
</head>
<body>

	<div class="detail-container">
		<div class="detail-header">
			<span class="post-no">게시판번호. ${board.no}</span>
			<h1>${board.title}</h1>
			<div class="post-info">
				<span>WRITER: <b>${board.writer}</b></span> <span>DATE: <b><fmt:formatDate
							value="${board.regDate}" pattern="yyyy.MM.dd HH:mm" /></b></span>
			</div>
		</div>

		<div class="detail-content">${board.content}</div>

		<div class="btn-area">
			<a href="/board/boardList" class="btn btn-list">게시판 리스트</a>

			<div class="btn-group">
				<a href="/board/updateForm?no=${board.no}" class="btn btn-edit">수정하기</a>
				<a href="/board/delete?no=${board.no}" class="btn btn-delete"
					onclick="return confirm('정말 삭제하시겠습니까?')">삭제하기</a>
			</div>
		</div>

	</div>

</body>
</html>