window.onload = function() {
	const host = window.location.href;
	const externalurl = document.getElementById("external").innerText;
	const internalurl = document.getElementById("internal").innerText;
	const error = document.getElementById("error").innerText;
	let doname = /^([\w-]+\.)+((com)|(net)|(org)|(gov\.cn)|(info)|(cc)|(com\.cn)|(net\.cn)|(org\.cn)|(name)|(biz)|(tv)|(cn)|(mobi)|(name)|(sh)|(ac)|(io)|(tw)|(com\.tw)|(hk)|(com\.hk)|(ws)|(travel)|(us)|(tm)|(la)|(me\.uk)|(org\.uk)|(ltd\.uk)|(plc\.uk)|(in)|(eu)|(it)|(jp)|(top)|(ai))$/;
	let flag_domain = doname.test(document.domain);
	if(flag_domain){//是域名
		// 域名
		//alert(document.domain)
		ping(externalurl)
		//alert(document.domain)
		
	}else{
		// ip
		window.location.replace(internalurl);
		//alert(internalurl)
	};
	function ping (ip) {
		var img = new Image();
		img.src = ip;
		var flag = false;  //无法访问
		img.onload = function () {
			flag = true;
			window.location.replace(ip);
			console.log('ok');
		};
		img.onerror = function () {
			flag = true;
			//alert(ip)
			window.location.replace(ip);
			console.log('ok');
		};
		var timer = setTimeout(function () {
			if (!flag) {    //如果真的无法访问
				flag = false;
				window.location.replace(error);
				console.log('failed');
			}
		}, 1000);
	}
}