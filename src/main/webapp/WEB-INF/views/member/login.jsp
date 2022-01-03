<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 화면 샘플 - Bootstrap</title> <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <style>
        body {
            min-height: 100vh;
            background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
            background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: linear-gradient(to top right, #0a2542 0%, #01070c 100%);
        }

        .input-form {
            max-width: 680px;
            margin-top: 80px;
            padding: 32px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <h4 class="mb-3">로그인 페이지</h4>
	<form action = "/member/login" method="post">
	 <div class="row">
		<div class="mb-3"><label for="id">ID</label> 
		: <input type ="text" name ="m_id" placeholder="아이디를 입력하세요" class="form-control"><br>
		PW : <input type ="password" name="m_password" placeholder="비밀번호를 입력하세요" class="form-control"><br>
		                         <div class="mb-4"><button class="btn btn-primary btn-lg btn-block" type="submit" style="background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
                                background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
                                background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
                                background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
                                background: linear-gradient(to top right, #0a2542 0%, #01070c 100%);">
                            Login</button>
                            </div> 
		</div>
	</form>
	</div>
	</div>
	</div>
</body>
</html>