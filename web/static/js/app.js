import "phoenix_html";
import $ from "jquery";
window.jQuery = $;
window.$ = $;
window.jQuery.app = true

const render = function() {
  window.$('#test').test();
}

const test = function() {
  const $ = window.jQuery;
  $.fn.test = function() {
    const msg = $.app? 'It works!' : "Doesn't work, jquery in app is using toolbar's package";
    $(this).html(msg);
  }

  console.log("plugin defined");
  render();
}

setTimeout(test, 1000);
