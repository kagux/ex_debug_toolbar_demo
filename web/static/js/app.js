import $ from "jquery";

window.jQuery = $;
window.$ = $;

$.fn.test = function() {
 $(this).html('It works!');
}

$('#test').test();
