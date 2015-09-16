/*
form._tablename 表名
form._resulturl 返回结果URL
form._queryandor 查询条件的连接符 
form.field.fieldType String字段类型 Char Number 
form.field.fieldkey boolean是否是关键字 true false 
form.field.queryOperator 查询运算符 = > < >= <= like
*/

function DBForm(dbfrmobj,action)
{
	this._dbfrmobj   = dbfrmobj;
	this._dbfrmname  = "";
	this._action     = action;
	this._posturl    = "";
	this._resulturl  = "";
	this._sql        = "";
	this._tablename  = "";
	this._urlparam   = "";
	this._queryandor = "and";
	this._fieldkeyvalue = "";
}
DBForm.prototype.submit = function()
{
	if(!this.init()) return false;
	if(!this.makeSQL()) return false;
	this._resulturl += this._urlparam;
	this._dbfrmobj._resulturl.value = this._resulturl;
	this._dbfrmobj._sql.value = this._sql;	
	this._dbfrmobj.submit();
}
DBForm.prototype.submit_type=function(){
	if(!this.init()){
		return false;
	}
	//检查_dbfrmobj._paratypes
	if(typeof(this._dbfrmobj._paratypes) == "undefined"){
		var para = document.createElement("input");
		para.type = "hidden";
		para.id = "_paratypes";
		para.name = "_paratypes";
		this._dbfrmobj.appendChild(para);
	}
	this._dbfrmobj._paratypes.value = this.getParaTypes();
	this._dbfrmobj.submit();
}
DBForm.prototype.setFormValue = function()
{
	if(!this.init()) return false;
	if(!this.makeSQL()) return false;
	this._resulturl += this._urlparam;
	this._dbfrmobj._resulturl.value = this._resulturl;
	this._dbfrmobj._sql.value = this._sql;
}
DBForm.prototype.toString = function()
{
	var str ="";
	str= "_dbfrmname = " + this._dbfrmname 
	     +"_action = "+  this._action 
	     +"_posturl = "+ this._posturl
	     +"_resulturl = "+ this._resulturl
	     +"_sql = "+ this._sql
	     +"_tablename = "+ this._tablename;
	return str;
}
DBForm.prototype.init = function()
{
	//检查DBFrom对象
	if(typeof(this._dbfrmobj) == "undefined" || this._dbfrmobj == null) return false;
	this._dbfrmobj.method = "POST";
	this._dbfrmname = this._dbfrmobj.name;
	//检查当前操作类型 INSERT UPDATE DELETE
	if(typeof(this._action) == "undefined" || this._action == null || this._action =="" ) return false;
	this._action = this._action.toLowerCase();
	//提交结果URL
	this._posturl = this._dbfrmobj.action;
	//检查表名
	if(typeof(this._dbfrmobj._tablename) == "undefined" || this._dbfrmobj._tablename.value == null)
	{
		alert(this._dbfrmname + " 中 _tablename 不存在或没有值！");
		return false;
	}
	this._tablename = this._dbfrmobj._tablename.value;
	//获取当前主键的值
	if(this._dbfrmobj._fieldkeyvalue)
	{
		this._fieldkeyvalue = this._dbfrmobj._fieldkeyvalue.value;
	}

	//检查返回的URL _dbfrmobj._resulturl
	if(typeof(this._dbfrmobj._resulturl) == "undefined" )
	{
		var oResultUrl = document.createElement("input");
		oResultUrl.type = "hidden";
		oResultUrl.id = "_resulturl";
		oResultUrl.name = "_resulturl";
		this._dbfrmobj.appendChild(oResultUrl);
	}
	if(typeof(this._dbfrmobj._targettype) == "undefined" )
	{
		var oTargetUrl = document.createElement("input");
		oTargetUrl.type = "hidden";
		oTargetUrl.id = "_targettype";
		oTargetUrl.name = "_targettype";
		oTargetUrl.value = "self";
		this._dbfrmobj.appendChild(oTargetUrl);
	}
	
	if(this._dbfrmobj._resulturl.value == null || this._dbfrmobj._resulturl.value == "")
	{
		this._dbfrmobj._resulturl.value = document.location.pathname + "?";
		this._resulturl = this._dbfrmobj._resulturl.value ;
	}
	else
	{
	     if(this._dbfrmobj._resulturl.noparameter != null)
	     {
	         this._resulturl = this._dbfrmobj._resulturl.value;
	     }
	     else
	     {
	        if(this._dbfrmobj._resulturl.value.indexOf("?")!=-1)
	        {
	           this._resulturl = this._dbfrmobj._resulturl.value +"&";
	        }
	        else
	        {
	           this._resulturl = this._dbfrmobj._resulturl.value +"?";
	        }
	      }
	}
	
	
	
	//检查_dbfrmobj._sql
	if(typeof(this._dbfrmobj._sql) == "undefined")
	{
		var oSql = document.createElement("input");
		oSql.type = "hidden";
		oSql.id = "_sql";
		oSql.name = "_sql";
		this._dbfrmobj.appendChild(oSql);
	}
	this._dbfrmobj._sql.value = "";
	if(typeof(this._dbfrmobj._queryandor) != "undefined" && this._dbfrmobj._queryandor.value != null && this._dbfrmobj._queryandor.value != "")
	{
		this._queryandor = this._dbfrmobj._queryandor.value;
	}
	return true;
}

