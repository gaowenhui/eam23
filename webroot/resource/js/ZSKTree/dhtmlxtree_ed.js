dhtmlXTreeObject.prototype.enableItemEditor=function(mode){this.ale=ap(mode);if(!this.ZP){this.iJ=true;this.HY=true;this.aos=this.asf;this.XG=this.aco;this.mY(function(a,b){if(this.HY)this.KB(a,b);return true;});this.ck(function(a,b){this.TT(a,b);if((this.Uh==a)&&(this.iJ))this.KB(a,b);this.Uh=a;return true;});this.ZP=true;}};dhtmlXTreeObject.prototype.Nh=function(aQ){this.attachEvent("onEdit",aQ);};dhtmlXTreeObject.prototype.JM=function(afV,dblclick){this.iJ=ap(afV);this.HY=ap(dblclick);};dhtmlXTreeObject.prototype.zo=function(a){if(this.gp){this.ko=this.Wo;if(this.gp.id!=a){var mu=true;mu=this.callEvent("onEdit",[2,this.gp.id,this,this.gp.span.childNodes[0].value]);if(mu===true)mu=this.gp.span.childNodes[0].value;else if(mu===false)mu=this.gp.Tp;var changed=(mu!=this.gp.Tp);this.gp.span.innerHTML=mu;this.gp.label=this.gp.span.innerHTML;var arA=this.gp.tA?"selectedTreeRow":"standartTreeRow";this.gp.span.className=arA;this.gp.span.parentNode.className="standartTreeRow";this.gp.span.style.paddingRight=this.gp.span.style.paddingLeft='5px';this.gp.span.onclick=this.gp.span.ondblclick=function(){};var id=this.gp.id;if(this.fo)this.fH(this.gp);this.gp=null;this.callEvent("onEdit",[3,id,this,changed]);if(this.Tf){this.parentObject.lastChild.focus();this.parentObject.lastChild.focus();}}}};dhtmlXTreeObject.prototype.TT=function(id,tree){this.zo(id);};dhtmlXTreeObject.prototype.xS=function(){if(this.gp)this.zo(this.gp.id+"_non");};dhtmlXTreeObject.prototype.WH=function(id){this.KB(id,this);};dhtmlXTreeObject.prototype.KB=function(id,tree){if(this.ale){this.zo();var temp=this.ak(id);if(!temp)return;mu=this.callEvent("onEdit",[0,id,this,temp.span.innerHTML]);if(mu===true)mu=(temp.span.innerText||temp.span.textContent);else if(mu===false)return;this.Wo=this.ko;this.ko=false;this.gp=temp;temp.Tp=mu;temp.span.innerHTML="<input type='text' class='intreeeditRow' />";temp.span.style.paddingRight=temp.span.style.paddingLeft='0px';temp.span.onclick=temp.span.ondblclick=function(e){(e||event).cancelBubble=true;};temp.span.childNodes[0].value=mu;temp.span.childNodes[0].onselectstart=function(e){(e||event).cancelBubble=true;return true;};temp.span.childNodes[0].onmousedown=function(e){(e||event).cancelBubble=true;return true;};temp.span.childNodes[0].focus();temp.span.childNodes[0].focus();temp.span.onclick=function(e){(e||event).cancelBubble=true;return false;};temp.span.className="";temp.span.parentNode.className="";var self=this;temp.span.childNodes[0].onkeydown=function(e){if(!e)e=window.event;if(e.keyCode==13){e.cancelBubble=true;self.zo(window.undefined);}else if(e.keyCode==27){self.gp.span.childNodes[0].value=self.gp.Tp;self.zo(window.undefined);};(e||event).cancelBubble=true;};this.callEvent("onEdit",[1,id,this]);}};