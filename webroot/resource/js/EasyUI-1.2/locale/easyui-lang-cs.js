if ($.fn.pagination){
	$.fn.pagination.defaults.beforePageText = 'Strana';
	$.fn.pagination.defaults.afterPageText = 'z {pages}';
	$.fn.pagination.defaults.displayMsg = 'Zobrazuji {from} do {to} z {celkovÃ©} poloÅ¾ky';
}
if ($.fn.datagrid){
	$.fn.datagrid.defaults.loadMsg = 'ZpracovÃ¡nÃ­, Äekejte prosÃ­m ...';
}
if ($.messager){
	$.messager.defaults.ok = 'Ok';
	$.messager.defaults.cancel = 'ZruÅ¡it';
}
if ($.fn.validatebox){
	$.fn.validatebox.defaults.missingMessage = 'Toto pole je vyÅ¾adovÃ¡no.';
	$.fn.validatebox.defaults.rules.email.message = 'Zadejte prosÃ­m platnou e-mailovou adresu.';
	$.fn.validatebox.defaults.rules.url.message = 'Zadejte prosÃ­m platnou adresu URL.';
	$.fn.validatebox.defaults.rules.length.message = 'ProsÃ­m, zadejte hodnotu mezi {0} a {1}.';
}
if ($.fn.numberbox){
	$.fn.numberbox.defaults.missingMessage = 'Toto pole je vyÅ¾adovÃ¡no.';
}
if ($.fn.combobox){
	$.fn.combobox.defaults.missingMessage = 'Toto pole je vyÅ¾adovÃ¡no.';
}
if ($.fn.combotree){
	$.fn.combotree.defaults.missingMessage = 'Toto pole je vyÅ¾adovÃ¡no.';
}
if ($.fn.calendar){
	$.fn.calendar.defaults.weeks = ['S','M','T','W','T','F','S'];
	$.fn.calendar.defaults.months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
}
if ($.fn.datebox){
	$.fn.datebox.defaults.currentText = 'Dnes';
	$.fn.datebox.defaults.closeText = 'ZavÅÃ­t';
	$.fn.datebox.defaults.missingMessage = 'Toto pole je vyÅ¾adovÃ¡no.';
}
