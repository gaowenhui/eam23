/* 
 * 页面验证JS，尽可能调用这个方法来处理。
 * and open the template in the editor.
 */

/**
 @param inputName 输入框的名字.
 @param inputType 输入框类型,如QQ,Email,Phone 等
 @param isNotNull 是否可以为空.'Y'-不能为空,'N'-可以为空
 **/
function chechkTextBoxValue(inputName,inputType,isNotNull){

    var obj=new Array();
    var objReg=new Array();
    var objMsg=new Array();

    obj[0] = "Email";
    obj[1] = "Phone";
    obj[2] = "Mobile";
    obj[3] = "Url";
    obj[4] = "IdCard";
    obj[5] = "Currency";
    obj[6] = "Number0";
    obj[7] = "Zip";
    obj[8] = "QQ";
    obj[9] = "Integer";
    obj[10] = "Double";
    obj[11] = "English";
    obj[12] = "Chinese";

 objReg[0]   =  /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
 objReg[1]   =   /^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}$/;
 objReg[2]   =  /^((\(\d{3}\))|(\d{3}\-))?13\d{9}$/;
 objReg[3]   =  /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
 objReg[4]   =  /^\d{15}(\d{2}[A-Za-z0-9])?$/;
 objReg[5]   =  /^\d+(\.\d+)?$/;
 objReg[6]   =  /^\d+$/;
 objReg[7]   =  /^[1-9]\d{5}$/;
 objReg[8]   =  /^[1-9]\d{4,8}$/;
 objReg[9]   =  /^[-\+]?\d+$/;
 objReg[10]   =  /^[-\+]?\d+(\.\d+)?$/;
 objReg[11]   =  /^[A-Za-z]+$/;
 objReg[12]   =   /^[\u0391-\uFFE5]+$/;

 objMsg[0] = "请输入正确的邮件地址.";
 objMsg[1] = "请输入正确的固定电话.";
 objMsg[2] = "请输入正确的移动电话.";
 objMsg[3] = "请输入正确的URL."
 objMsg[4] = "请输入正确的身份证件号码."
 objMsg[5] = "请输入正确的货币.";
 objMsg[6] = "请输入正确的数字.";
 objMsg[7] = "请输入正确的邮编.";
 objMsg[8] = "请输入正确的QQ号码.";
 objMsg[9] = "请输入整数.";
 objMsg[10] = "请输入浮点数.";
 objMsg[11] = "请输入英文字母.";
 objMsg[12] = "请输入汉字.";


 var inputValue=inputName.value;
 for(var i=0;i<obj.length;i++){
    if(obj[i]==inputType){
        if((inputValue.length>0||isNotNull=='Y')&&!objReg[i].test(inputValue)){
            alert(objMsg[i]);
               inputName.focus();
            return false;
        }
       }
 }
}
String.prototype.isDate = function(){
     var regs = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;
     return regs.test(this);
}
String.prototype.isEnglish = function(){
    var regs =  /^[A-Za-z]+$/;
    return regs.test(this);
}

String.prototype.isChinese = function(){
    var regs  =   /^[\u0391-\uFFE5]+$/;
    return regs.test(this);
}

String.prototype.isUrl = function(){
    var regs = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
    return regs.test(this);
}

String.prototype.isPhone = function(){
    var regs  =   /^\d*$/;
    return regs.test(this);
}

String.prototype.isMobile = function(){
   var regs =/^[1]([3|5|8]{1})[0-9]{9}$/g;
   return regs.test(this);
}

String.prototype.isDouble = function(){
    var doub   = /^[-\+]?\d+(\.\d+)?$/;
    return doub.test(this);
}
String.prototype.isInteger = function(){
    var regs =  /^[-\+]?\d+$/;
    return regs.test(this);
}

String.prototype.trim = function(){
   return this.replace(/(^\s*)|(\s*$)/g, "");
}


String.prototype.isTime = function(){
   if (this == null || this == "")
        return false;
    var pos = this.indexOf(":");
    if (pos == -1)
        return false;
    var h = this.substr(0, pos);
    if (h.length > 2 || !this.isInt())
        return false;
    if (h * 1 < 0 || h * 1 >= 24)
        return false;
    var m = this.substr(pos + 1);
    if (m.length > 2 || !this.isInt())
        return false;
    if (m < 0 || m >=60)
        return false;
    return true;
}

String.prototype.isZip = function(){
    var regs =  /^[1-9]\d{5}$/;
    return regs.test(this);
}

String.prototype.isNumber = function(){
    var reg = /^\d+$/;
    return reg.test(this); 
}

function isNumber(str) {
    return str.isNumber();
}


function testchechkTextBoxValue(){
    var in1=document.getElementById("in1");
    if(chechkTextBoxValue(in1,"QQ",'N')==false){
      return false;
    }
}

