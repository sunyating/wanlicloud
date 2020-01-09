function getBrowserVersion() {  
    var browser = {};  
    var userAgent = navigator.userAgent.toLowerCase();  
    var s;  
    (s = userAgent.match(/msie ([\d.]+)/))  
            ? browser.ie = s[1]  
            : (s = userAgent.match(/firefox\/([\d.]+)/))  
                    ? browser.firefox = s[1]  
                    : (s = userAgent.match(/chrome\/([\d.]+)/))  
                            ? browser.chrome = s[1]  
                            : (s = userAgent.match(/opera.([\d.]+)/))  
                                    ? browser.opera = s[1]  
                                    : (s = userAgent  
                                            .match(/version\/([\d.]+).*safari/))  
                                            ? browser.safari = s[1]  
                                            : 0;  
    var version = "";  
    if (browser.ie) {  
        version = 'msie ' + browser.ie;  
    } else if (browser.firefox) {  
        version = 'firefox ' + browser.firefox;  
    } else if (browser.chrome) {  
        version = 'chrome ' + browser.chrome;  
    } else if (browser.opera) {  
        version = 'opera ' + browser.opera;  
    } else if (browser.safari) {  
        version = 'safari ' + browser.safari;  
    } else {  
        version = 'unknow 0';  
    }  
    return version;  
}  


function isVersionMatch(){
	var browserVersion = getBrowserVersion();
	if (browserVersion.split(" ").length != 2) {
		return false;
	}
	var strBrowserVersion = browserVersion.split(" ")[1];
	var isSafari = browserVersion.split(" ")[0]=="safari" ? true : false;
	var floatBrowserVersion = parseFloat(strBrowserVersion);
	if (isSafari && floatBrowserVersion > 6.0) {
		return true;
	}
	else{
		return false;
	}
}

function is_undefined(v) {
	if (typeof (v) === 'undefined') {
		return true;
	} else {
		return false;
	}
}


function split_url (url) {
			
	if (is_undefined(url)) {
		return null;
	}
	
	var parse_url = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/;
	var result = parse_url.exec(url);
	

	if (result === null || is_undefined(result)) {
		return null;
	}

	return result;
}


var filterSuffixes = ["jpg","png","js","css","about:blank","jpeg","bmp","swf","asf","mp3","gif","bgm","mp4","wma","midi","rm","mpeg","mov"];
var currentHref=null;



function visibilityChanged(event){
		var result = split_url(window.location.href);
		var scheme = result[1];
		if (!is_undefined(scheme) && (scheme.toLowerCase() === 'http' || scheme.toLowerCase() === 'https')) {

			var splDotArray =  window.location.href.split("?")[0].split(".");
			if(splDotArray.length <= 0){
				return;
			}

			var suffix = splDotArray[splDotArray.length-1].toLowerCase();
			for (var i in filterSuffixes) {
				if(suffix == filterSuffixes[i]){
					return;
				}
			}
			console.log("testtest");
			safari.self.tab.canLoad(event,window.location.href);
			document.removeEventListener("visibilitychange", visibilityChanged);
		}
}


if(typeof safari !== "undefined" && isVersionMatch()){
	document.addEventListener("beforeload", function(){
		if (currentHref==null || currentHref!=window.location.href) {
			currentHref = window.location.href;
		}
		else{
			return;
		}
		

		if (document.hidden) {
			
			document.addEventListener("visibilitychange", visibilityChanged);
			return;
		};

		var result = split_url(window.location.href);
		var scheme = result[1];
		if (!is_undefined(scheme) && (scheme.toLowerCase() === 'http' || scheme.toLowerCase() === 'https')) {

			var splDotArray =  window.location.href.split("?")[0].split(".");
			if(splDotArray.length <= 0){
				return;
			}

			var suffix = splDotArray[splDotArray.length-1].toLowerCase();
			for (var i in filterSuffixes) {
				if(suffix == filterSuffixes[i]){
					return;
				}
			}

			safari.self.tab.canLoad(event,window.location.href);
		}
		else{
			return;
		}

		
	}, true);
}




// JavaScript Document