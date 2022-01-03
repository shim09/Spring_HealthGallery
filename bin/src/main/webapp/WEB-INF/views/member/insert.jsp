<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
    <script>
    function idDuplicate() {
        const id = document.getElementById('m_id').value
        const checkResult = document.getElementById('id-dup-check')

        $.ajax({
            type: 'post',
            url: 'idDuplicate',
            data: {'m_id': id},
            dataType: 'text',
            success: function(result) {
                if(result=="ok") {
                	if(id.length>=5) {
                    checkResult.style.color="green"
                    checkResult.innerHTML="멋진 아이디네요!"            		
                	}
                } else {
                    checkResult.style.color="red"
                    checkResult.innerHTML="이미 사용중인 아이디입니다."
                }
            },
            error: function(result) {
                	
            }
        })

    }
    
    function idCheck() {
        const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,20}$/;
        const id=document.getElementById('m_id').value
        const idCheck=document.getElementById('idcheck')

        if(id.length!=0) {
        	if(id.length<5) {
        		idCheck.innerHTML="영어 숫자조합 5~20글자 이내로 작성해주세요"
            	idCheck.style.color="red"            		
        	} else {
        		idCheck.innerHTML=""
        	}
        } else {
            idCheck.innerHTML="필수정보입니다."
            idCheck.style.color="red"
        }
    }

        function pwCheckResult() {
            // 영문소문자, 숫자, 6~10자리 정규식 
            // 소문자 숫자가 반드시 1개 이상 사용되어야 함. 
            const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,10}$/;

            // 영문대소문자, 숫자, 6~10자리 정규식 
            // 소문자, 대문자, 숫자가 반드시 1개이상 사용되어야 함. 
            const exp1 = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,10}$/;

            // 네이버 비밀번호 정규식 
            // 영문소문자, 숫자, -_ 특수문자, 5~20자리
            // 소문자, 숫자, 특수문자(-_)가 반드시 1개 이상 사용되어야 함. 
            const exp2 = /^(?=.*[a-z])(?=.*\d)(?=.*[-_])[a-z\d-_]{5,20}$/;
            const pwValue = document.getElementById('m_pw').value;
            const pwCheckResult = document.getElementById('pwCheckResult');

            const pwLength = m_pw.length;
            // const pw = document.getElementById('pw').value;

            // const pwCheckResult = document.getElementById('pwCheckResult');

            if (pwLength == 0) {
                pwCheckResult.innerHTML = '필수 항목 입니다.';
                pwCheckResult.style.color = "red";
            } else if (pwValue.match(exp1)) {
                pwCheckResult.innerHTML = '사용 가능한 비밀번호입니다.'
                pwCheckResult.style.color = "green"
            } else {
                pwCheckResult.innerHTML = '영문 대,소문자,숫자 6~10자리 내로 입력해주세요.'
                pwCheckResult.style.color = "red"
            }

        }
        function pw1Check() {
            const pwValue = document.getElementById('m_pw').value;
            const pw1Value = document.getElementById('m_pw1').value;
            console.log(pwValue);
            console.log(pw1Value);

            if (pwValue == pw1Value) {
                pw1CheckResult.innerHTML = '비밀번호가 일치합니다.';
                pw1CheckResult.style.color = "green";
            } else {
                pw1CheckResult.innerHTML = '비밀번호가 일치하지 않습니다.';
                pw1CheckResult.style.color = "red";
            }
        }

        function phoneCheck() {
            const exp = /^\d{3}-\d{4}-\d{4}$/;
            const phone = document.getElementById('m_phone').value;
            const result = document.getElementById('m_phone-check-result')

            if (phone.match(exp)) {
                result.innerHTML = "사용 가능한 번호 입니다."
                result.style.color = 'green'
            } else {
                result.innerHTML = "-를 포함한 휴대폰 번호를 입력해주세요."
                result.style.color = 'red'
            }
        }

    </script>
</head>

<body>