function isPhoneWithoutAlert(phone){
	if(phone!=""&&phone.length<3)
	{
		return false;
	}
	hasNumericChar=true;
	for (i = 0; i <  phone.length ; i++)
	{
		if( (phone.charAt(i)<'0' || phone.charAt(i)>'9') && phone.charAt(i)!='-'
		&& phone.charAt(i)!=')'
		&& phone.charAt(i)!='(')
		{
			return false;
		}
		if(hasNumericChar&&phone.charAt(i)>'0' && phone.charAt(i)<'9')
	  		hasNumericChar=false;
		if(hasNumericChar&&(i>=phone.length-1))
		{
	  		return false;
		}
	}
	return true;
}
function isInt(n) {
	var i = parseInt(n*1);
	if (i == NaN) {
		return false;
	}
	if (i != n){
		return false;
	}
	return true;
}

function isFloat(str) {
	var ch=str.charAt(0);
	if( ch == "." ) return false;
    for (var i=0; i < str.length; i++)
	{ch=str.charAt(i);
		if ((ch != ".") && (ch != "0") && (ch != "1") && (ch != "2") && (ch != "3") && (ch != "4") && (ch != "5") && (ch != "6") && (ch != "7") && (ch != "8") && (ch != "9"))
			return false;
	}
    return true;
}
function checkMobilePhoneWithoutAlert(phone){
	if(phone!=""&&phone.length<11)
	{
		return false;
	}
	hasNumericChar=true;
	for (i = 0; i <  phone.length ; i++)
	{
		if( phone.charAt(i)<'0' || phone.charAt(i)>'9')
		{
			return false;
		}
		if(hasNumericChar&&phone.charAt(i)>'0' && phone.charAt(i)<'9')
	  		hasNumericChar=false;
		if(hasNumericChar&&(i>=phone.length-1))
		{
	  		return false;
		}
	}
	return true;
}

