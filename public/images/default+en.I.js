(function() {
var _UDS_CONST_LOCALE = 'en';
var _UDS_CONST_SHORT_DATE_PATTERN = 'MDY'; 
var _UDS_MSG_SEARCHER_IMAGE = ('Image'); 
var _UDS_MSG_SEARCHER_WEB = ('Web'); 
var _UDS_MSG_SEARCHER_BLOG = ('Blog'); 
var _UDS_MSG_SEARCHER_VIDEO = ('Video'); 
var _UDS_MSG_SEARCHER_LOCAL = ('Local'); 
var _UDS_MSG_SEARCHCONTROL_SAVE = ('save'); 
var _UDS_MSG_SEARCHCONTROL_KEEP = ('keep'); 
var _UDS_MSG_SEARCHCONTROL_INCLUDE = ('include'); 
var _UDS_MSG_SEARCHCONTROL_COPY = ('copy'); 
var _UDS_MSG_SEARCHCONTROL_CLOSE = ('close'); 
var _UDS_MSG_SEARCHCONTROL_SPONSORED_LINKS = ('Sponsored Links'); 
var _UDS_MSG_SEARCHCONTROL_SEE_MORE = ('see more...'); 
var _UDS_MSG_SEARCHCONTROL_WATERMARK = ('clipped from Google'); 
var _UDS_MSG_SEARCHER_CONFIG_SET_LOCATION = ('Search location'); 
var _UDS_MSG_SEARCHER_CONFIG_DISABLE_ADDRESS_LOOKUP = ('Disable address lookup'); 
var _UDS_MSG_SEARCHER_NEWS = ('News'); 
function _UDS_MSG_MINUTES_AGO(AGE_MINUTES_AGO) {return ('' + AGE_MINUTES_AGO + ' minutes ago');} 
var _UDS_MSG_ONE_HOUR_AGO = ('1 hour ago'); 
function _UDS_MSG_HOURS_AGO(AGE_HOURS_AGO) {return ('' + AGE_HOURS_AGO + ' hours ago');} 
function _UDS_MSG_NEWS_ALL_N_RELATED(NUMBER) {return ('all ' + NUMBER + ' related');} 
var _UDS_MSG_NEWS_RELATED = ('Related Articles'); 
var _UDS_MSG_BRANDING_STRING = ('powered by Google'); 
var _UDS_MSG_SORT_BY_DATE = ('Sort by date'); 
var _UDS_MSG_MONTH_ABBR_JAN = ('Jan'); 
var _UDS_MSG_MONTH_ABBR_FEB = ('Feb'); 
var _UDS_MSG_MONTH_ABBR_MAR = ('Mar'); 
var _UDS_MSG_MONTH_ABBR_APR = ('Apr'); 
var _UDS_MSG_MONTH_ABBR_MAY = ('May'); 
var _UDS_MSG_MONTH_ABBR_JUN = ('Jun'); 
var _UDS_MSG_MONTH_ABBR_JUL = ('Jul'); 
var _UDS_MSG_MONTH_ABBR_AUG = ('Aug'); 
var _UDS_MSG_MONTH_ABBR_SEP = ('Sep'); 
var _UDS_MSG_MONTH_ABBR_OCT = ('Oct'); 
var _UDS_MSG_MONTH_ABBR_NOV = ('Nov'); 
var _UDS_MSG_MONTH_ABBR_DEC = ('Dec'); 
var _UDS_MSG_DIRECTIONS = ('directions'); 
var _UDS_MSG_CLEAR_RESULTS = ('clear results'); 
var _UDS_MSG_SHOW_ONE_RESULT = ('show one result'); 
var _UDS_MSG_SHOW_MORE_RESULTS = ('show more results'); 
var _UDS_MSG_SHOW_ALL_RESULTS = ('show all results'); 
var _UDS_MSG_SETTINGS = ('settings'); 
var _UDS_MSG_SEARCH = ('search'); 
var _UDS_MSG_SEARCH_UC = ('Search'); 
var _UDS_MSG_POWERED_BY = ('powered by'); 
function _UDS_MSG_LOCAL_ATTRIBUTION(LOCAL_RESULTS_PROVIDER) {return ('Business listings provided by ' + LOCAL_RESULTS_PROVIDER + '');} 
var _UDS_MSG_SEARCHER_BOOK = ('Book'); 
function _UDS_MSG_FOUND_ON_PAGE(FOUND_ON_PAGE) {return ('Page ' + FOUND_ON_PAGE + '');} 
function _UDS_MSG_TOTAL_PAGE_COUNT(PAGE_COUNT) {return ('' + PAGE_COUNT + ' pages');} 
var _UDS_MSG_SEARCHER_BY = ('by'); 
var _UDS_MSG_SEARCHER_CODE = ('Code'); 
var _UDS_MSG_UNKNOWN_LICENSE = ('Unknown License'); 
var _UDS_MSG_SEARCHER_GSA = ('Search Appliance'); 
var _UDS_MSG_SEARCHCONTROL_MORERESULTS = ('More results'); 
var _UDS_MSG_SEARCHCONTROL_PREVIOUS = ('Previous'); 
var _UDS_MSG_SEARCHCONTROL_NEXT = ('Next'); 
var _UDS_MSG_GET_DIRECTIONS = ('Get directions'); 
var _UDS_MSG_GET_DIRECTIONS_TO_HERE = ('To here'); 
var _UDS_MSG_GET_DIRECTIONS_FROM_HERE = ('From here'); 
var _UDS_MSG_CLEAR_RESULTS_UC = ('Clear results'); 
var _UDS_MSG_SEARCH_THE_MAP = ('search the map'); 
var _UDS_MSG_SCROLL_THROUGH_RESULTS = ('scroll through results'); 
var _UDS_MSG_EDIT_TAGS = ('edit tags'); 
var _UDS_MSG_TAG_THIS_SEARCH = ('tag this search'); 
var _UDS_MSG_SEARCH_STRING = ('search string'); 
var _UDS_MSG_OPTIONAL_LABEL = ('optional label'); 
var _UDS_MSG_DELETE = ('delete'); 
var _UDS_MSG_DELETED = ('deleted'); 
var _UDS_MSG_CANCEL = ('cancel'); 
var _UDS_MSG_UPLOAD_YOUR_VIDEOS = ('upload your own video'); 
var _UDS_MSG_IM_DONE_WATCHING = ('i\047m done watching this'); 
var _UDS_MSG_CLOSE_VIDEO_PLAYER = ('close video player'); 
var _UDS_MSG_NO_RESULTS = ('No Results'); 
var _UDS_MSG_LINKEDCSE_ERROR_RESULTS = ('This Custom Search Engine is loading. Try again in a few seconds.'); 
var _UDS_MSG_COUPONS = ('Coupons'); 
var _UDS_MSG_BACK = ('back'); 
var _UDS_MSG_SUBSCRIBE = ('Subscribe'); 
var _UDS_MSG_SEARCHER_PATENT = ('Patent'); 
var _UDS_MSG_USPAT = ('US Pat.'); 
var _UDS_MSG_USPAT_APP = ('US Pat. App'); 
var _UDS_MSG_PATENT_FILED = ('Filed'); 
var _UDS_MSG_ADS_BY_GOOGLE = ('Ads by Google'); 
var _UDS_MSG_SET_DEFAULT_LOCATION = ('Set default location'); 
var _UDS_MSG_NEWSCAT_TOPSTORIES = ('Top Stories'); 
var _UDS_MSG_NEWSCAT_WORLD = ('World'); 
var _UDS_MSG_NEWSCAT_NATION = ('Nation'); 
var _UDS_MSG_NEWSCAT_BUSINESS = ('Business'); 
var _UDS_MSG_NEWSCAT_SCITECH = ('Sci/Tech'); 
var _UDS_MSG_NEWSCAT_ENTERTAINMENT = ('Entertainment'); 
var _UDS_MSG_NEWSCAT_HEALTH = ('Health'); 
var _UDS_MSG_NEWSCAT_SPORTS = ('Sports'); 
var _UDS_MSG_NEWSCAT_POLITICS = ('Politics');
var d=true,g=null,h=encodeURIComponent,j=google_exportSymbol,l=window,m=navigator,n=document,o="appendChild",p="push",q="status",r="createElement",s="ServiceBase",t="length",u="language",v="style",w="loader",x={};x.blank="&nbsp;";x.image=_UDS_MSG_SEARCHER_IMAGE;x.web=_UDS_MSG_SEARCHER_WEB;x.blog=_UDS_MSG_SEARCHER_BLOG;x.video=_UDS_MSG_SEARCHER_VIDEO;x.local=_UDS_MSG_SEARCHER_LOCAL;x.news=_UDS_MSG_SEARCHER_NEWS;x.book=_UDS_MSG_SEARCHER_BOOK;x.patent="Patent";x["ads-by-google"]=_UDS_MSG_ADS_BY_GOOGLE;
x.cse="Custom Search Control";x.save=_UDS_MSG_SEARCHCONTROL_SAVE;x.keep=_UDS_MSG_SEARCHCONTROL_KEEP;x.include=_UDS_MSG_SEARCHCONTROL_INCLUDE;x.copy=_UDS_MSG_SEARCHCONTROL_COPY;x.close=_UDS_MSG_SEARCHCONTROL_CLOSE;x["sponsored-links"]=_UDS_MSG_SEARCHCONTROL_SPONSORED_LINKS;x["see-more"]=_UDS_MSG_SEARCHCONTROL_SEE_MORE;x.watermark=_UDS_MSG_SEARCHCONTROL_WATERMARK;x["search-location"]=_UDS_MSG_SEARCHER_CONFIG_SET_LOCATION;x["disable-address-lookup"]=_UDS_MSG_SEARCHER_CONFIG_DISABLE_ADDRESS_LOOKUP;
x["sort-by-date"]=_UDS_MSG_SORT_BY_DATE;x.pbg=_UDS_MSG_BRANDING_STRING;x["n-minutes-ago"]=_UDS_MSG_MINUTES_AGO;x["n-hours-ago"]=_UDS_MSG_HOURS_AGO;x["one-hour-ago"]=_UDS_MSG_ONE_HOUR_AGO;x["all-n-related"]=_UDS_MSG_NEWS_ALL_N_RELATED;x["related-articles"]=_UDS_MSG_NEWS_RELATED;x["page-count"]=_UDS_MSG_TOTAL_PAGE_COUNT;var y=[];y[0]=_UDS_MSG_MONTH_ABBR_JAN;y[1]=_UDS_MSG_MONTH_ABBR_FEB;y[2]=_UDS_MSG_MONTH_ABBR_MAR;y[3]=_UDS_MSG_MONTH_ABBR_APR;y[4]=_UDS_MSG_MONTH_ABBR_MAY;y[5]=_UDS_MSG_MONTH_ABBR_JUN;
y[6]=_UDS_MSG_MONTH_ABBR_JUL;y[7]=_UDS_MSG_MONTH_ABBR_AUG;y[8]=_UDS_MSG_MONTH_ABBR_SEP;y[9]=_UDS_MSG_MONTH_ABBR_OCT;y[10]=_UDS_MSG_MONTH_ABBR_NOV;y[11]=_UDS_MSG_MONTH_ABBR_DEC;x["month-abbr"]=y;x.directions=_UDS_MSG_DIRECTIONS;x["clear-results"]=_UDS_MSG_CLEAR_RESULTS;x["show-one-result"]=_UDS_MSG_SHOW_ONE_RESULT;x["show-more-results"]=_UDS_MSG_SHOW_MORE_RESULTS;x["show-all-results"]=_UDS_MSG_SHOW_ALL_RESULTS;x.settings=_UDS_MSG_SETTINGS;x.search=_UDS_MSG_SEARCH;x["search-uc"]=_UDS_MSG_SEARCH_UC;
x["powered-by"]=_UDS_MSG_POWERED_BY;x.sa=_UDS_MSG_SEARCHER_GSA;x.by=_UDS_MSG_SEARCHER_BY;x.code=_UDS_MSG_SEARCHER_CODE;x["unknown-license"]=_UDS_MSG_UNKNOWN_LICENSE;x["more-results"]=_UDS_MSG_SEARCHCONTROL_MORERESULTS;x.previous=_UDS_MSG_SEARCHCONTROL_PREVIOUS;x.next=_UDS_MSG_SEARCHCONTROL_NEXT;x["get-directions"]=_UDS_MSG_GET_DIRECTIONS;x["to-here"]=_UDS_MSG_GET_DIRECTIONS_TO_HERE;x["from-here"]=_UDS_MSG_GET_DIRECTIONS_FROM_HERE;x["clear-results-uc"]=_UDS_MSG_CLEAR_RESULTS_UC;
x["search-the-map"]=_UDS_MSG_SEARCH_THE_MAP;x["scroll-results"]=_UDS_MSG_SCROLL_THROUGH_RESULTS;x["edit-tags"]=_UDS_MSG_EDIT_TAGS;x["tag-search"]=_UDS_MSG_TAG_THIS_SEARCH;x["search-string"]=_UDS_MSG_SEARCH_STRING;x["optional-label"]=_UDS_MSG_OPTIONAL_LABEL;x["delete"]=_UDS_MSG_DELETE;x.deleted=_UDS_MSG_DELETED;x.cancel=_UDS_MSG_CANCEL;x["upload-video"]=_UDS_MSG_UPLOAD_YOUR_VIDEOS;x["im-done"]=_UDS_MSG_IM_DONE_WATCHING;x["close-player"]=_UDS_MSG_CLOSE_VIDEO_PLAYER;x["no-results"]=_UDS_MSG_NO_RESULTS;
x["linked-cse-error-results"]=_UDS_MSG_LINKEDCSE_ERROR_RESULTS;x.back=_UDS_MSG_BACK;x.subscribe=_UDS_MSG_SUBSCRIBE;x["us-pat"]="US Pat.";x["us-pat-app"]="US Pat. App";x["us-pat-filed"]="Filed";var _json_cache_defeater_=(new Date).getTime(),_json_request_require_prep=d;function z(a,c){var b;if(b=A("msie"))b="msie 6.0"in B?B["msie 6.0"]:B["msie 6.0"]=m.appVersion.toLowerCase().indexOf("msie 6.0")!=-1;b?l.setTimeout(C(this,D,[a,c]),0):D(a,c)}
function D(a,c){var b=n.getElementsByTagName("head")[0];b||(b=n.body.parentNode[o](n[r]("head")));var e=n[r]("script");e.type="text/javascript";e.charset="utf-8";var f=_json_request_require_prep?a+"&key="+google[w].ApiKey+"&v="+c:a;if(A("msie")||A("safari")||A("konqueror"))f=f+"&nocache="+_json_cache_defeater_++;e.src=f;var i=function(){e.onload=g;e.parentNode.removeChild(e);delete e};f=function(k){k=(k?k:l.event).target?(k?k:l.event).target:(k?k:l.event).srcElement;if(k.readyState=="loaded"||k.readyState==
"complete"){k.onreadystatechange=g;i()}};if(m.product=="Gecko")e.onload=i;else e.onreadystatechange=f;b[o](e)}function C(a,c,b){return function(){return c.apply(a,b)}}function A(a){if(a in E)return E[a];return E[a]=m.userAgent.toLowerCase().indexOf(a)!=-1}var E={},B={},F,G;if(l.n){F=d;if(l.XMLHttpRequest)G=d};if(!H)var H=j;if(!I)var I=google_exportProperty;
google[u].d={AFRIKAANS:"af",ALBANIAN:"sq",AMHARIC:"am",ARABIC:"ar",ARMENIAN:"hy",AZERBAIJANI:"az",BASQUE:"eu",BELARUSIAN:"be",BENGALI:"bn",BIHARI:"bh",BULGARIAN:"bg",BURMESE:"my",BRETON:"br",CATALAN:"ca",CHEROKEE:"chr",CHINESE:"zh",CHINESE_SIMPLIFIED:"zh-CN",CHINESE_TRADITIONAL:"zh-TW",CORSICAN:"co",CROATIAN:"hr",CZECH:"cs",DANISH:"da",DHIVEHI:"dv",DUTCH:"nl",ENGLISH:"en",ESPERANTO:"eo",ESTONIAN:"et",FAROESE:"fo",FILIPINO:"tl",FINNISH:"fi",FRENCH:"fr",FRISIAN:"fy",GALICIAN:"gl",GEORGIAN:"ka",GERMAN:"de",
GREEK:"el",GUJARATI:"gu",HAITIAN_CREOLE:"ht",HEBREW:"iw",HINDI:"hi",HUNGARIAN:"hu",ICELANDIC:"is",INDONESIAN:"id",INUKTITUT:"iu",IRISH:"ga",ITALIAN:"it",JAPANESE:"ja",JAVANESE:"jw",KANNADA:"kn",KAZAKH:"kk",KHMER:"km",KOREAN:"ko",KURDISH:"ku",KYRGYZ:"ky",LAO:"lo",LAOTHIAN:"lo",LATIN:"la",LATVIAN:"lv",LITHUANIAN:"lt",LUXEMBOURGISH:"lb",MACEDONIAN:"mk",MALAY:"ms",MALAYALAM:"ml",MALTESE:"mt",MAORI:"mi",MARATHI:"mr",MONGOLIAN:"mn",NEPALI:"ne",NORWEGIAN:"no",OCCITAN:"oc",ORIYA:"or",PASHTO:"ps",PERSIAN:"fa",
POLISH:"pl",PORTUGUESE:"pt",PORTUGUESE_PORTUGAL:"pt-PT",PUNJABI:"pa",QUECHUA:"qu",ROMANIAN:"ro",RUSSIAN:"ru",SANSKRIT:"sa",SCOTS_GAELIC:"gd",SERBIAN:"sr",SINDHI:"sd",SINHALESE:"si",SLOVAK:"sk",SLOVENIAN:"sl",SPANISH:"es",SUNDANESE:"su",SWAHILI:"sw",SWEDISH:"sv",SYRIAC:"syr",TAJIK:"tg",TAMIL:"ta",TAGALOG:"tl",TATAR:"tt",TELUGU:"te",THAI:"th",TIBETAN:"bo",TONGA:"to",TURKISH:"tr",UKRAINIAN:"uk",URDU:"ur",UZBEK:"uz",UIGHUR:"ug",VIETNAMESE:"vi",WELSH:"cy",YIDDISH:"yi",YORUBA:"yo",UNKNOWN:""};
H("google.language.Languages",google[u].d);
var J={AMHARIC:"am",ARMENIAN:"hy",AZERBAIJANI:"az",BASQUE:"eu",BENGALI:"bn",BIHARI:"bh",BRETON:"br",BURMESE:"my",CHEROKEE:"chr",CORSICAN:"co",DHIVEHI:"dv",ESPERANTO:"eo",FAROESE:"fo",FRISIAN:"fy",GEORGIAN:"ka",GUJARATI:"gu",INUKTITUT:"iu",JAVANESE:"jw",KANNADA:"kn",KAZAKH:"kk",KHMER:"km",KURDISH:"ku",KYRGYZ:"ky",LAO:"lo",LAOTHIAN:"lo",LATIN:"la",LUXEMBOURGISH:"lb",MALAYALAM:"ml",MAORI:"mi",MARATHI:"mr",MONGOLIAN:"mn",NEPALI:"ne",OCCITAN:"oc",ORIYA:"or",PASHTO:"ps",PUNJABI:"pa",QUECHUA:"qu",SANSKRIT:"sa",
SCOTS_GAELIC:"gd",SINDHI:"sd",SINHALESE:"si",SUNDANESE:"su",SYRIAC:"syr",TAJIK:"tg",TAMIL:"ta",TATAR:"tt",TELUGU:"te",TIBETAN:"bo",TONGA:"to",UIGHUR:"ug",URDU:"ur",UZBEK:"uz",YORUBA:"yo"},K={},L={},M=100;function N(a,c){var b="id"+M++;L[b]=function(e){e=c(e);a(e);delete L[b]};return"google.language.callbacks."+b}function O(a,c){var b="id"+M++;L[b]=function(e,f,i,k,U){e=c(e,f,i,k,U);a(e);delete L[b]};return"google.language.callbacks."+b}google[u].k=function(a){return K[a]};
H("google.language.isTranslatable",google[u].k);var P;for(P in google[u].d)K[google[u].d[P]]=d;for(P in J)K[J[P]]=false;j("google.language.callbacks",L);
j("google.language.getBranding",function(a,c){var b="horizontal";if(c&&c.type)b=c.orientation;var e=x["powered-by"],f=google[w][s]+"/css/small-logo"+(F&&!G?".gif":".png"),i=['<div style="font-family:arial,sans-serif;','font-size:11px;margin-bottom:1px" class="gBrandingText">',e,'</div><div><img src="',f,'"/></div>'];e=['<span style="vertical-align:middle;font-family:arial,sans-serif;','font-size:11px;" class="gBrandingText">',e,'<img style="padding-left:1px;vertical-align:',F?'bottom;" ':'middle;" ',
'src="',f,'"/></span>'];e=b=="horizontal"?e:i;f=e.join("");b=n[r]("div");b.className="gBranding";b[v].color="#676767";if(e==i)b[v].textAlign="center";b.innerHTML=f;if(a){i=g;(i=typeof a=="string"?n.getElementById(a):a)&&i[o]&&i[o](b)}return b});j("google.language.HORIZONTAL_BRANDING","horizontal");j("google.language.VERTICAL_BRANDING","vertical");j("google.language.CurrentLocale",_UDS_CONST_LOCALE);j("google.language.ShortDatePattern",_UDS_CONST_SHORT_DATE_PATTERN);google[u].l=function(a,c,b){c=N(c,Q);var e="http://www.google.com/complete/search";e+="?json=t&jsonp="+c+"&client=uds";if(b)e+="&hl="+h(b);e+="&q="+h(a);a=e;_json_request_require_prep=false;z(a,g);_json_request_require_prep=d};H("google.language.suggest",google[u].l);function Q(a){var c={};c.query=a[0];c.suggestions=[];var b=a[1];a=a[2];for(var e=0;e<b[t];e++){var f={};f.name=b[e];f.count=parseInt(a[e].replace(",",""),10);f.results=a[e];c.suggestions[p](f)}return c};google[u].f={TEXT:"text",HTML:"html"};H("google.language.ContentType",google[u].f);google[u].translate=function(a,c,b,e){var f,i=g;if(typeof a=="string")f=a;else if(a.text&&a.type){f=a.text;i=a.type}else throw"Invalid first argument";if(f[t]<=5120)a=false;else{a=R(g,g,400,"the string to be translated exceeds the maximum length allowed",g);e(a);a=d}if(!a){e=O(e,R);e=google[w][s]+"/Gtranslate?callback="+e;e+="&context=22";e+="&q="+h(f);e+="&langpair="+h(c+"|"+b);if(i)e+="&format="+h(i);z(e,google[u].Version)}};
H("google.language.translate",google[u].translate);function R(a,c,b,e){a={};a.status={code:b};if(e)a[q].message=e;if(b!=200){a.error=a[q];a.translation=""}else{a.translation=c.translatedText;if(c.detectedSourceLanguage)a.detectedSourceLanguage=c.detectedSourceLanguage}return a}google[u].i=function(a,c){var b=O(c,S);b=google[w][s]+"/GlangDetect?callback="+b;b+="&context=22";b+="&q="+h(a);z(b,google[u].Version)};H("google.language.detect",google[u].i);
function S(a,c,b,e){a={};a.status={code:b};if(e)a[q].message=e;if(b!=200){a.error=a[q];a.language=""}else{a.language=c[u];a.isReliable=c.isReliable;a.confidence=c.confidence}return a};var T={"en|am":d,"en|ar":d,"en|bn":d,"en|el":d,"en|fa":d,"en|gu":d,"en|hi":d,"en|kn":d,"en|ml":d,"en|mr":d,"en|ne":d,"en|pa":d,"en|ru":d,"en|sa":d,"en|sr":d,"en|ta":d,"en|te":d,"en|ti":d,"en|ur":d};google[u].m=function(a,c,b,e){if(typeof e!="function")throw"Invalid callback";if(V(a,c,b,e)){e=O(e,W);c=[google[w][s],"/Gtransliterate?callback=",e,"&context=22","&langpair=",h(c+"|"+b)];for(b=0;b<a[t];b++){c[p]("&q=");c[p](h(a[b]))}z(c.join(""),google[u].Version)}};H("google.language.transliterate",google[u].m);
function V(a,c,b,e){var f="";if(typeof a!="object"||!a[t])f="Words needs to be an array.";else if(a[t]<1)f="No words to transliterate.";else if(a[t]>5)f="Number of words to transliterate exceeds the limit of 5";else if(c)if(b)c&&b&&T[c+"|"+b]||(f="Transliteration not supported for the language pair. Source Language - "+c+" Destination Language - "+b+".");else f="Destination language not specified.";else f="Source language not specified.";if(f[t]>0){var i=W(g,g,400,f,g);l.setTimeout(function(){e(i)},
0);return false}return d}function W(a,c,b,e){a={status:{code:b,message:e}};if(b!=200){a.error=a[q];a.transliterations=[]}else a.transliterations=c.transliterations;return a};var X={hi:d,kn:d,ml:d,ta:d,te:d};google[u].c={h:0,g:1,e:2};google[u].j=function(a){a=a.toLowerCase();return a in X?Y(a):google[u].c.e};H("google.language.FontRenderingStatus.SUPPORTED",google[u].c.g);H("google.language.FontRenderingStatus.UNSUPPORTED",google[u].c.h);H("google.language.FontRenderingStatus.UNKNOWN",google[u].c.e);H("google.language.isFontRenderingSupported",google[u].j);
function Y(a){switch(a){case "ml":a=[];var c="\u0d23\u0d4d\u0d23\u0d28\u0d4d\u0d31";a[p]({a:"\u0d23\u0d28\u0d4d\u200d",b:c});c="\u0d23\u0d4d\u0d23\u0d28\u0d4d\u200d\u0d31";a[p]({a:"\u0d23\u0d28\u0d4d\u200d",b:c});return Z(a);case "hi":a="\u0915\u094d\u0930\u0930\u094d\u0925";c="\u0915\u0925";return Z([{a:a,b:c}]);case "kn":a="\u0c95\u0ccd\u0cb2";c="\u0c95";return Z([{a:a,b:c}]);case "te":a="\u0c15\u0c4d\u0c32";c="\u0c15";return Z([{a:a,b:c}]);case "ta":a="\u0b95\u0bcd";c="\u0b95";return Z([{a:a,b:c}])}}
function Z(a){for(var c=0;c<a[t];c++){var b=a[c],e=b.a,f=b.b;b=n[r]("span");b[v].fontSize="10px";var i=b[v];if("opacity"in i)i.opacity=0.1;else if("MozOpacity"in i)i.MozOpacity=0.1;else if("filter"in i)i.filter="alpha(opacity=10)";n.body[o](b);b.innerHTML=e;e=$(b).width;b.innerHTML=f;f=$(b).width;n.body.removeChild(b);if(e==f)return d}return false}
function $(a){if(a[v].display!="none")return{width:a.offsetWidth,height:a.offsetHeight};var c=a[v],b=c.display,e=c.visibility,f=c.position;c.visibility="hidden";c.position="absolute";c.display="";var i=a.offsetWidth;a=a.offsetHeight;c.display=b;c.position=f;c.visibility=e;return{width:i,height:a}};
google.loader.loaded({"module":"language","version":"1.0","components":["default"]});
google.loader.eval.language = function() {eval(arguments[0]);};if (google.loader.eval.scripts && google.loader.eval.scripts['language']) {(function() {var scripts = google.loader.eval.scripts['language'];for (var i = 0; i < scripts.length; i++) {google.loader.eval.language(scripts[i]);}})();google.loader.eval.scripts['language'] = null;}})();