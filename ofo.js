
        (function () {
            var queryParams = (function (href) {
                if (!href) {
                    return {};
                }
                var fIdx = href.indexOf('?');
                if (fIdx < 0) {
                    return {};
                }
                var lIdx = href.indexOf('#');
                if (lIdx < 0) {
                    lIdx = href.length;
                }
                var wls = href.substring(fIdx, lIdx);
                if (wls.charAt(0) === '?') {
                    wls = wls.substr(1);
                }
                var output = {};
                wls.split('&').filter(function (substr) {
                    return substr.length > 0;
                }).forEach(function (substr) {
                    var keyValue = substr.split('=');
                    var key = decodeURIComponent(keyValue.shift());
                    output[key] = decodeURIComponent(keyValue.join('='));
                });
                return output;
            });
            var queryParamsCur = queryParams(window.location.href);
            var queryParamsRef = queryParams(document.referrer);
            var channelMappings = [[["baidu", "pz"], "bdpz"], [["baidu", "sem"], "bdsem"], [["qihoo", "pz"], "qhpz"], [["qihoo", "sem"], "qhsem"], [["sogou", "pz"], "sgpz"], [["sogou", "sem"], "sgsem"], /*[["baidu", "wappz"], "bdwappz"], */[["shenma", "wappz"], "smwappz"], [["sogou", "wappz"], "sgwappz"], [["baidu", "wapsem"], "bdwapsem"], [["shenma", "wapsem"], "smwapsem"], [["sogou", "wapsem"], "sgwapsem"], [["youku", "brand"], "ykbrand"], [["iqiyi", "brand"], "qybrand"]]; // 王苗常态化

            channelMappings = channelMappings.concat([[["bikeplate", /^\d+$/], "bikeplateNew"], [["bikeplate", "old"], "bikeplateOld"]]); // 车牌扫码
            channelMappings = channelMappings.concat([[["duanxin", "1"], "qqsocial11"]]); // 某次短信
            channelMappings = channelMappings.concat([[["moji", "banner"], "mojibanner"], [["gewala", "banner"], "gewalabanner"], [["maoyan", "banner"], "maoyanbanner"], [["dianping", "banner"], "dianpingbanner"], [["toutiao", "kaiping"], "toutiaokp"], [["wechat", "pyq"], "wechatpyq"]]); // 201702 张瀚穹
            channelMappings = channelMappings.concat([[["moji", "icon"], "mojiicon"], [["moji", "helper"], "mojihelper"], [["kugou", "kaiping"], "kugoukp"], [["getui", "tuisong"], "getui"], [["momo", "kaiping"], "momokp"], [["renmin", "ribao"], "renminribao"]], [["kol", "appjun"], "kolappjun"], [["kol", "asam"], "kolasam"], [["kol", "zhoumo"], "kolzhoumo"], [["kol", "zuijian"], "kolzuijian"], [["kol", "dawanglu"], "koldawanglu"]); // 201703 张瀚穹
            channelMappings = channelMappings.concat([[["moji", "kaiping"], "mojikp"], [["huangli", "kaiping"], "huanglikp"], [["meiyou", "kaiping"], "meiyoukp"], [["baidu", "kaiping"], "baidukp"], [["youku", "kaiping"], "youkukp"], [["mangguo", "kaiping"], "mangguokp"],[["baofeng", "kaiping"], "baofengkp"],[["yinyuetai", "kaiping"], "yinyuetaikp"],[["lizhi", "kaiping"], "lizhikp"],[["huawei", "suoping"], "huaweikp"],[["vivo", "suoping"], "vivokp"],[["tencent", "kaiping"], "tencentkp"],[["moji", "icon"], "mojiicon"],[["moji", "banner"], "mojibanner"],[["toutiao", "kaiping"], "toutiaokp"],[["gt", "tuisong"], "getui"],[["yuedong", "tuisong"], "momokp"]]);
            // 20170309 张瀚穹
            var uaContains = function (key) {
                return navigator.userAgent.toLowerCase().indexOf(key.toLowerCase()) >= 0;
            };

            var USE_NOW = (window.location.href.indexOf('sms') >= 0) || (document.referrer.indexOf('sms') > 0) || (window.location.href.indexOf('use') >= 0) || (document.referrer.indexOf('use') > 0);
            var WECHAT = ['MicroMessenger'].some(uaContains);
            var ANDROID = ['Linux', 'Android'].every(uaContains); // can't just try "Android" as it might catch Windows Phone
            var IOS = ['(iPhone;', '(iPod touch;', '(iPad;', '(iPod;'].some(uaContains); // can't just try "iPhone" as it might catch Windows Phone
            var ALREADY_IN_OFO_APP = (navigator.userAgent.indexOf('OfoApp') >= 0 || window.ofoToken);

            var matches = function (target, pattern) {
                return (pattern instanceof RegExp) ? (pattern.test(target)) : (pattern === target);
            };

            window.addEventListener('DOMContentLoaded', function () {
                var el;
                var channelMappedCur = channelMappings.filter(function (single) {
                    return (matches(queryParamsCur['utm_source'], single[0][0]) && matches(queryParamsCur['utm_medium'], single[0][1]));
                })[0];
                var channelMappedRef = channelMappings.filter(function (single) {
                    return (matches(queryParamsRef['utm_source'], single[0][0]) && matches(queryParamsRef['utm_medium'], single[0][1]));
                })[0];
                var webappUrl = 'https://' + window.location.host + '/newdist/?';

                if (queryParamsCur['next']) {
                    webappUrl += queryParamsCur['next'] + '&';
                }
                var channel = channelMappedCur || channelMappedRef;
                if (channel) {
                    if (channel[1] === 'bikeplateNew') { // 新车牌，带车牌号
                        if (!queryParams['next']) {
                            webappUrl += 'Journey&';
                        }
                        webappUrl += '~pressed=true&~carno=%22' + (channelMappedCur ? queryParamsCur : channelMappedRef)['utm_medium'] + '%22&';
                    }
                    document.getElementsByClassName('local')[0].href = document.getElementsByClassName('local')[0].href.replace('local', channel[1]);
                    webappUrl += 'utm_source=download&utm_medium=' + channel[1] + '&';
                }

                var hashCode = function (s) {
                    return s.split("").reduce(function (a, b) {
                        a = ((a << 5) - a) + b.charCodeAt(0);
                        return a & a;
                    }, 0);
                };
                if ((Math.abs(hashCode(window.location.href + '\n' + navigator.userAgent)) % 10) === 10) {
                    window.location.replace(webappUrl);
                    throw 'NOT_AN_EXCEPTION';
                }

                document.getElementById('default').style.display = 'none';
                document.getElementById('go-webapp').addEventListener('click', function () {
                    window.location.assign(webappUrl);
                });
                if (ALREADY_IN_OFO_APP) {
                    document.getElementById('webver').style.display = 'none';
                    if (ANDROID) {
                        document.getElementById('android-already-in-app').style.display = 'block';
                        return;
                    }
                    if (IOS) {
                        try {
                            window.webkit.messageHandlers.ofo_iOS.postMessage({
                                method: 'toSafari',
                                params: document.getElementsByClassName('appstore')[0].href
                            });
                        } catch (e) {
                        }
                        document.getElementById('ios-already-in-app').style.display = 'block';
                        return;
                    }
                }
                if (WECHAT && IOS) {
                    window.location.assign('http://a.app.qq.com/o/simple.jsp?pkgname=so.ofo.labofo');
                }
                if (WECHAT) {
                    el = document.getElementById('wechat');
                    el.style.display = 'block';
                    return;
                }
                if (ANDROID) {
                    el = document.getElementById('android');
                    el.style.display = 'block';
                    el.appendChild(document.getElementById('android-content').cloneNode(true));
                    if (USE_NOW) {
                        document.getElementById('android-special-0').style.display = 'block';
                        document.getElementById('android-special-0').children[0].click();
                        document.getElementById('android-special-1').style.display = 'none';
                    } else {
                        window.setTimeout(function () {
                            document.getElementsByClassName('local')[0].click();
                        }, 125);
                    }
                    return;
                }
                if (IOS) {
                    el = document.getElementById('ios');
                    el.style.display = 'block';
                    el.appendChild(document.getElementById('ios-content').cloneNode(true));
                    window.location.href = 'ofoShareBicycleForIOSApp://';
                    window.setTimeout(function () {
                        document.getElementsByClassName('appstore')[0].click();
                    }, 125);
                    return;
                }
                document.getElementById('default').style.display = 'block';
            });
        })();
