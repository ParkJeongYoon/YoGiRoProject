/*
function checkAll() {
	if (!checkUserId(form.userid.value)) {
		return false;
	} else if (!checkPassword(form.userid.value, form.pw1.value,
		form.pw2.value)) {
		return false;
	} else if (!checkMail(form.usermail.value)) {
		return false;
	} else if (!checkName(form.username.value)) {
		return false;
	} else if (!checkNickName(form.usernickname.value)) {
		return false;
	} else if (!checkFavorite()) {
		return false;
	} else if (!checkIntro()) {
		return false;
	}
	return true;
}

function checkUserId(id) {
	//Id가 입력되었는지 확인하기
	if (!checkExistData(id, "아이디를"))
		return false;

	var idRegExp = /^[a-z0-9]{4,20}$/; //아이디 유효성 검사
	if (!idRegExp.test(id)) {
		alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
		form.userId.value = "";
		form.userId.focus();
		return false;
	}
	return true; //확인이 완료되었을 때
}

function checkName(name) {
	if (!checkExistData(name, "이름을"))
		return false;

	var nameRegExp = /^[가-힣]{2,5}$/;
	if (!nameRegExp.test(name)) {
		alert("이름이 올바르지 않습니다.");
		return false;
	}
	return true; //확인이 완료되었을 때
}
*/

function checkPassword() {
	let pw1 = document.getElementById('pw1').value;
	let pw2 = document.getElementById('pw2').value;

	var password1RegExp = /^[a-z0-9]{8,20}$/; //비밀번호 유효성 검사
	if (!password1RegExp.test(pw1)) {
		alert("비밀번호는 영문 대소문자와 숫자 8~20자리로 입력해야합니다!");
		pw1 = "";
		document.getElementById('pw1').focus();
		return false;
	}
	//비밀번호와 비밀번호 확인이 맞지 않다면..
	if (pw1 != pw2) {
		document.getElementById('check').innerHTML="비밀번호가 일치하지 않습니다.";
		document.getElementById('check').style.color="red";
		pw1 = "";
		pw2 = "";
		document.getElementById('pw2').focus();
		return false;
	}else {
		document.getElementById('check').innerHTML="비밀번호가 일치합니다.";
	}

function checkMail() {
	let email = document.getElementById('checkemail').value;

	var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	if (!emailRegExp.test(email)) {
		alert("이메일 형식이 올바르지 않습니다!");
		email = "";
		document.getElementById('checkmail').focus();
		return false;
	}
	return true; //확인이 완료되었을 때
	}
}