/*
	函数名称：trim
	函数功能: 去除字符串头部和尾部的空格
	传入参数：字符串变量
	传出结果：处理后的子串
*/
function trim(str){
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

function checkSpace(str){
	if(str.indexOf(" ") != -1 ){
		return true;
	}
}
/*  函数功能：判断传入参数是否为yyyy-mm-dd或
			  yyyy/mm/dd格式的正确日期
			  2001/01/2和2001-3-04也是允许的格式
			  如果是，则返回一个对应的日期对象
			  如果否，则返回false
*/
function isDate(strDate){
	var regYear = /\d{4}[-/]/g;	//year pattern
	var regMonth;
	var regDay =  /\d{1,2}/g;;
	var chrSeperator;
	var arr,str;
	if ((arr = regYear.exec(strDate)) == null)
		return false;
	var intYearlen = arr.lastIndex - arr.index - 1;
	if (arr.index != 0 || (intYearlen != 4 && intYearlen != 2))
		return false;
	str = arr[0];
	chrSeperator = str.charAt(str.length - 1);  // get the seperator ('-' or '/')
	intYear = parseInt(str.substr(0, str.length - 1));	// get the year
	if (intYear < 1900 || intYear > 2099)  //Error Year
		return false;

	strDate = strDate.substr(arr.lastIndex);
	if (chrSeperator == "-")
		regMonth = /\d{1,2}[-]/g;
	else
		regMonth = /\d{1,2}[/]/g;
	if ((arr = regMonth.exec(strDate)) == null)
		return false;
	if (arr.index != 0)
		return false;
	str = arr[0];
	if (str.charAt(0) == '0') {
		intMonth = parseInt(str.substr(1, str.length - 2)); // get the month
	} else {
		intMonth = parseInt(str.substr(0, str.length - 1)); // get the month
	}
	if (intMonth < 1 || intMonth > 12) //Error Month
		return false;

	strDate = strDate.substr(arr.lastIndex);

	if ((arr = regDay.exec(strDate)) == null)
		return false;
	if (arr.index != 0 || arr.lastIndex != strDate.length)
		return false;
	str = arr[0];
	if (str.charAt(0) == '0') {
		intDay = parseInt(str.substr(1, str.length - 1)); // get the day
	} else {
		intDay = parseInt(str); // get the day
	}
	if (intDay < 1 || intDay > 31)  //Error Day
		return false;

	datDate = new Date(intYear, intMonth - 1, intDay); //Test the Date
	if (isNaN(datDate))  //Error Date Format
		return false;
	if (datDate.getMonth() != intMonth - 1 || datDate.getDate() != intDay)  //invalid date such as '1999/02/29' and '1999/04/31'
		return false;
	return datDate;  //Return the Date in parsed format
}

function isTime(strTime){
    if (strTime == null || strTime == "")
        return false;
    var pos = strTime.indexOf(":");
    if (pos == -1)
        return false;
    var h = strTime.substr(0, pos);
    if (h.length > 2 || !isInt(h))
        return false;
    if (h * 1 < 0 || h * 1 >= 24)
        return false;
    var m = strTime.substr(pos + 1);
    if (m.length > 2 || !isInt(m))
        return false;
    if (m < 0 || m >=60)
        return false;

    return true;
}
function isPhone(phone)
{
	if(phone!=""&&phone.length<3)
	{
		alert("电话号码至少为3位!");
		return false;
	}
	hasNumericChar=true;
	for (i = 0; i <  phone.length ; i++)
	{
		if( (phone.charAt(i)<'0' || phone.charAt(i)>'9') && phone.charAt(i)!='-'
		&& phone.charAt(i)!=')'
		&& phone.charAt(i)!='(')
		{
			alert("电话号码只能由数字和'-,(,)'构成!");
			return false;
		}
		if(hasNumericChar&&phone.charAt(i)>'0' && phone.charAt(i)<'9')
	  		hasNumericChar=false;
		if(hasNumericChar&&(i>=phone.length-1))
		{
	 		alert("电话号码只能由数字和'-,(,)'构成!");
	  		return false;
		}
	}
	return true;
}

//////////////////////////////////////
//手机号码检查
function checkMobilePhone(phone)
{
	 if(/^13\d{9}$/g.test(phone)||(/^15[0-35-9]\d{8}$/g.test(phone)) ||  (/^18[05-9]\d{8}$/g.test(phone))){
             return true;
     }else{
            return false;
     }
}

/*
	函数名称：checkString()
	函数功能: 不能包含&、’、”、<、>、:、;等特殊字符;
		合法字符：32（空格）、48~57（数字）、65~90（大写字符）、95（下划线）、97~122（小写字符）、>127（汉字）。
	传入参数：字符串变量
	传出结果：处理后的子串
*/
function checkString(str){
	var isValid = true;
	for (var i = 0; i < str.length; i++){
		if ( (str.charCodeAt(i) == 32) || ((str.charCodeAt(i) >= 48) && (str.charCodeAt(i) <= 57)) || ((str.charCodeAt(i) >= 65) && (str.charCodeAt(i) <= 90)) || (str.charCodeAt(i) == 95) || ((str.charCodeAt(i) >= 97) && (str.charCodeAt(i) <= 122)) || (str.charCodeAt(i) > 127) ) {
			// do nothing
		} else {
			isValid = false;
			break;
		}
	}
	return isValid;
}

function checkLoginid(str){
	if(str.length==0)
	return false;
	var isValid = true;
	for (var i = 0; i < str.length; i++){
		if ( (str.charCodeAt(i) == 32) || ((str.charCodeAt(i) >= 48) && (str.charCodeAt(i) <= 57)) || ((str.charCodeAt(i) >= 65) && (str.charCodeAt(i) <= 90)) || (str.charCodeAt(i) == 95) || ((str.charCodeAt(i) >= 97) && (str.charCodeAt(i) <= 122)) || (str.charCodeAt(i) > 127) ) {
			// do nothing
		} else {
			isValid = false;
			break;
		}
	}
	return isValid;
}

/*
	函数名称：CheckPostCode(str)
	函数功能: 检查邮编的合法性
	传入参数：str——输入字符
	传出结果：true or false
*/
function CheckPostCode(str){
	if (trim(str) == ""){
		return true;
	}
	for (var i=0; i < str.length; i++){
		var ch=str.charAt(i);
		if ((ch != '0') && (ch != '1') && (ch != '2') && (ch != '3') && (ch != '4') && (ch != '5') && (ch != '6') && (ch != '7') && (ch != '8') && (ch != '9'))
			return false;
	}
	return true;
}

	//检查输入框的输入是数字
	function checkNumber(inputElement){
		var str = inputElement.value;
		var inputCode = event.keyCode;
		if(inputCode == 46){
			if(str.indexOf(".")>=0){
				event.returnValue=false;
			}
			return;
		}
		if(!(inputCode>47 && inputCode<58)){
			event.returnValue=false;
		}
	}

	function dateValidate(startDate, endDate){
		var sd = isDate(startDate);
		var ed = isDate(endDate);
		if(sd == false){
			alert("开始日期输入不正确！");
			return false;
		}
		if(ed == false){
			alert("结束日期输入不正确！");
			return false;
		}
		if(sd > ed){
			alert("开始日期不应该大于结束日期，请重新输入！");
			return false;
		}
		return true;
	}
    function changeDivStatus(obj){      
        var val = jQuery("#" + obj).find(".ui-jqgrid-bdiv").css("display");
        if(val == 'none'){
             jQuery("#" + obj).find(".ui-jqgrid-bdiv").css("display", "block");
             jQuery("#" + obj).find(".ui-icon").attr("class", "ui-icon  ui-icon-circle-triangle-n");
        }else{
             jQuery("#" + obj).find(".ui-jqgrid-bdiv").css("display", "none");
             jQuery("#" + obj).find(".ui-icon").attr("class", "ui-icon  ui-icon-circle-triangle-s");
        }
    }