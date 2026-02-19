<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h2>게시글 작성</h2>
		<form action="/board/insert" method="post">
			<div class="form-group">
				<label for="title">제목</label> <input type="text" id="title"
					name="title" placeholder="제목을 입력하세요" required>
			</div>

			<div class="form-group">
				<label for="writer">작성자</label> <input type="text" id="writer"
					name="writer" placeholder="작성자 이름" required>
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea id="content" name="content" placeholder="내용을 입력하세요"></textarea>
			</div>

			<div class="btn-area">
				<button type="submit">등록하기</button>
				<button type="reset" style="background-color: #6c757d;">취소</button>
			</div>
		</form>
	</div>

</body>
</html>