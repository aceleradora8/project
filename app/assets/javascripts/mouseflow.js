var MOUSEFLOW = MOUSEFLOW || {}

MOUSEFLOW.callMouseFlow = function callMouseFlow() {
  var _mfq = _mfq || [];
  (function() {
    var mf = document.createElement("script");
    mf.type = "text/javascript"; mf.async = true;
    mf.src = "//cdn.mouseflow.com/projects/f0ecd1de-8887-42b6-b2fc-7089a6e20299.js";
    document.getElementsByTagName("head")[0].appendChild(mf);
  })();
}