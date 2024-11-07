window.onload = function() {
	const host = window.location.href;
	const externalurl = document.getElementById("external").innerText;
	const internalurl = document.getElementById("internal").innerText;
	const error = document.getElementById("error").innerText;
	let doname = /^([\w-]+\.)+((com)|(net)|(org)|(gov\.cn)|(info)|(cc)|(com\.cn)|(net\.cn)|(org\.cn)|(name)|(biz)|(tv)|(cn)|(mobi)|(name)|(sh)|(ac)|(io)|(tw)|(com\.tw)|(hk)|(com\.hk)|(ws)|(travel)|(us)|(tm)|(la)|(me\.uk)|(org\.uk)|(ltd\.uk)|(plc\.uk)|(in)|(eu)|(it)|(jp)|(top)|(ai))$/;
	//let IP =/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/;
	let flag_domain = doname.test(document.domain);
	if(flag_domain){//是域名
		// 域名
		getURL(externalurl)
	}else{
		// ip
		//ping(externalurl)
		window.location.replace(internalurl);
		//alert(internalurl)
	};
	function checkurl(url) {
    return new Promise((resolve) => {
      console.log(`正在检查: ${url}`);           
      const img = new Image();
      const timeout = setTimeout(() => {
        console.log(`${url} 不可访问: 连接超时`);
        img.src = '';
        window.location.href = error;
        resolve(false);
      }, 5000);

      img.onload = function() {
        clearTimeout(timeout);
        console.log(`${url} 可访问`);
        window.location.href = url;
        resolve(true);
      };

      img.onerror = function() {
        clearTimeout(timeout);
        console.log(`${url} 不可访问`);
        //window.location.href = error;
        resolve(false);
      };

      img.src = url + '/favicon.ico?t=' + new Date().getTime();
    });
  }
  function getURL(url) {
    function getXmlHttpRequest() {
      if (window.XMLHttpRequest) {
         return new XMLHttpRequest();
      }
      else if (window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP");
      }
    };
    var xmlhttp = getXmlHttpRequest();
    xmlhttp.open("GET", url, false); //第三个参数表示是否异步
    xmlhttp.send();
    if (xmlhttp.readyState == 4) {
      if (xmlhttp.status == 200) {
        console.log(`${url} 可访问`);
        return true;
      } else {
        console.log(`${url} 不可访问`);
        return false;
      }
    }
  } 
}