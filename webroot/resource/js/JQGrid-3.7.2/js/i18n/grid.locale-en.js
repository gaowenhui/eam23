(function(a) {
	a.jgrid = {
		defaults : {
			recordtext : "{0} - {1}\u3000¹² {2} Ìõ",
			emptyrecords : "ÎÞÊý¾ÝÏÔÊ¾",
			loadtext : "¶ÁÈ¡ÖÐ...",
			pgtext : " {0} ¹² {1} Ò³"
		},
		search : {
			caption : "ËÑË÷...",
			Find : "²éÕÒ",
			Reset : "ÖØÖÃ",
			odata : [ "µÈÓÚ\u3000\u3000", "²»µÈ\u3000\u3000", "Ð¡ÓÚ\u3000\u3000",
					"Ð¡ÓÚµÈÓÚ", "´óÓÚ\u3000\u3000", "´óÓÚµÈÓÚ", "¿ªÊ¼ÓÚ", "²»¿ªÊ¼ÓÚ",
					"ÊôÓÚ\u3000\u3000", "²»ÊôÓÚ", "½áÊøÓÚ", "²»½áÊøÓÚ", "°üº¬\u3000\u3000",
					"²»°üº¬" ],
			groupOps : [ {
				op : "AND",
				text : "ËùÓÐ"
			}, {
				op : "OR",
				text : "ÈÎÒ»"
			} ],
			matchText : " Æ¥Åä",
			rulesText : " ¹æÔò"
		},
		edit : {
			addCaption : "Ìí¼Ó¼ÇÂ¼",
			editCaption : "±à¼­¼ÇÂ¼",
			bSubmit : "Ìá½»",
			bCancel : "È¡Ïû",
			bClose : "¹Ø±Õ",
			saveData : "Êý¾ÝÒÑ¸Ä±ä£¬ÊÇ·ñ±£´æ£¿",
			bYes : "ÊÇ",
			bNo : "·ñ",
			bExit : "È¡Ïû",
			msg : {
				required : "´Ë×Ö¶Î±ØÐè",
				number : "ÇëÊäÈëÓÐÐ§Êý×Ö",
				minValue : "ÊäÖµ±ØÐë´óÓÚµÈÓÚ ",
				maxValue : "ÊäÖµ±ØÐëÐ¡ÓÚµÈÓÚ ",
				email : "Õâ²»ÊÇÓÐÐ§µÄe-mailµØÖ·",
				integer : "ÇëÊäÈëÓÐÐ§ÕûÊý",
				date : "ÇëÊäÈëÓÐÐ§Ê±¼ä",
				url : "ÎÞÐ§ÍøÖ·¡£Ç°×º±ØÐëÎª ('http://' »ò 'https://')",
				nodefined : " Î´¶¨Òå£¡",
				novalue : " ÐèÒª·µ»ØÖµ£¡",
				customarray : "×Ô¶¨Òåº¯ÊýÐèÒª·µ»ØÊý×é£¡",
				customfcheck : "Custom function should be present in case of custom checking!"
			}
		},
		view : {
			caption : "²é¿´¼ÇÂ¼",
			bClose : "¹Ø±Õ"
		},
		del : {
			caption : "É¾³ý",
			msg : "É¾³ýËùÑ¡¼ÇÂ¼£¿",
			bSubmit : "É¾³ý",
			bCancel : "È¡Ïû"
		},
		nav : {
			edittext : "",
			edittitle : "±à¼­ËùÑ¡¼ÇÂ¼",
			addtext : "",
			addtitle : "Ìí¼ÓÐÂ¼ÇÂ¼",
			deltext : "",
			deltitle : "É¾³ýËùÑ¡¼ÇÂ¼",
			searchtext : "",
			searchtitle : "²éÕÒ",
			refreshtext : "",
			refreshtitle : "Ë¢ÐÂ±í¸ñ",
			alertcap : "×¢Òâ",
			alerttext : "ÇëÑ¡Ôñ¼ÇÂ¼",
			viewtext : "",
			viewtitle : "²é¿´ËùÑ¡¼ÇÂ¼"
		},
		col : {
			caption : "Ñ¡ÔñÁÐ",
			bSubmit : "È·¶¨",
			bCancel : "È¡Ïû"
		},
		errors : {
			errcap : "´íÎó",
			nourl : "Ã»ÓÐÉèÖÃurl",
			norecords : "Ã»ÓÐÒª´¦ÀíµÄ¼ÇÂ¼",
			model : "colNames ºÍ colModel ³¤¶È²»µÈ£¡"
		},
		formatter : {
			integer : {
				thousandsSeparator : " ",
				defaultValue : "0"
			},
			number : {
				decimalSeparator : ".",
				thousandsSeparator : " ",
				decimalPlaces : 2,
				defaultValue : "0.00"
			},
			currency : {
				decimalSeparator : ".",
				thousandsSeparator : " ",
				decimalPlaces : 2,
				prefix : "",
				suffix : "",
				defaultValue : "0.00"
			},
			date : {
				dayNames : [ "Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat",
						"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
						"Friday", "Saturday" ],
				monthNames : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
						"Aug", "Sep", "Oct", "Nov", "Dec", "January",
						"February", "March", "April", "May", "June", "July",
						"August", "September", "October", "November",
						"December" ],
				AmPm : [ "am", "pm", "AM", "PM" ],
				S : function(b) {
					return b < 11 || b > 13 ? [ "st", "nd", "rd", "th" ][Math
							.min((b - 1) % 10, 3)] : "th"
				},
				srcformat : "Y-m-d",
				newformat : "m-d-Y",
				masks : {
					ISO8601Long : "Y-m-d H:i:s",
					ISO8601Short : "Y-m-d",
					ShortDate : "Y/j/n",
					LongDate : "l, F d, Y",
					FullDateTime : "l, F d, Y g:i:s A",
					MonthDay : "F d",
					ShortTime : "g:i A",
					LongTime : "g:i:s A",
					SortableDateTime : "Y-m-d\\TH:i:s",
					UniversalSortableDateTime : "Y-m-d H:i:sO",
					YearMonth : "F, Y"
				},
				reformatAfterEdit : false
			},
			baseLinkUrl : "",
			showAction : "",
			target : "",
			checkbox : {
				disabled : true
			},
			idName : "id"
		}
	}
})(jQuery);