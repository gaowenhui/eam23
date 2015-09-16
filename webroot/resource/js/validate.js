
var validrule = new Object();
validrule.chinese = /^([\u0391-\uFFE5|\s*]+$)?$/;
validrule.english = /^([a-zA-Z|\s*]+)?$/;
validrule.number = /^(\d*)?$/;
validrule.integer = /^([-\+]?\d{1,9})?$/;
validrule.float = /^((([-\+]?\d+)(\.\d+))|(\.\d+)|(\d*))?$/;
validrule.double = /^((([-\+]?\d+)(\.\d+))|(\.\d+)|(\d*))?$/;
validrule.string = /^([^'<>"]+)?$/;
validrule.int = /^(\d{1,9})?$/;
validrule.minusint = /^(\-([1-9])(\d*))?$/;
validrule.date = /^((([1-9]\d{3})|([1-9]\d{1}))-(0[1-9]|1[0-2])-(0[1-9]|[1-2]\d|3[0-1]))?$/;
validrule.time = /^((0[0-9]|1[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9]))?$/;
validrule.datetime = /^((([1-9]\d{3})|([1-9]\d{1}))-(0[1-9]|1[0-2])-(0[1-9]|[1-2]\d|3[0-1]) (0[0-9]|1[0-9]|2[0-4]):([0-5][0-9]):([0-5][0-9]))?$/;
validrule.datehm = /^((([1-9]\d{3})|([1-9]\d{1}))-(0[1-9]|1[0-2])-(0[1-9]|[1-2]\d|3[0-1]) (0[0-9]|1[0-9]|2[0-4]):([0-5][0-9]))?$/;
validrule.year = /^(\d{4})?$/;
validrule.month = /^([1-9]|0[1-9]|1[0-2])?$/;
validrule.day = /^([1-9]|0[1-9]|1[0-9]|2[0-9]|3[0-1])?$/;
validrule.postcode = /^(\d{6})?$/;
validrule.email = /^(.+\@.+\..+)?$/;
validrule.phone = /^(\(\d{3}\))?(\(?(\d{3}|\d{4}|\d{5})\)?(-?)(\d+))?((-?)(\d+))?$/;
validrule.mobiletel = /^(013(\d{9})|13(\d{9}))?$/;
validrule.ip = /^(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-5][0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-5][0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-5][0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-5][0-5]))?$/;
validrule.idcard = /^(\d{15}|\d{18}|\d{17}X|\d{17}x)?$/;
validrule.tabledefine = /^(([A-Za-z])([A-Za-z0-9|_]){1,18})?$/;
validrule.NumAndStr = /^([0-9a-zA-Z]+)?$/;
validrule.LetterStr = /^([a-zA-Z]+)?$/;
validrule.NumStr = /^(\d*)?$/;
function doValidate(vform) {
	var elems = vform.elements;
	var frmLen = elems.length;
	var thePat = "";
	var strFormatInfo = "";
	//对于每一个FROM元素
	for (var i = 0; i < frmLen; i++) {
		var _elem = elems[i];
		//为空检查                
		if (_elem.vmode != null && _elem.vmode == "not null") {
			if (_elem.value.length == 0) {
				alert(_elem.vdisp + "\u4e0d\u80fd\u4e3a\u7a7a!");
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}		 
                //类型检查                  
		if (_elem.vtype == null) {
			continue;
		}
		if (_elem.vtype == "none") {
			thePat = "";
			strFormatInfo = "";
		}
		if (_elem.vtype == "chinese") {
			thePat = validrule.chinese;
			strFormatInfo = "\u4e2d\u6587";
		}
		if (_elem.vtype == "english") {
			thePat = validrule.english;
			strFormatInfo = "\u82f1\u6587\u5b57\u6bcd";
		}
		if (_elem.vtype == "number") {
			thePat = validrule.number;
			strFormatInfo = "\u963f\u62c9\u4f2f\u6570\u5b57";
		}
		if (_elem.vtype == "integer") {
			thePat = validrule.integer;
			strFormatInfo = "\u6574\u6570";
		}
		if (_elem.vtype == "float") {
			thePat = validrule.float;
			strFormatInfo = "\u6d6e\u70b9\u6570";
		}
		if (_elem.vtype == "double") {
			thePat = validrule.double;
			strFormatInfo = "\u5b9e\u6570";
		}
		if (_elem.vtype == "string") {
			thePat = validrule.string;
			strFormatInfo = "\u4e0d\u542b\u7279\u6b8a\u7b26\u5408\u7684\u5b57\u7b26\u4e32";
		}
		if (_elem.vtype == "int") {
			thePat = validrule.int;
			strFormatInfo = "\u6b63\u6574\u6570";
		}
		if (_elem.vtype == "minusint") {
			thePat = validrule.minusint;
			strFormatInfo = "\u8d1f\u6574\u6570\uff0c\u6bd4\u5982-123";
		}
		if (_elem.vtype == "date") {
			thePat = validrule.date;
			strFormatInfo = "\u65e5\u671f\u578b\uff0c\u6bd4\u5982 2004-08-12";
		}
		if (_elem.vtype == "time") {
			thePat = validrule.time;
			strFormatInfo = "\u65f6\u95f4\u578b\uff0c\u6bd4\u598208:37:29";
		}
		if (_elem.vtype == "datehm") {
			thePat = validrule.datehm;
			strFormatInfo = "\u65e5\u671f\u65f6\u5206\u578b\uff0c\u6bd4\u5982 2004-08-12 12:25";
		}
		if (_elem.vtype == "datetime") {
			thePat = validrule.datetime;
			strFormatInfo = "\u65e5\u671f\u65f6\u95f4\u578b\uff0c\u6bd4\u59822004-08-12 08:37:29";
		}
		if (_elem.vtype == "year") {
			thePat = validrule.year;
			strFormatInfo = "\u5e74\u4ee3\u683c\u5f0f\uff0c\u6bd4\u5982 2005";
		}
		if (_elem.vtype == "month") {
			thePat = validrule.month;
			strFormatInfo = "\u6708\u4efd\u683c\u5f0f\uff0c\u6bd4\u5982 08";
		}
		if (_elem.vtype == "day") {
			thePat = validrule.day;
			strFormatInfo = "\u65e5\u5b50\u683c\u5f0f\uff0c\u6bd4\u5982 14";
		}
		if (_elem.vtype == "postcode") {
			thePat = validrule.postcode;
			strFormatInfo = "\u90ae\u7f16\uff0c\u6bd4\u5982 100001";
		}
		if (_elem.vtype == "email") {
			thePat = validrule.email;
			strFormatInfo = "\u7535\u5b50\u90ae\u4ef6\u683c\u5f0f\uff0c\u6bd4\u5982 msm@hotmail.com";
		}
		if (_elem.vtype == "phone") {
			thePat = validrule.phone;
			strFormatInfo = "\u7535\u8bdd\u53f7\u7801\u683c\u5f0f\uff0c\u6bd4\u5982010-67891234";
		}
		if (_elem.vtype == "mobiletel") {
			thePat = validrule.mobiletel;
			strFormatInfo = "\u624b\u673a\u53f7\u7801\u683c\u5f0f\uff0c\u6bd4\u598213867891234";
		}
		if (_elem.vtype == "ip") {
			thePat = validrule.ip;
			strFormatInfo = "\u673a\u5668ip\u5730\u5740\u683c\u5f0f\uff0c\u6bd4\u5982 172.22.169.11";
		}
		if (_elem.vtype == "idcard") {
			thePat = validrule.idcard;
			strFormatInfo = "\u8eab\u4efd\u8bc1\u53f7\u7801\uff0c\u6bd4\u598215\u4f4d\u6216\u800518\u4f4d\u6570\u5b57";
		}
		if (_elem.vtype == "tabledefine") {
			thePat = validrule.tabledefine;
			strFormatInfo = "abc_defgf";
		}
		if (_elem.vtype == "LetterStr") {
			thePat = validrule.LetterStr;
			strFormatInfo = "\u7eaf\u5b57\u6bcd\u5b57\u7b26\u4e32";
		}
		if (_elem.vtype == "NumAndStr") {
			thePat = validrule.NumAndStr;
			strFormatInfo = "\u6570\u5b57\u548c\u5b57\u6bcd\u5b57\u7b26\u4e32";
		}
		if (_elem.vtype == "NumStr") {
			thePat = validrule.NumStr;
			strFormatInfo = "\u7eaf\u6570\u5b57\u7ec4\u6210\u7684\u5b57\u7b26\u4e32";
		}
		var gotIt = null;
		if (thePat != "") {
			gotIt = thePat.exec(_elem.value);
		}
		if (gotIt == null) {
			alert(_elem.vdisp + "\u8f93\u5165\u4e0d\u5408\u6cd5,\u683c\u5f0f\u5e94\u4e3a\uff1a" + strFormatInfo);
			try {
				_elem.focus();
			}
			catch (e) {
			}
			return false;
		}
		if (_elem.voperate == "repeat") {
			if (_elem.value != document.getElementById(_elem.to).value) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.voperate == "rangeint") {
			if (parseInt(_elem.value) > parseInt(_elem.max) || parseInt(_elem.value) < parseInt(_elem.min)) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.voperate == "rangestr") {
			if (_elem.value > _elem.max || _elem.value < _elem.min) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.voperate == "comparestr") {
			if (_elem.value <= document.getElementById(_elem.to).value) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.voperate == "largestr") {
			if (_elem.value <= document.getElementById(_elem.to).value) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.voperate == "largeequalstr") {
			if (_elem.value < document.getElementById(_elem.to).value) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.voperate == "compareint") {
			if (parseInt(_elem.value) <= parseInt(document.getElementById(_elem.to).value)) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.voperate == "largeint") {
			if (parseInt(_elem.value) <= parseInt(document.getElementById(_elem.to).value)) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.voperate == "largeequalint") {
			if (parseInt(_elem.value) < parseInt(document.getElementById(_elem.to).value)) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.voperate == "extend") {
			if ((_elem.value).lastIndexOf(_elem.extendname) <= 0) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.voperate == "custom") {
			if (!RegExp(_elem.regexp, "g").test(_elem.value)) {
				alert(_elem.msg);
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
		if (_elem.vtextarea == "yes") {
			var ivaluelength = _elem.value.length;
			var imaxlength = _elem.maxlength;
			if (ivaluelength >= imaxlength) {
				alert(_elem.vdisp + "\u8f93\u5165\u7684\u503c\u957f\u5ea6\u592a\u957f\u8d85\u8fc7\u4e86" + imaxlength + "\u4e2a\u5b57\u7b26");
				try {
					_elem.focus();
				}
				catch (e) {
				}
				return false;
			}
		}
	}
	return true;
}

