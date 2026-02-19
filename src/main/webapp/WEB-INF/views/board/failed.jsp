<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 처리 결과</title>
<style>
/* 기존 스타일 유지 */
.container {
	width: 500px;
	margin: 20px auto;
	text-align: center; /* 텍스트 중앙 정렬 추가 */
}

.btn-area {
	margin-top: 30px;
	display: flex;
	justify-content: center;
	gap: 10px; /* 버튼 사이 간격 */
}

/* 버튼 공통 스타일 */
.btn {
	padding: 10px 20px;
	cursor: pointer;
	color: white;
	border: none;
	border-radius: 4px;
	text-decoration: none; /* 링크 밑줄 제거 */
	font-size: 14px;
	display: inline-block;
}

.btn-primary {
	background-color: #007bff;
} /* 작성하러 가기 */
.btn-secondary {
	background-color: #6c757d;
} /* 목록으로/취소 */
.btn:hover {
	opacity: 0.9;
}
</style>
</head>
<body>

	<div class="container">
		<h2>게시글 입력실패</h2>
		<p>작성하신 글이 등록되지 않았습니다..</p>

		<div class="btn-area">
			<a href="/board/insertForm" class="btn btn-primary">다시 작성하기</a> <a
				href="/board/boardList" class="btn btn-secondary">목록으로 이동</a>
		</div>
	</div>

</body>
</html>