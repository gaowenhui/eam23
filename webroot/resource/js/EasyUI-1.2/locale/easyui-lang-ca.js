if ($.fn.pagination){
	$.fn.pagination.defaults.beforePageText = 'PÃ gina';
	$.fn.pagination.defaults.afterPageText = 'de {pages}';
	$.fn.pagination.defaults.displayMsg = "Veient {from} a {to} de {total} d'articles";
}
if ($.fn.datagrid){
	$.fn.datagrid.defaults.loadMsg = 'ElaboraciÃ³, si us plau esperi ...';
}
if ($.messager){
	$.messager.defaults.ok = 'Ok';
	$.messager.defaults.cancel = 'Cancel';
}
if ($.fn.validatebox){
	$.fn.validatebox.defaults.missingMessage = 'Aquest camp Ã©s obligatori.';
	$.fn.validatebox.defaults.rules.email.message = 'IntroduÃ¯u una adreÃ§a de correu electrÃ²nic vÃ lida.';
	$.fn.validatebox.defaults.rules.url.message = 'Si us plau, introduÃ¯u un URL vÃ lida.';
	$.fn.validatebox.defaults.rules.length.message = 'Si us plau, introduÃ¯u un valor entre {0} i {1}.';
}
if ($.fn.numberbox){
	$.fn.numberbox.defaults.missingMessage = 'Aquest camp Ã©s obligatori.';
}
if ($.fn.combobox){
	$.fn.combobox.defaults.missingMessage = 'Aquest camp Ã©s obligatori.';
}
if ($.fn.combotree){
	$.fn.combotree.defaults.missingMessage = 'Aquest camp Ã©s obligatori.';
}
if ($.fn.calendar){
	$.fn.calendar.defaults.weeks = ['S','M','T','W','T','F','S'];
	$.fn.calendar.defaults.months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
}
if ($.fn.datebox){
	$.fn.datebox.defaults.currentText = 'Avui';
	$.fn.datebox.defaults.closeText = 'Tancar';
	$.fn.datebox.defaults.missingMessage = 'Aquest camp Ã©s obligatori.';
}
