function Node(id, pid, name, userScript, title, isopen, img)
{
    this.id         = id;
    this.pid        = pid;
    this.name       = name;
    this.userScript        = userScript;
    this.title      = title;
    this.img        = img;

    this._io        = isopen || false;
    this._ls        = false;
    this._hc        = false;
    this._is        = false;


}

function dTree(objName,needPage)
{


    this.arrNodes       = [];
    this.arrRecursed    = [];
    this.arrIcons       = [];
    this.rootNode       = -1;
    this.strOutput      = '';
    this.selectedNode   = null;

    this.instanceName   = objName;
    this.imgFolder      = '/rdp4j/resource/js/dtree/img/';
    this.userScript     = null;
    this.hasLines       = true;
    this.clickSelect    = true;
    this.folderLinks    = true;
    this.useCookies     = true;

		this.needPage = needPage;



    this.add = function(id, pid, name, userScript, tip, isopen, img,checkBox)
    {
        this.arrNodes[this.arrNodes.length] = new Node(id, pid, name, userScript, tip, isopen, img, checkBox);
    }

    this.draw = function()
    {
        if (document.getElementById)
        {
            this.preloadIcons();
            if (this.useCookies) this.selectedNode = this.getSelected();
            this.addNode(this.rootNode);
            document.writeln(this.strOutput);
        }
        else
        {
            document.writeln('Browser not supported.');
        }
    }

    this.openAll = function()
    {
        this.oAll(true);
    }

    this.closeAll = function()
    {
        this.oAll(true);
    }

    this.preloadIcons = function()
    {

        if (this.hasLines)
        {
            this.arrIcons[0] = new Image();
            this.arrIcons[0].src = this.imgFolder + 'plus.gif';
            this.arrIcons[1] = new Image();
            this.arrIcons[1].src = this.imgFolder + 'plusbottom.gif';
            this.arrIcons[2] = new Image();
            this.arrIcons[2].src = this.imgFolder + 'minus.gif';
            this.arrIcons[3] = new Image();
            this.arrIcons[3].src = this.imgFolder + 'minusbottom.gif';
        }
        else
        {
            this.arrIcons[0] = new Image();
            this.arrIcons[0].src = this.imgFolder + 'nolines_plus.gif';
            this.arrIcons[1] = new Image();
            this.arrIcons[1].src = this.imgFolder + 'nolines_plus.gif';
            this.arrIcons[2] = new Image();
            this.arrIcons[2].src = this.imgFolder + 'nolines_minus.gif';
            this.arrIcons[3] = new Image();
            this.arrIcons[3].src = this.imgFolder + 'nolines_minus.gif';
        }
        this.arrIcons[4] = new Image();
        this.arrIcons[4].src = this.imgFolder + 'folder.gif';
        this.arrIcons[5] = new Image();
        this.arrIcons[5].src = this.imgFolder + 'folderopen.gif';
    }
    this.addNode = function(pNode)
    {
        for (var n=0; n<this.arrNodes.length; n++)
        {
            if (this.arrNodes[n].pid == pNode)
            {
                var cn = this.arrNodes[n];
                cn._hc = this.hasChildren(cn);
                cn._ls = (this.hasLines) ? this.lastSibling(cn) : false;
                if (cn._hc && !cn._io && this.useCookies) cn._io = this.isOpen(cn.id);

                if (this.clickSelect && cn.id == this.selectedNode)
                {
                        cn._is = true;
                        this.selectedNode = n;
                }

                if (!this.folderLinks && cn._hc) cn.userScript = null;


                if (this.rootNode != cn.pid)
                {
                    for (r=0; r<this.arrRecursed.length; r++)
                        this.strOutput += '<img src="' + this.imgFolder + ( (this.arrRecursed[r] == 1 && this.hasLines) ? 'line' : 'empty' ) + '.gif" alt="" />';

                    (cn._ls) ? this.arrRecursed.push(0) : this.arrRecursed.push(1);

                    if (cn._hc)
                    {
                        this.strOutput += '<img id="j' + this.instanceName + n + '" onclick="javascript: ' + this.instanceName + '.o(' + n + ');" ' + 'src="' + this.imgFolder;
                        if (!this.hasLines)
                            this.strOutput += 'nolines_';

                        this.strOutput += ( (cn._io) ? ((cn._ls && this.hasLines) ? 'minusbottom' : 'minus') : ((cn._ls && this.hasLines) ? 'plusbottom' : 'plus' ) )
                            + '.gif" alt="" />';
                    }
                    else
                        this.strOutput += '<img src="' + this.imgFolder + ( (this.hasLines) ? ((cn._ls) ? 'joinbottom' : 'join' ) : 'empty') + '.gif" alt="" />';
                }

                if (cn.userScript)
                {
                    this.strOutput += '<span style="CURSOR: hand" id=treeHref ';
                    if (cn.title) this.strOutput += ' title="' + cn.title + '"';
                    this.strOutput += ' onclick="javascript:';
                    if (cn.userScript) this.strOutput += cn.userScript + ';';
                    if (this.userScript) this.strOutput += this.userScript + ';';

                    if (this.clickSelect)
                    {
                        if (cn._hc)
                        {
                            if (this.folderLinks)
                                this.strOutput +=  this.instanceName + '.s(' + n + ');';
                        }
                        else
                        {
                            this.strOutput +=  this.instanceName + '.s(' + n + ');';
                        }
                    }

                    this.strOutput += '">';
                }
                if ((!this.folderLinks || !cn.userScript) && cn._hc && cn.pid != this.rootNode)
                {
                    this.strOutput += '<span style="CURSOR: hand" id=treeHref onclick="javascript: ' + this.instanceName + '.o(' + n + ');">';
                }

                this.strOutput += '<img id="i' + this.instanceName + n + '" src="' + this.imgFolder;

								if(this.needPage){
                	this.strOutput += (cn.img) ? cn.img : ((this.rootNode == cn.pid) ? 'base' : (cn._hc) ? ((cn._io) ? 'folderopen' : 'folder') : 'page') + '.gif';
								}else{
									this.strOutput += (cn.img) ? cn.img : ((this.rootNode == cn.pid) ? 'base' : (cn._hc) ? ((cn._io) ? 'folderopen' : 'folder') : 'folder') + '.gif';
								}
                this.strOutput += '" alt="" />';
                
                

                this.strOutput += '<span id="s' + this.instanceName + n + '" class="' + ((this.clickSelect) ? ((cn._is ? 'nodeSel' : 'node')) : 'node') + '">';

                this.strOutput += cn.name;

                    this.strOutput += '</span>';

                if (cn.userScript || (!this.folderLinks && cn._hc)) this.strOutput += '</span>';

                this.strOutput += '<br />\n';

                if (cn._hc)
                {
                    this.strOutput += '<div id="d' + this.instanceName + n + '" style="display:'
                    + ((this.rootNode == cn.pid || cn._io) ? 'block' : 'none')
                    + ';">\n';
                    this.addNode(cn.id);
                    this.strOutput += '</div>\n';
                }
                this.arrRecursed.pop();
            }
        }
    }

    this.hasChildren = function(node)
    {
        for (n=0; n<this.arrNodes.length; n++)
            if (this.arrNodes[n].pid == node.id) return true;
        return false;
    }

    this.lastSibling = function(node)
    {
        var lastId;
        for (n=0; n< this.arrNodes.length; n++)
            if (this.arrNodes[n].pid == node.pid) lastId = this.arrNodes[n].id;
        if (lastId==node.id) return true;
        return false;
    }

    this.isOpen = function(id)
    {
        openNodes = this.getCookie('co' + this.instanceName).split('.');
        for (n=0;n<openNodes.length;n++)
            if (openNodes[n] == id) return true;
        return false;
    }

    this.isSelected = function(id)
    {
        selectedNode = this.getCookie('cs' + this.instanceName);
        if (selectedNode)
        {
            if (id==selectedNode)
            {
                this.selectedNode = id;
                return true
            }
        }
        return false;
    }

    this.getSelected = function()
    {
        selectedNode = this.getCookie('cs' + this.instanceName);
        if (selectedNode)   return selectedNode;
        return null;
    }

    this.s = function(id)
    {
        cn = this.arrNodes[id];
        var sindex = this.getIndex(this.selectedNode);
        if (sindex > 0 && sindex != id)
        {
            if (sindex)
            {
                eOldSpan = document.getElementById("s" + this.instanceName + sindex);
                eOldSpan.className = "node";
            }

            eNewSpan = document.getElementById("s" + this.instanceName + id);
            eNewSpan.className = "nodeSel";

            this.selectedNode = id;
            if (this.useCookies) this.setCookie('cs' + this.instanceName, cn.id);
        }
    }

    this.getIndex = function(id)
    {
        for (n=0;n<this.arrNodes.length;n++)
        {
                if(this.arrNodes[n].id == id)
                {
                        return n;
                }
        }
        return -1;
    }

    this.o = function(id)
    {
        cn = this.arrNodes[id];

        (cn._io) ? this.nodeClose(id,cn._ls) : this.nodeOpen(id,cn._ls);
        cn._io = !cn._io;

        if (this.useCookies) this.updateCookie();
    }

    this.oAll = function(open)
    {
        for (n=0;n<this.arrNodes.length;n++)
        {
            if (this.arrNodes[n]._hc && this.arrNodes[n].pid != this.rootNode)
            {
                if (open)
                {
                    this.nodeOpen(n, this.arrNodes[n]._ls);
                    this.arrNodes[n]._io = true;
                }
                else
                {
                    this.nodeClose(n, this.arrNodes[n]._ls);
                    this.arrNodes[n]._io = false;
                }
            }
        }
        if (this.useCookies) this.updateCookie();
    }

    this.nodeOpen = function(id, bottom)
    {
        eDiv    = document.getElementById('d' + this.instanceName + id);
        eJoin   = document.getElementById('j' + this.instanceName + id);
        eIcon   = document.getElementById('i' + this.instanceName + id);
        eJoin.src = (bottom) ?  this.arrIcons[3].src : this.arrIcons[2].src;
        if (!this.arrNodes[id].img) eIcon.src = this.arrIcons[5].src;
        eDiv.style.visibility="visible";
        eDiv.style.display = 'block';
    }

    this.nodeClose = function(id, bottom)
    {

        eDiv    = document.getElementById('d' + this.instanceName + id);
        eJoin   = document.getElementById('j' + this.instanceName + id);
        eIcon   = document.getElementById('i' + this.instanceName + id);
        eJoin.src = (bottom) ? this.arrIcons[1].src : this.arrIcons[0].src;
        if (!this.arrNodes[id].img) eIcon.src = this.arrIcons[4].src;
        eDiv.style.visibility="hidden";
        eDiv.style.display = 'none';
    }

    this.clearCookie = function()
    {
        var now = new Date();
        var yesterday = new Date(now.getTime() - 1000 * 60 * 60 * 24);
        this.setCookie('co'+this.instanceName, 'cookieValue', yesterday);
        this.setCookie('cs'+this.instanceName, 'cookieValue', yesterday);
    }

    this.setCookie = function(cookieName, cookieValue, expires, path, domain, secure) {
        document.cookie =
            escape(cookieName) + '=' + escape(cookieValue)
            + (expires ? '; expires=' + expires.toGMTString() : '')
            + (path ? '; path=' + path : '')
            + (domain ? '; domain=' + domain : '')
            + (secure ? '; secure' : '');
    }

    this.getCookie = function(cookieName) {
        var cookieValue = '';
        var posName = document.cookie.indexOf(escape(cookieName) + '=');
        if (posName != -1)
        {
            var posValue = posName + (escape(cookieName) + '=').length;
            var endPos = document.cookie.indexOf(';', posValue);
            if (endPos != -1)
                cookieValue = unescape(document.cookie.substring(posValue, endPos));
            else
                cookieValue = unescape(document.cookie.substring(posValue));
        }
        return (cookieValue);
    }

    this.updateCookie = function()
    {
        sReturn = '';
        for (n=0;n<this.arrNodes.length;n++)
        {
            if (this.arrNodes[n]._io && this.arrNodes[n].pid != this.rootNode)
            {
                if (sReturn) sReturn += '.';
                sReturn += this.arrNodes[n].id;
            }
        }
        this.setCookie('co' + this.instanceName, sReturn);
    }

}

if (!Array.prototype.push) {
    Array.prototype.push = function array_push() {
        for(var i=0;i<arguments.length;i++)
            this[this.length]=arguments[i];
        return this.length;
    }
}
if (!Array.prototype.pop) {
    Array.prototype.pop = function array_pop() {
        lastElement = this[this.length-1];
        this.length = Math.max(this.length-1,0);
        return lastElement;
    }
}

