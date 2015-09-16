//var $ = function (id) {
//	return "string" == typeof id ? document.getElementById(id) : id;
//};

function addEventHandler(oTarget, sEventType, fnHandler) {
	if (oTarget.addEventListener) {
		oTarget.addEventListener(sEventType, fnHandler, false);
	} else if (oTarget.attachEvent) {
		oTarget.attachEvent("on" + sEventType, fnHandler);
	} else {
		oTarget["on" + sEventType] = fnHandler;
	}
};

function Event(e){
	var oEvent = document.all ? window.event : e;
	if (document.all) {
		if(oEvent.type == "mouseout") {
			oEvent.relatedTarget = oEvent.toElement;
		}else if(oEvent.type == "mouseover") {
			oEvent.relatedTarget = oEvent.fromElement;
		}
		
		oEvent.stopPropagation = function() { this.cancelBubble = true; }
	}
	return oEvent;
}

function Each(list, fun){
	for (var i = 0, len = list.length; i < len; i++) { fun(list[i], i); }
};


var Class = {
  create: function() {
	return function() {
	  this.initialize.apply(this, arguments);
	}
  }
}

Object.extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
	return destination;
}


var CascadeMenu = Class.create();
CascadeMenu.prototype = {
  //初始化对象(容器集合, 菜单结构)
  initialize: function(arrContainer, arrMenu, options) {
	if(arrContainer.length <= 0 || arrMenu.lenght <= 0) return;
	
	var oThis = this;
	
	this._timerContainer = null;//容器定时器
	this._timerMenu = null;//菜单定时器
	this._onmenu = null;//当前菜单对象
	this._index = -1;//要设置容器的索引
	
	this.Container = [];//容器集合
	this._menu = arrMenu;//菜单结构
	
	this.SetOptions(options);
	
	this.Position = this.options.Position || "right";
	this.Delay = parseInt(this.options.Delay) || 0;
	this.Class = this.options.Class || "";
	this.onClass = this.options.onClass || this.Class;
	this.Tag = this.options.Tag;
	
	//设置容器
	Each(arrContainer, function(o, i){ oThis.IniContainer(oThis.Container[i] = (o = $(o)), i > 0); });
	
	this.Ini();
  },
  //设置默认属性
  SetOptions: function(options) {
	this.options = {//默认值
		Position:	"right",//默认位置(up,down,left,right)
		Tag:		"div",//默认生成标签
		Class:		"",//默认样式
		onClass:	"",//焦点样式
		Delay:		0//延迟值(微秒)
	};
	Object.extend(this.options, options || {});
  },
  //初始化容器(容器集合, 是否子菜单容器)
  IniContainer: function(container, bChild) {
	var oThis = this;
	addEventHandler(container, "mouseover", function(){ clearTimeout(oThis._timerContainer); });
	addEventHandler(container, "mouseout", function(e){
		//是否在菜单之内
		var isIn = false, oT = Event(e).relatedTarget;
		Each(oThis.Container, function(o, i){ if(o.contains ? o.contains(oT) || o == oT : o.compareDocumentPosition(oT) & 16){ isIn = true; } });
		//在菜单外隐藏
		if(!isIn){
			clearTimeout(oThis._timerContainer); clearTimeout(oThis._timerMenu);
			oThis._timerContainer = setTimeout(function(){ oThis.Hide(); }, oThis.Delay);
		}
	});
	//重置索引
	container.index = -1;
	//子菜单容器设置
	if (bChild) { container.style.position = "absolute"; container.style.visibility = "hidden"; }
  },
  //初始化第一个容器
  Ini: function() {
	this.Container[0].innerHTML = ""; this._index = 0; this.SetMenu(this._menu);
  },
  //全局设置
  Set: function() {
	//隐藏select
	Each(document.getElementsByTagName("select"), function(o){ o.style.visibility = "hidden"; })
	
	var menu = this._menu;
	//第一个不需要处理所以从1开始
	var i = 1;
	while (menu.length > 0) {
		//获取子菜单结构和定位
		var iC = this.Container[i-1].index, position = this.Position;
		if(iC >= 0){
			//这里要先取position再设menu
			position = menu[iC].position || this.Position; menu = menu[iC].menu || [];
		} else { menu = []; }
		
		//如果容器不够就根据前一个自动添加
		if(!this.Container[i]){
			var oPre = this.Container[i-1], oNew = document.body.appendChild(document.createElement(oPre.tagName));
			oNew.style.cssText = oPre.style.cssText; oNew.className = oPre.className;
			this.IniContainer(this.Container[i] = oNew, true);
		}
		
		//设置下一级菜单
		if(this._index == i++){ this.SetContainer(menu, position); break; }
	}
  },
  //容器设置(菜单结构, 位置)
  SetContainer: function(menu, position) {
	var oContainer = this.Container[this._index];
	
	//设置容器
	oContainer.innerHTML = ""; oContainer.index = -1; oContainer.style.visibility = "hidden";
	
	if(menu.length > 0){
		//设置菜单
		this.SetMenu(menu);
		
		//容器定位
		//offset取值会有偏差，要注意
		var o = this._onmenu, iLeft = o.offsetLeft, iTop = o.offsetTop;
		//注意如果display为none的话取不到offset值，所以要用visibility
		switch (position.toLowerCase()) {
			case "up" :
				iTop -= oContainer.offsetHeight;
				break;
			case "down" :
				iTop += o.offsetHeight;
				break;
			case "left" :
				iLeft -= oContainer.offsetWidth;
				break;
			case "right" :
			default :
				iLeft += o.offsetWidth;
		}
		while (o.offsetParent) { o = o.offsetParent; iLeft += o.offsetLeft; iTop += o.offsetTop; }
		oContainer.style.left = iLeft + "px"; oContainer.style.top = iTop + "px";
		oContainer.style.visibility = "visible";
	}
	
	//隐藏不需要的容器
	for(var i = this._index + 1, len = this.Container.length; i < len; i++){ this.Container[i].style.visibility = "hidden";  }
  },
  //菜单设置(菜单结构)
  SetMenu: function(menu) {
	var oThis = this, index = this._index, oContainer = this.Container[index];
	Each(menu, function(o, i){
		var oMenu = document.createElement(oThis.Tag);
		oMenu.innerHTML = o.txt;
		oMenu.onmouseover = function(){
			clearTimeout(oThis._timerMenu);
			
			//重新设置菜单
			oThis._timerMenu = setTimeout(function(){
				oContainer.index = i; oThis._onmenu = oMenu; oThis._index = index + 1;  oThis.Set();
			}, oThis.Delay);
			
			//重新设置样式
			//为解决设置延时后样式的问题每次都全部重新设置
			Each(oThis.Container, function(o, i){
				if(i > index) return;
				Each(o.getElementsByTagName(oThis.Tag), function(o){ o.className = oThis.Class; });
				if(i == index){
					oMenu.className = oThis.onClass;
				} else if(o.index >= 0) {
					o.getElementsByTagName(oThis.Tag)[o.index].className = oThis.onClass;
				} else return;
			});
		}
		oContainer.appendChild(oMenu);
	});	
  },
  //隐藏菜单
  Hide: function() {
	var oThis = this;
	//除第一个外隐藏
	Each(this.Container, function(o, i){
		if(i == 0){
			Each(o.getElementsByTagName(oThis.Tag), function(o, i){ o.className = oThis.Class; })
		} else { o.style.visibility = "hidden"; }
		o.index = -1;
	});
	
	//显示select
	Each(document.getElementsByTagName("select"), function(o){ o.style.visibility = "visible"; })
  },
  //添加菜单(一个菜单结构)
  Add: function(arrMenu) {
	this._menu.push(arrMenu); this.Ini();
  },
  //删除菜单
  Delete: function(index) {
	if(index < 0 || index >= this._menu.length) return;
	for(var i = index, len = this._menu.length - 1; i < len; i++){ this._menu[i] = this._menu[i + 1]; }
		this._menu.pop(); this.Ini();
  }
};