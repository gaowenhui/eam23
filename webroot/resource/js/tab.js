function mouseover(){
	var obj=event.srcElement;
	//if is the clicked tab, color should remain unchanged
	if(this.className!="clicked")
		this.className="mouseover";
}

function mouseout(){
	var obj=event.srcElement;
	if(this.className!="clicked")
		this.className="mouseout";
}

function releaseFunction(){
	var obj=event.srcElement;
	var tr=obj.parentElement;
	var cellIndex=obj.cellIndex;
	var cells=tr.cells;
	for(var i=0;i<cells.length;i++){
		//if is the clicked tab, color should remain unchanged
		if(cellIndex!=i)
		   cells[i].className="mouseout";
	}
	obj.className="clicked";
	
	var tableId=tr.parentElement.parentElement.id;
	//alert(tableId)
	if("upperTable"==tableId)
		displayUpperLayer(cellIndex);
	else
		displayLowerLayer(cellIndex);
}

