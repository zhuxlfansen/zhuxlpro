String.prototype.trim = function() {
	return this.replace(/(^[\s]*)|([\s]*$)/g, "");
};

/**
 * 和I18nMessage一致。
 */
var I18nMessage = function(text, type, item, code) {
	/**
	 * messageText
	 */
	this.text = (text || "");
	/**
	 * messageType
	 */
	this.type = (type || "");
	/**
	 * messageItem
	 */
	this.item = (item || "");
	/**
	 * messageCode
	 */
	this.code = (code || "");
};
JCommonUtil = {};
JCommonUtil.clearMessageArea = function(extraCls) {
	var divMessageAreaElement = $("#divErrorMessage");
	if (!divMessageAreaElement) {
		return;
	}
	var ulElement = divMessageAreaElement.children('ul');
	var length = 0;
	if (ulElement) {
		length = ulElement.children('li').length;
		if(extraCls != null){
			ulElement.children('li.'+extraCls).remove();
		} else {
			ulElement.children('li.dfExtraCls').remove();
		}
	}
	if (length <= 3) {
		divMessageAreaElement.attr('class', 'info1-3');
	} else {
		divMessageAreaElement.attr('class', 'info3');
	}
	if(length == 0){
		divMessageAreaElement.css('display', 'none');
	}

};

JCommonUtil.showAjaxMessages = function(messages, extraCls) {
	JCommonUtil.addMessageArea(messages, extraCls);
};
JCommonUtil.catchAjaxFailure = function(jqXHR, textStatus, thrownError) {
	var jsonRlt = jqXHR.responseJSON, messages, status;
	if (jsonRlt != null) {
		status = jsonRlt.status;
		messages = jsonRlt.messages;
	}
	if (messages != null
			&& messages.length > 0) {
		JCommonUtil.showAjaxMessages(jsonRlt.messages);
	} else {
		location.href = ROOT_URL + 'error';
	}
};
JCommonUtil.decodeJson = function(jsonStr) {
	return $.parseJSON(jsonStr);
};
/**
 * messageArea
 */
JCommonUtil.addMessageArea = function(messages,extraCls) {
	var divMessageAreaElement = $("#divErrorMessage");
	if (!divMessageAreaElement) {
		return;
	}
	var ulElement = divMessageAreaElement.children('ul');
	if (!ulElement) {
		return;
	}

	var messageArray = messages || [];
	if (messageArray.length == 0) {
		return;
	}
	var cls, messageObject,li;
	for (var i = 0; i < messageArray.length; i++) {
		messageObject = messageArray[i];
		cls = null;
		if (messageObject && messageObject.type
				&& (messageObject.type == "I" || messageObject.type == "INFO")) {
			cls = 'liInfo';
		}
		li = $('<li></li>');
		if(extraCls != null){
			li.addClass(extraCls);
		} else {
			li.addClass('dfExtraCls');
		}
		if(cls != null){
			li.addClass(cls);
		}
		li.html(messageObject.text);
		ulElement.append(li);
	}
	var length = ulElement.children('li').length;
	if (length <= 3) {
		divMessageAreaElement.attr('class', 'info1-3');
	} else {
		divMessageAreaElement.attr('class', 'info3');
	}
	divMessageAreaElement.css('display', '');
};
JCommonUtil.doLogout = function() {
	$.get(ROOT_URL+'logout').complete(JCommonUtil.closeWebPage);
};
JCommonUtil.closeWebPage = function() {
	if (navigator.userAgent.indexOf("MSIE") > 0) {
		if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
			window.opener = null;
			window.close();
		} else {
			window.open('', '_top');
			window.top.close();
		}
	} else if (navigator.userAgent.indexOf("Firefox") > 0) {
		window.location.href = 'about:blank ';
	} else {
		window.opener = null;
		window.open('', '_self', '');
		window.close();
		window.location.href = 'about:blank ';
	}
};

