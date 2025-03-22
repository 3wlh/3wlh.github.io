window.onload = function() {
        const domain = document.getElementById("domain");
        const ip = document.getElementById("ip");
        const button = document.getElementById("btn");
        const host = window.location.host;
        let doname = /^([\w-]+\.)+((com)|(net)|(org)|(gov\.cn)|(info)|(cc)|(com\.cn)|(net\.cn)|(org\.cn)|(name)|(biz)|(tv)|(cn)|(mobi)|(name)|(sh)|(ac)|(io)|(tw)|(com\.tw)|(hk)|(com\.hk)|(ws)|(travel)|(us)|(tm)|(la)|(me\.uk)|(org\.uk)|(ltd\.uk)|(plc\.uk)|(in)|(eu)|(it)|(jp)|(top)|(ai))$/;
        let flag_domain = doname.test(document.domain);
        //alert(document.domain)
        if(flag_domain){//是域名
			// 域名
			domain.style.display='block';
			button.innerText = "外网";
			button.style.backgroundColor='#03a41b';
          
        }else{
			// ip
			ip.style.display='block';
			button.innerText = "内网";
			button.style.backgroundColor='#c53803';
        }
      };
      
function getValue(){
	const button = document.getElementById("btn");
	var srt=button.innerText;
	if (srt=="内网"){
		ip.style.display='none';
		domain.style.display='block';
		button.innerText = "外网";
		button.style.backgroundColor='#03a41b';
	}else{
		ip.style.display='block';
		domain.style.display='none';
		button.innerText = "内网";
		button.style.backgroundColor='#c53803';
    }
}