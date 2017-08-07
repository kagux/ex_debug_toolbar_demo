import $ from "jquery";
window.jQuery = $;
window.$ = $;

const render = function() {
  window.$('#test').test();
}

const test = function() {
  const $ = window.jQuery;
  $.fn.test = function() {
    $(this).html('It works!');
  }

  console.log("plugin defined");
  render();
}

setTimeout(test, 500);
