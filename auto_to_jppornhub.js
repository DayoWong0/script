// ==UserScript==
// @name         pornhub自动跳转日本站
// @name:zh-CN   pornhub自动跳转日本站
// @name:en      auto to pornhub jp
// @namespace    http://tampermonkey.net/
// @version      0.6
//@description:zh-cn pornhub跳转日本站
// @description:en  auto jump to pornhub jp
// @author       no one
// @match        https://*.pornhub.com/*
// @grant        none
// @connect      pornhub.com
// @connect      www.pornhub.com
// @description pornhub跳转日本站
// ==/UserScript==

(function() {
    'use strict';
    var domain = document.domain;
    //alert(domain)
    var url = document.URL;
    //alert(url);
    var arrUrl = url.split("//");
    var arrWord=arrUrl[1].split(".");
    var country=arrWord[0];
    //alert("域名前缀是" + country);
    if(domain!="jp.pornhub.com"){
        window.location.href="https://jp.pornhub.com/video?c=111";
        //alert(url.replace(country,"jp"))
    }
})();
