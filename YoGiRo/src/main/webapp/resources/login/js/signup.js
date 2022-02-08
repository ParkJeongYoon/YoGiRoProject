

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

function checkPassword(id, pw1, pw2) {
	//비밀번호가 입력되었는지 확인하기
	if (!checkExistData(pw1, "비밀번호를"))
		return false;
	//비밀번호 확인이 입력되었는지 확인하기
	if (!checkExistData(pw2, "비밀번호 확인을"))
		return false;

	var password1RegExp = /^[a-z0-9]{8,20}$/; //비밀번호 유효성 검사
	if (!password1RegExp.test(password1)) {
		alert("비밀번호는 영문 대소문자와 숫자 8~20자리로 입력해야합니다!");
		form.password1.value = "";
		form.password1.focus();
		return false;
	}
	//비밀번호와 비밀번호 확인이 맞지 않다면..
	if (password1 != password2) {
		alert("두 비밀번호가 맞지 않습니다.");
		form.password1.value = "";
		form.password2.value = "";
		form.password2.focus();
		return false;
	}

	//아이디와 비밀번호가 같을 때..
	if (id == password1) {
		alert("아이디와 비밀번호는 같을 수 없습니다!");
		form.password1.value = "";
		form.password2.value = "";
		form.password2.focus();
		return false;
	}
	return true; //확인이 완료되었을 때
}

function checkMail(mail) {
	//mail이 입력되었는지 확인하기
	if (!checkExistData(mail, "이메일을"))
		return false;

	var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	if (!emailRegExp.test(mail)) {
		alert("이메일 형식이 올바르지 않습니다!");
		form.mail.value = "";
		form.mail.focus();
		return false;
	}
	return true; //확인이 완료되었을 때
}