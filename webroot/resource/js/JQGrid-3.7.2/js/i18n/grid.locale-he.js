(function(a){a.jgrid={defaults:{recordtext:"××¦×× {0} - {1} ××ª×× {2}",emptyrecords:"××× ×¨×©××××ª ×××¦××",loadtext:"×××¢×...",pgtext:"××£ {0} ××ª×× {1}"},search:{caption:"×××¤×©...",Find:"××¤×©",Reset:"××ª××",odata:["×©×××","×× ×©×××","×§××","×§×× ×× ×©×××","××××","×××× ×× ×©×××","××ª××× ×","×× ××ª××× ×","× ××¦× ×","×× × ××¦× ×","××¡×ª××× ×","×× ××¡×ª××× ×","××××","×× ××××"],groupOps:[{op:"AND",text:"×××"},{op:"OR",text:"××× ×"}],matchText:" ×ª×××",rulesText:" ×××§××"},edit:{addCaption:"×××¡×£ ×¨×©×××",editCaption:"×¢×¨×× ×¨×©×××",bSubmit:"×©××",bCancel:"×××",bClose:"×¡×××¨",saveData:"× ×ª×× ×× ××©×ª× ×! ××©×××¨?",bYes:"××",bNo:"××",bExit:"×××",msg:{required:"×©×× ××××",number:"×× ×, ××× ×¡ ××¡×¤×¨ ×ª×§××",minValue:"×¢×¨× ×¦×¨×× ×××××ª ×××× ×× ×©××× × ",maxValue:"×¢×¨× ×¦×¨×× ×××××ª ×§×× ×× ×©××× × ",email:"××× ×× ××ª×××ª ××××× ×ª×§×× ×",integer:"×× ×, ××× ×¡ ××¡×¤×¨ ×©××",date:"×× ×, ××× ×¡ ×ª××¨×× ×ª×§××",url:"×××ª×××ª ××× × ×ª×§×× ×. ××¨××©× ×ª×××××ª ('http://' ×× 'https://')",nodefined:" is not defined!",novalue:" return value is required!",customarray:"Custom function should return array!",customfcheck:"Custom function should be present in case of custom checking!"}},view:{caption:"××¦× ×¨×©×××",bClose:"×¡×××¨"},del:{caption:"×××§",msg:"××× ×××××§ ××ª ××¨×©×××/××ª ×××¡××× ××ª?",bSubmit:"×××§",bCancel:"×××"},nav:{edittext:"",edittitle:"×¢×¨×× ×©××¨× ××¡××× ×ª",addtext:"",addtitle:"×××¡×£ ×©××¨× ×××©×",deltext:"",deltitle:"×××§ ×©××¨× ××¡××× ×ª",searchtext:"",searchtitle:"××¤×© ×¨×©××××ª",refreshtext:"",refreshtitle:"××¢× ××¨×× ××××©",alertcap:"××××¨×",alerttext:"×× ×, ×××¨ ×©××¨×",viewtext:"",viewtitle:"××¦× ×©××¨× ××¡××× ×ª"},col:{caption:"××¦×/××¡×ª×¨ ×¢×××××ª",bSubmit:"×©××",bCancel:"×××"},errors:{errcap:"×©××××",nourl:"×× ×××××¨× ××ª×××ª url",norecords:"××× ×¨×©××××ª ××¢××",model:"×××¨× ×©× colNames <> colModel!"},formatter:{integer:{thousandsSeparator:" ",defaultValue:"0"},number:{decimalSeparator:".",thousandsSeparator:" ",decimalPlaces:2,defaultValue:"0.00"},currency:{decimalSeparator:".",thousandsSeparator:" ",decimalPlaces:2,prefix:"",suffix:"",defaultValue:"0.00"},date:{dayNames:["×","×","×","×","×","×","×©","×¨××©××","×©× ×","×©×××©×","×¨×××¢×","××××©×","×©××©×","×©××ª"],monthNames:["×× ×","×¤××¨","××¨×¥","××¤×¨","×××","××× ","×××","×××","×¡×¤×","×××§","× ××","××¦×","×× ×××¨","×¤××¨×××¨","××¨×¥","××¤×¨××","×××","××× ×","××××","×××××¡×","×¡×¤××××¨","×××§××××¨","× ×××××¨","××¦×××¨"],AmPm:["××¤× × ××¦××¨××","×××¨ ××¦××¨××","××¤× × ××¦××¨××","×××¨ ××¦××¨××"],S:function(b){return b<11||b>13?["","","",""][Math.min((b-1)%10,3)]:""},srcformat:"Y-m-d",newformat:"d/m/Y",masks:{ISO8601Long:"Y-m-d H:i:s",ISO8601Short:"Y-m-d",ShortDate:"n/j/Y",LongDate:"l, F d, Y",FullDateTime:"l, F d, Y g:i:s A",MonthDay:"F d",ShortTime:"g:i A",LongTime:"g:i:s A",SortableDateTime:"Y-m-d\\TH:i:s",UniversalSortableDateTime:"Y-m-d H:i:sO",YearMonth:"F, Y"},reformatAfterEdit:false},baseLinkUrl:"",showAction:"",target:"",checkbox:{disabled:true},idName:"id"}}})(jQuery);