const config = {
  "site": {
    "title": "3wlh 导航",
    "logo": "3wlh"
  },
  "search": {
    "default": "必应",
    "engines": [
      { "name": "必应", "url": "https://cn.bing.com/search?q=", "icon": "web_data/css/img/bing.png" },
      { "name": "谷歌", "url": "https://www.google.com/search?q=", "icon": "web_data/css/img/google.png" },
      { "name": "百度", "url": "https://www.baidu.com/s?wd=", "icon": "web_data/css/img/baidu.png" } 
    ]
  },
  "webpage": [
    {
      "categories": "APP",
      "links": [
        {
          "title": "Openwrt",
          "intranet": "http://10.10.10.254",
          "external": "http://{url}:8",
          "icon": "https://img.660101.xyz/file/8a378d54e4d6616d4b2d3515547c05f0.png"
        },
        {
          "title": "飞牛NAS",
          "intranet": "http://10.10.10.252:5666",
          "external": "http://{url}:5666",
          "icon": "https://img.660101.xyz/file/6273e91cedf7163c6a820412154302c5.png"
        },
        {
          "title": "ASUS",
          "intranet": "http://10.10.10.253",
          "external": "http://{url}:6",
          "icon": "https://img.660101.xyz/file/a7016c5887fa9e331671036150003835.png"
        },
        {
          "title": "光猫管理页面",
          "intranet": "http://10.10.10.250/cgi-bin/page.cgi?get=modem",
          "external": "",
          "icon": "https://img.660101.xyz/file/0c365bd1da062de54fab4dbc994ad945.png"
        },
        {
          "title": "OEC_Turbo",
          "intranet": "http://10.10.10.250",
          "external": "",
          "icon": "https://img.660101.xyz/file/f3b405745d03a675e699b2b2e913547a.png"
        },
        {
          "title": "Openlist",
          "intranet": "http://10.10.10.250:5244",
          "external": "http://{url}:5244",
          "icon": "https://img.660101.xyz/file/e198e780a9ae221f73f9802821c83778.png"
        },
        {
          "title": "VS_Code",
          "intranet": "http://10.10.10.252:8081",
          "external": "http://{url}:8081",
          "icon": "https://img.660101.xyz/file/2240a3122b88cbae8b78359de03ae851.png"
        },
        {
          "title": "超微X10",
          "intranet": "http://10.10.10.250/cgi-bin/page.cgi?get=supermicro",
          "external": "",
          "icon": "https://img.660101.xyz/file/8ff2ecbd1585cc12d8abeb58c75186dc.png"
        },
        {
          "title": "NAS电源",
          "intranet": "http://10.10.10.8",
          "external": "",
          "icon": "https://img.660101.xyz/file/0037684322e8c90f54dad56931358b1c.png"
        },
        {
          "title": "Photopea",
          "intranet": "http://10.10.10.250:8887",
          "external": "",
          "icon": "./web_data/img/photopea.png"
        }
      ]
    },
    {
      "categories": "AI",
      "links": [
        {
          "title": "腾讯元宝",
          "intranet": "https://yuanbao.tencent.com/",
          "icon": "./web_data/img/yuanbao.png"
        },
        {
          "title": "文心一言",
          "intranet": "https://yiyan.baidu.com/",
          "icon": "./web_data/img/yiyan.png"
        },
        {
          "title": "豆包",
          "intranet": "https://www.doubao.com/chat/",
          "icon": "./web_data/img/doubao.png"
        },
        {
          "title": "DeepSeek",
          "intranet": "https://chat.deepseek.com/",
          "icon": "./web_data/img/deepseek.png"
        },
        {
          "title": "Kimi",
          "intranet": "https://www.kimi.com/zh/",
          "icon": "./web_data/img/kimi.ico"
        }
      ]
    },
    {
      "categories": "仓库",
      "links": [
        {
          "title": "Github仓库",
          "intranet": "https://github.com/3wlh?tab=repositories/",
          "icon": "https://img.660101.xyz/file/584db029db8e768b293d912179188c7a.png"
        },
        {
          "title": "Gitee仓库",
          "intranet": "https://gitee.com/gitee_3wlh/projects",
          "icon": "https://img.660101.xyz/file/9fa5f298891466ccfcfd5583d6802966.png"
        },
        {
          "title": "CNB仓库",
          "intranet": "https://cnb.cool/u/3wlh/repos",
          "icon": "https://docs.cnb.build/images/logo/320/Symbol-Color.png"
        },
        {
          "title": "Gitlink仓库",
          "intranet": "https://www.gitlink.org.cn/git_3wlh/projects",
          "icon": "./web_data/img/gitlin.jpg"
        }
      ]
    },
    {
      "categories": "常用",
      "links": [
        {
          "title": "OpenWrt定制",
          "intranet": "https://openwrt.ai/",
          "icon": "https://img.660101.xyz/file/c944ed6d2acc2a9e0b97044553373a81.png"
        },
        {
          "title": "木瓜云",
          "intranet": "https://muguacloud.cc/",
          "icon": "https://img.660101.xyz/file/324ba0e11bca02fa6970c12660537158.png"
        },
        {
          "title": "在线PS",
          "intranet": "https://www.tuyitu.com/ps/sources/",
          "icon": "https://img.660101.xyz/file/015dab37ac5d6607f56855c9c5dbb4d8.png"
        },
        {
          "title": "图库",
          "intranet": "https://img.660101.xyz/",
          "icon": "https://img.660101.xyz/file/b66addcfbb1ed1894c1ed396d0959412.png"
        },
        {
          "title": "Cloudflare",
          "intranet": "https://dash.cloudflare.com/",
          "icon": "https://img.660101.xyz/file/3afd545ae67fc7acba9b6d9274cdef99.png"
        },
        {
          "title": "Docker搜索",
          "intranet": "https://hub.docker.com/search/",
          "icon": "https://img.660101.xyz/file/19e15686a125f8b0b20ee98ad3365b0c.png"
        },
        {
          "title": "阿里图标库",
          "intranet": "https://www.iconfont.cn/",
          "icon": "https://img.660101.xyz/file/dde3f16ff0d2e15bcd1e92e683f1c1ab.png"
        }
        
      ]
    }
  ]
};
