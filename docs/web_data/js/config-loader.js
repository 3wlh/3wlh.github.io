let dnsDomainValue = '3wlh.cn';
let isIntranetMode = false;

$(document).ready(function() {
  loadDnsConfig().then(() => {
    initMode().then(() => {
      loadConfig();
    });
  }).catch(() => {
    initMode().then(() => {
      loadConfig();
    });
  });
});

async function loadDnsConfig() {
  try {
    console.log('开始查询 DNS TXT 记录...');
    console.log('getTxtRecords 函数:', typeof getTxtRecords);
    const records = await getTxtRecords('home.19970101.xyz');
    console.log('DNS 响应 records:', records);
    if (records && records.length > 0) {
      dnsDomainValue = records[0];
      console.log('DNS TXT 记录:', dnsDomainValue);
    } else {
      console.log('没有找到 TXT 记录');
    }
  } catch (error) {
    console.error('获取 DNS TXT 记录失败，使用默认值:', error);
  }
}

function noCorsFetch(url, timeout = 500) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeout);
  return fetch(url, {
    method: 'POST',
    mode: 'no-cors',
    signal: controller.signal
  })
  .then(() => true)
  .catch(() => false)
  .finally(() => clearTimeout(timeoutId));
}

function checkIntranetByImage(url, timeout = 100) {
  return new Promise((resolve) => {
    const img = new Image();
    const timer = setTimeout(() => {
      img.src = '';
      resolve(false);
    }, timeout);
    
    img.onload = img.onerror = () => {
      clearTimeout(timer);
      resolve(true);
    };
    
    img.src = url + '/favicon.ico?t=' + Date.now();
  });
}

async function initMode() {
  const testUrl = "http://10.10.10.254";
  
  try {
    console.log('内网检测: ' + testUrl);
    const isIntranetReachable = await checkIntranetByImage(testUrl, 100);
    console.log('内网是否可访问:', isIntranetReachable);
    isIntranetMode = isIntranetReachable;
  } catch (error) {
    console.log('内网检测失败，使用域名检测');
    let doname = /^([\w-]+\.)+((com)|(net)|(org)|(gov\.cn)|(info)|(cc)|(com\.cn)|(net\.cn)|(org\.cn)|(name)|(biz)|(tv)|(cn)|(mobi)|(name)|(sh)|(ac)|(io)|(tw)|(com\.tw)|(hk)|(com\.hk)|(ws)|(travel)|(us)|(tm)|(la)|(me\.uk)|(org\.uk)|(ltd\.uk)|(plc\.uk)|(in)|(eu)|(it)|(jp)|(top)|(ai))$/;
    let flag_domain = doname.test(document.domain);
    isIntranetMode = !flag_domain;
  }
  updateButton();
}

function loadConfig() {
  console.log('loadConfig 被调用');
  console.log('config 对象:', typeof config);
  if (typeof config === 'undefined') {
    console.error('配置文件未加载');
    return;
  }
  console.log('config 内容:', config);

  loadSiteConfig();
  loadSearchEngines();
  loadWebpageLinks();
}

function loadSiteConfig() {
  if (config.site) {
    if (config.site.logo) {
      $('#site-logo').text(config.site.logo);
    }
    if (config.site.title) {
      document.title = config.site.title;
    }
  }
}

function loadSearchEngines() {
  if (!config.search || !config.search.engines) return;

  const $searchMethods = $('#search_methods');
  $searchMethods.empty();

  config.search.engines.forEach(engine => {
    const $li = $('<li></li>')
      .attr('data-type', engine.type)
      .addClass('search-item ' + engine.type)
      .text(engine.name);
    $searchMethods.append($li);
  });

  if (config.search.default) {
    const $defaultEngine = $(`.search-item.${config.search.default}`);
    if ($defaultEngine.length) {
      $defaultEngine.addClass('active');
      $('#search_logo')
        .attr('data-type', config.search.default)
        .removeClass()
        .addClass('search-logo ' + config.search.default);
    }
  }
}

function loadWebpageLinks() {
  console.log('loadWebpageLinks 被调用');
  if (!config.webpage || !config.webpage.length) return;

  const $links = $('#links');
  console.log('#links 元素:', $links.length);
  $links.empty();

  let globalLinkIndex = 0;

  config.webpage.forEach((category, catIndex) => {
    console.log(`处理分类 ${catIndex}:`, category.categories);
    const $categoryDiv = $('<div class="category"></div>');
    
    const $categoryTitle = $('<h2 class="category-title"></h2>').text(category.categories);
    $categoryDiv.append($categoryTitle);

    const $ul = $('<ul class="link-list"></ul>');

    category.links.forEach((link, linkIndex) => {
      console.log(`  链接 ${linkIndex}:`, link.title, 'icon:', link.icon);
      let url = getLinkUrl(link);
      if (url) {
        appendLink($ul, url, link, globalLinkIndex);
        globalLinkIndex++;
      }
    });

    $categoryDiv.append($ul);
    $links.append($categoryDiv);
  });
  
  console.log('渲染完成，总链接数:', globalLinkIndex);
}

function getLinkUrl(link) {
  if (isIntranetMode) {
    if (link.intranet) {
      return link.intranet;
    } else if (link.external) {
      return link.external.replace('{url}', dnsDomainValue);
    }
  } else {
    if (link.external && link.external !== '') {
      return link.external.replace('{url}', dnsDomainValue);
    } else if (link.intranet) {
      return link.intranet;
    }
  }
  if (link.intranet) {
    return link.intranet;
  }
  if (link.external) {
    return link.external.replace('{url}', dnsDomainValue);
  }
  return null;
}

function appendLink($ul, url, link, index) {
  const $li = $('<li class="link-item"></li>');
  const $a = $('<a></a>')
    .attr('href', url)
    .attr('target', '_blank')
    .attr('data-link-index', index);

  const iconSrc = link.icon && link.icon.trim() ? link.icon : '';
  console.log(`链接 ${index} icon src:`, iconSrc);
  
  const $img = $('<img>')
    .addClass('shake')
    .attr('src', iconSrc)
    .on('error', function() {
      console.log(`链接 ${index} 图片加载失败:`, iconSrc);
    })
    .on('load', function() {
      console.log(`链接 ${index} 图片加载成功:`, iconSrc);
    });

  const $strong = $('<strong></strong>').text(link.title);

  $a.append($img).append($strong);
  $li.append($a);
  $ul.append($li);
}

function updateButton() {
  const button = document.getElementById("btn");
  if (isIntranetMode) {
    button.innerText = "内网";
    button.style.backgroundColor = '#c53803';
  } else {
    button.innerText = "外网";
    button.style.backgroundColor = '#03a41b';
  }
}

function getValue() {
  console.log('getValue 被调用');
  isIntranetMode = !isIntranetMode;
  console.log('当前模式:', isIntranetMode ? '内网' : '外网');
  updateButton();
  
  const $links = $('#links');
  console.log('#links 元素:', $links.length);
  if (!config.webpage || !config.webpage.length) return;
  
  let globalLinkIndex = 0;
  config.webpage.forEach(category => {
    category.links.forEach(link => {
      const $a = $links.find(`a[data-link-index="${globalLinkIndex}"]`);
      console.log(`链接 ${globalLinkIndex}:`, link.title, '找到元素:', $a.length);
      if ($a.length) {
        let url = getLinkUrl(link);
        console.log(`  新网址:`, url);
        if (url) {
          $a.attr('href', url);
        }
      }
      globalLinkIndex++;
    });
  });
}
