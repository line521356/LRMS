function checkNum(value) {
	var regex = /^[0-9]{1}[0-9]*$/;
	return regex.test(value);
}

function checkInteger(value) {
	var regex = /^\d+$/;
	return regex.test(value);
}

function checkPositiveInt(value) {
	var regex = /^[1-9]\d*$/;
	return regex.test(value);
}

function checkDouble(value) {
	var regex = /^[+]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+]?[0-9]+)?$/;
	return regex.test(value);	
}

function checkDoubleExcludeZero(value) {
	var regex = /^(?!(0[0-9]{0,}$))[0-9]{1,}[.]{0,}[0-9]{0,}$/;
	return regex.test(value);	
}

function checkChar(value) {
	var regex = /^[a-zA-Z]+$/;
	return regex.test(value);
}

function checkCharAndNum(value) {
	var regex = /^[a-zA-Z0-9]+$/;
	return regex.test(value);
}

function checkMobile(value) {
	var regex = /^1((3|5|8){1}\d{1}|70|77)\d{8}$/;
	return regex.test(value);
}

function checkEmail(value) {
	var regex = /^[A-Za-z0-9._%-]+@([A-Za-z0-9-]+\.)+[A-Za-z]{2,4}$/;
	return regex.test(value);
}

function checkTel(value) {
	var regex = /^0\d{2,3}-\d{7,8}$/;
	return regex.test(value);
}

function checkLength(value, len) {
	return value.length <= len;
}

function checkBlank(value) {
	value = value.replace(/(^\s*)|(\s*$)/g, "");
	return value.length > 0;
}

function checkLengthBetween(value, start, end) {
	return (value.length >= start && value.length <= end);
}
function checkName(value){
	var regex=/^[0-9a-zA-Z\u4e00-\u9fa5 ]+$/;
	return regex.test(value);
}

function checkNodeIdLength(value, len) {
	return value.length == len;
}