<body>
	
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <h4 class="mb-3">회원가입</h4>
                <form action="insert" method="post">
                    <div class="row">
                        <div class="col-md-6 mb-3"> <label for="name">이름</label> 
                        <input type="text" name="m_name" class="form-control">
                            <div class="invalid-feedback" > 이름을 입력해주세요. </div>
                        </div>
                        성별:
                        <input type="radio" style="margin-left: 3px; margin-top: 6px;" name="lang" value="java">남
                        <input type="radio" style="margin-left: 3px; margin-top: 6px;" name="lang" value="mysql">여
                        <br>
                    </div> 
                    <div class="mb-3"><label for="id">ID</label>
                    <input type="text" name="m_id" onblur="idDuplicate(); idCheck()" id="m_id" placeholder="영소문자,숫자 조합하여 5~20자 이내" class="form-control">
                       <span id="id-dup-check"> </span> <span id="idcheck"> </span> <br>
                        </div> 
                        <div class="mb-3"><label for="pw">비밀번호</label><br>
                            <input type="text" id="m_pw" name="m_password" onblur="pwCheckResult()" placeholder="6~10자 내로 입력해주세요" class="form-control" >
                            <br> <span ID="pwCheckResult"><br>
                            </span>n
                        </div>
                        <div class="mb-3"><label for="pw1">비밀번호 재확인</label>
                            <input type="password" class="form-control" id="m_pw1" onkeyup="pw1Check()" maxlength="20"
                                placeholder="비밀번호 재입력"><br>
                            <span ID="pw1CheckResult"><br>
                            </span>
                            <br>
                        </div>
                        <div class="mb-3"><label for="phone">휴대폰 번호</label>
                            <input type="text" id="m_phone" name="m_phone" onblur="phoneCheck()" class="form-control"><br>
                            <span id="m_phone-check-result">
                            </span>
                        </div>
                        <p>
                        주소 입력<br>
                        <input type="text" id="sample6_postcode" placeholder="우편번호">
                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></p><br>
                        <p>
                        <input type="text" name="m_home" id="sample6_address" placeholder="주소"><br>
                        <input type="text" name="m_home1" id="sample6_detailAddress" placeholder="상세주소">
                        <input type="text" name="m_home2" id="sample6_extraAddress" placeholder="참고항목" style="margin-bottom: 10px;">
                        </p>
                        
                        <!-- cdn(contents delivery network)-->
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script>
                            function sample6_execDaumPostcode() {
                                new daum.Postcode({
                                    oncomplete: function(data) {
                                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                        
                                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                        var addr = ''; // 주소 변수
                                        var extraAddr = ''; // 참고항목 변수
                        
                        
                        
                        
                                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                            addr = data.roadAddress;
                                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                            addr = data.jibunAddress;
                                        }
                        
                                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                        if(data.userSelectedType === 'R'){
                                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                                extraAddr += data.bname;
                                            }
                                            // 건물명이 있고, 공동주택일 경우 추가한다.
                                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                            }
                                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                            if(extraAddr !== ''){
                                                extraAddr = ' (' + extraAddr + ')';
                                            }
                                            // 조합된 참고항목을 해당 필드에 넣는다.
                                            document.getElementById("sample6_extraAddress").value = extraAddr;
                                        
                                        } else {
                                            document.getElementById("sample6_extraAddress").value = '';
                                        }
                        
                                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                        document.getElementById('sample6_postcode').value = data.zonecode;
                                        document.getElementById("sample6_address").value = addr;
                                        // 커서를 상세주소 필드로 이동한다.
                                        document.getElementById("sample6_detailAddress").focus();
                                    }
                                }).open();
                            }
                        </script>
                        <div class="row mb-3"> <label for="email">이메일</label> <input type="text" name="m_email" placeholder="you@domain.com" required class="form-control">
                            <div class="invalid-feedback"> 이메일을 입력해주세요. </div>
                            <i class="fas fa-at" style="margin-left: 3px;margin-top:12px;margin-right: 3px;"></i>
                            <select name="domain" class="form-control">
                                <option value="" >직접입력</option>
                                <option value="naver.com" >naver.com</option>
                                <option value="hanmail.com">hanmail.com</option>
                                <option value="daum.net">daum.net</option> 
                            </select>
                            </div>

                            <div class="mb-4"><button class="btn btn-primary btn-lg btn-block" type="submit" style="background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
                                background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
                                background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
                                background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
                                background: linear-gradient(to top right, #0a2542 0%, #01070c 100%);">가입
                            완료</button>
                            </div> 
                        </form>
                    </div>
                </div>
        <footer class="my-3 text-center text-small">
            <p class="mb-1">&copy; 2021 YD</p>
        </footer>
    </div>
    <script> window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form'); Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) { if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); } form.classList.add('was-validated'); }, false); }); }, false); </script>
</body>

</html>