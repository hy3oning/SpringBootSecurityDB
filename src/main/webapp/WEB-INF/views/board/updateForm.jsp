<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
.container {
	width: 500px;
	margin: 20px auto;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"], textarea {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
}

textarea {
	height: 200px;
	resize: vertical;
}

.btn-area {
	text-align: right;
}

button {
	padding: 10px 20px;
	cursor: pointer;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
}
</style>
</head>
<body>

	<div class="container">
		<h2>${board.writer}님의게시글수정</h2>
		<form action="/board/update" method="post">
			<div class="form-group">
				<label for="no">작성자번호</label> <input type="text" id="no" name="no"
					value="${board.no}" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text" id="title"
					name="title" value="${board.title}" required>
			</div>

			<div class="form-group">
				<label for="writer">작성자</label> <input type="text" id="writer"
					name="writer" value="${board.writer}" readonly>
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea id="content" name="content" required>${board.content}</textarea>
			</div>

			<div class="btn-area">
				<button type="submit">수정등록하기</button>
				<button type="reset" style="background-color: #6c757d;">수정취소</button>
			</div>
		</form>
	</div>

</body>
</html>