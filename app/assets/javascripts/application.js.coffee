# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
# vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file. JavaScript code in this file should be added after the last require_* statement.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require rails-ujs
#= require turbolinks
#= require jquery
#= require moment
#= require bootstrap-datetimepicker
#= require_tree .
# $(document).ready(function() {
#     $('.weekday').datetimepicker({
#         format: "YYYY/MM/DD",
#         autoclose: 'true',
#         pickTime: false,
#         icons: {
#             previous: "fa fa-arrow-left",
#             next: "fa fa-arrow-right"
#         } ,
#         beforeShowDay : function(date){
#             var disableDate = [(date.getDay() != 0 && date.getDay() != 6)];
#             return disableData;
#         }
#     }, false);
#     $('input[type=reservation_date]').datetimepicker({
#         format: "YYYY/MM/DD",
#         autoclose: 'true',
#         pickTime: false,
#         icons: {
#             previous: "fa fa-arrow-left",
#             next: "fa fa-arrow-right"
#         } ,
#         beforeShowDay : function(date){
#             var disableDate = [date.getDay() == 6];
#             return disableData;
#         }
#     }, false);
# });
# var button = document.getElementsByClassName("radio_button")
# button.addEventListener('click', function() {
#     if(select_datetime[0]) {
#         $('firstBlock').style.display = "";
#         $('secondBlock').style.display = "none";
#     } else if(select_datetime[1]) {
#         $('.firstBlock').style.display = "none";
#         $('.secondBlock').style.display = "";
#     }
# }, false);
# window.onload = selectBlock;
$(document).on 'ready page:load', ->
  console.log 'ready and load'