DBForm.prototype.makeSQL = function()
{
	var sFields="";
	var sValues="";
	var sWhere = "";
	var sUrlParam="";
	for(var i=0;i<this._dbfrmobj.length;i++)
	{
		var currobj = this._dbfrmobj[i];
		var sfieldName = currobj.name;
		var sFieldValue = "";
		var sFieldValueOrg = "";
		if(sfieldName == null || sfieldName == "")
		{
			sfieldName = currobj.id;
		}
		if(sfieldName == null || sfieldName == "" || sfieldName.charAt(0) == '_' ) continue;//忽略系统变量
		if(typeof(currobj.noform) != "undefined" )continue;//忽略非提交域变量		
		//获取值
		if(currobj.type == "radio")
		{
			if(currobj.checked==false) continue;
			sFieldValue =currobj.value;
		} 	
                else 
                {
                        if(currobj.type == "checkbox")
		        {
			        if(currobj.checked)
			        {
				      sFieldValue = currobj.value;
			        }
			        else
			        {
				      sFieldValue = "0"; 
			        }
		        }
                        else
		        {
			        sFieldValue = currobj.value;
		        }
		}
                if(sFieldValue == null ) 
                {
                        sFieldValue = "";              
                }
		sFieldValueOrg = sFieldValue;
		//若为查询操作则忽略没有值的条件
		if(sFieldValue == "" && this._action == "select") continue;
		//处理值
		var sIsKey = false;
		if(typeof(currobj.fieldkey) != "undefined" )
		{
			sIsKey = true;
		}


                var sfieldType = currobj.vtype;
		 
	
		switch(sfieldType)
		{
			case "int":
			case "minusint":
			case "integer":
			case "float":
			case "number":
			
				if(sFieldValue.length <=0)
				{ 
				   sFieldValue = "0";
				}				 
				break;
			default:			        
				sFieldValue = sFieldValue.replace("'", "''");
				sFieldValue = "'" + sFieldValue +"'";
				if(sIsKey && this._fieldkeyvalue.length>0)
				{
					this._fieldkeyvalue = this._fieldkeyvalue.replace("'", "''");
					this._fieldkeyvalue = "'" + this._fieldkeyvalue +"'";

				}
				break;
		}



		//SQL
		switch(this._action)
		{
		case "insert"://insert
			if(sFields == "")
			{
				sFields = sfieldName;
				sValues = sFieldValue;
			}
			else
			{
				sFields += ","+sfieldName;
				sValues += ","+sFieldValue;
			}
			break;
		case "update"://update
			if(!sIsKey || this._fieldkeyvalue.length>0)
			{
				if(sFields == "" )
				{
					sFields = sfieldName +"="+sFieldValue;
				}
				else
				{
					sFields += ","+sfieldName +"="+sFieldValue;
				}
			}
			break;
		case "delete":
			break;
		case "select":
			{
				var sQueryOperator = "=";
				if(typeof(currobj.queryoperator) != "undefined" && currobj.queryoperator != null && currobj.queryoperator != "")
				{
					sQueryOperator = currobj.queryoperator;
					sQueryOperator = sQueryOperator.toUpperCase();
				}
				if(sQueryOperator == "LIKE")
				{
					sFieldValue = "'%"+sFieldValueOrg +"%'";
				}
				if(sWhere == "")
				{
					sWhere = sfieldName +sQueryOperator+sFieldValue;
				}else
				{

					sWhere += " "+this._queryandor+" "+sfieldName +" "+sQueryOperator+" "+sFieldValue;

				}
			}
			break;
		}

		if(sIsKey)
		{
			if(this._fieldkeyvalue.length >0)
				sFieldValue = this._fieldkeyvalue;
			if(sWhere == "")
			{
				sWhere = sfieldName +"="+sFieldValue;
				sUrlParam = sfieldName +"="+sFieldValue;
			}else
			{
				sWhere += " and "+sfieldName +"="+sFieldValue;
				sUrlParam += "&"+sfieldName +"="+sFieldValue;
			}
		}
	}

	//生成SQL
	var sql = "";
	switch(this._action)
	{
	case "insert"://insert
		sql="insert into "+this._tablename+"("+sFields+") values("+sValues+")";			
		break;
	case "update"://update
		sql="update "+this._tablename+" set "+sFields+" where "+sWhere;
		break;
	case "delete"://delete
		sql="delete from "+this._tablename+" where "+sWhere;
		break;
	case "select":
		if(sWhere.length>0)
		{
			sql = "select * from "+this._tablename+" where "+sWhere;
		}else
		{
			sql = "select * from "+this._tablename;
		}
	    break;
	}
	if(this._action != "select" && this._action != "delete")
	{
		var sSelectSql = "select * from "+ this._tablename+ " where "+sWhere;
		sUrlParam += "&_sql="+sSelectSql;
		this._urlparam = sUrlParam;
	}
	if(this._action == "delete")
	{
		this._urlparam = "";	
		//if(this._resulturl.indexOf("_sql=")<0)
		//var sSelectSql = "select * from "+ this._tablename;
		//sUrlParam += "&_sql="+sSelectSql;
		//this._urlparam = sUrlParam;
	}
	if(this._action == "insert")
	{
		if(this._dbfrmobj._resulturl.noparameter != null)
		{ 
		   this._urlparam = "";		
		}
	}
	if(this._action == "update")
	{
		if(this._dbfrmobj._resulturl.noparameter != null)
		{ 
		   this._urlparam = "";		
		}
	}
	
	this._sql = sql;
	return true;
}
DBForm.prototype.getParaTypes = function(){
	var result="";
	for(var i=0;i<this._dbfrmobj.length;i++){
		var currobj = this._dbfrmobj[i];
		var sfieldName = currobj.name;
		if(sfieldName == null || sfieldName == ""){
			sfieldName = currobj.id;
		}
		if(sfieldName == null || sfieldName == "" || sfieldName.charAt(0) == '_' ) continue;//忽略系统变量
		if(typeof(currobj.noform) != "undefined" )continue;//忽略非提交域变量		

		var sfieldType = currobj.vtype;
		switch(sfieldType){
			case "int":
			case "minusint":
			case "integer":
			case "float":
			case "number":
				result+=sfieldName+":num&";
				break;
			default:
				result+=sfieldName+":string&";
				break;
		}
	}
	return result;
}