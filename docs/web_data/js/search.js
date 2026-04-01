$(function () {

  // 默认搜索引擎记录
  var searchTypeStore = {
    set: function (name) {
      localStorage.setItem('SearchName', name);
    },
    get: function () {
      return localStorage.getItem('SearchName') || '百度';
    },
  };

  var $searchMethods = $('#search_methods');
  var $searchLogo = $('#search_logo');
  var initSearchName = searchTypeStore.get();
  $searchLogo.attr('data-name', initSearchName);

  // 从 config 获取搜索引擎配置
  var search_engines = {};
  if (typeof config !== 'undefined' && config.search && config.search.engines) {
    config.search.engines.forEach(function(engine) {
      search_engines[engine.name] = {
        url: engine.url,
        icon: engine.icon
      };
    });
  } else {
    // 默认配置
    search_engines = {
      '必应': { url: 'https://cn.bing.com/search?q=', icon: 'web_data/css/img/bing.png' },
      '谷歌': { url: 'https://www.google.com/search?q=', icon: 'web_data/css/img/google.png' },
      '百度': { url: 'https://www.baidu.com/s?wd=', icon: 'web_data/css/img/baidu.png' }
    };
  }

  $searchLogo.on('click', function () {
    $searchMethods.show();
  });

  // 搜索引擎切换
  $searchMethods.on('click', 'li', function () {
    var name = $(this).data('name');
    searchTypeStore.set(name);
    $searchLogo.attr('data-name', name);
    
    // 更新图标
    if (search_engines[name] && search_engines[name].icon) {
      $searchLogo.css('background-image', 'url(' + search_engines[name].icon + ')');
    }
    
    $searchMethods.hide();
    $('#search_keyword').focus();
  });

  $searchMethods.on('mouseleave', function () {
    $searchMethods.hide();
  });

  // 关键词搜索输入
  $('#search_keyword').on('keyup', function (event) {
    if (event.which == 13) {
      openSearch($(this).val());
    }
  });

  // 点击高亮显示
  $('#search_keyword').on('focus', function () {
    $('.search-left').css({
      "border-style": "solid",
      "border-color": "rgba(24, 144, 255, 1)",
      "box-shadow": "0px 0px 2px 1px rgba(145, 213, 255, 0.96)",
    });
  }).on('blur', function () {
    $('.search-left').prop('style', '');
  });

  // 搜索按钮点击
  $('#search_submit').on('click', function () {
    openSearch($('#search_keyword').val());
  });

  // 获取搜索引擎名称
  function getSearchName() {
    return $('#search_logo').attr('data-name');
  }

  // 执行搜索
  function openSearch(keyword) {
    if (!keyword) return;
    var name = getSearchName();
    var engine = search_engines[name];
    if (engine) {
      window.open(engine.url + keyword);
    }
  }
});
