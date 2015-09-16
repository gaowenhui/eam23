<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

// 检验日期格式
function checkDate(thisDate){
	var theDate = thisDate.value;
	var flag = isDate(theDate);
	if(flag == false){
		alert('请输入正确的日期格式例如2010-01-01');
		thisDate.focus();
	}
}

// 检验中文名称
function checkChar(thisChar){
	var flag = chechkTextBoxValue(thisChar,'Chinese','N');
}

// 检验数字
function checkNumber(thisNum){
	var theNum = thisNum.value;
	var flag = isNumber(theNum);
	if(flag == false){
		alert('只能输入阿拉伯数字');
		thisNum.focus();
	}
}

// 检验float （金额）
function checkFloat(thisFloat){
	var theFloat =thisFloat.value;
	var flag = isFloat(theFloat);
	if(flag==false){
		alert('请输入正确的金额');
		thisFloat.focus();
	}
	for(var i = 0; i < theFloat.length;i++){
		var ch=theFloat.charAt(i);
		if(ch=='.'){
			if(theFloat.length - i > 3){
				alert('小数点后面最多只能有两位');
				thisFloat.focus();
			}
		}
	}
}
function checkNumber2(thisFloat){
	var theFloat =thisFloat.value;
	var flag = isFloat(theFloat);
	if(flag==false){
		alert('请输入正确的数字');
		thisFloat.focus();
	}
}
// 检验百分比
function checkPresent(thisPresent){
	var thePresent = thisPresent.value;
	var flag = isFloat(thePresent);
	if(flag==false){
		alert('请输入正确的百分比');
		thisPresent.focus();
	}
	if(parseFloat(thePresent) > 100){
		alert('输入的百分比不能大于100');
		thisPresent.focus();
	}
	for(var i = 0; i < thePresent.length;i++){
		var ch=thePresent.charAt(i);
		if(ch=='.'){
			if(thePresent.length - i > 3){
				alert('小数点后面最多只能有两位');
				thisPresent.focus();
			}
		}
	}
}


// 检验输入的字符串是否有特殊符号
function isString(thisString){
	var theString = thisString.value;
	var flag = checkString(theString);
	if(flag==false){
		alert('输入的字符串中带有特殊符号，请重新输入');
		thisString.focus();
	}
}

// 检验电话号码
function checkPhone(thisPhone){
	var thePhone = thisPhone.value;
	var flag = thePhone.isPhone();
	var flag1 = thePhone.isMobile();
	if(!flag && !flag1){
		thisPhone.focus();
		alert("电话号码不正确，请重新输入。");
	}
}
</script>
</head>
<body>

</body>
</html>