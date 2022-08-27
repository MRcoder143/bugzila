import $ from 'jquery'

$(document).ready(function(){


  $('#bug_bugtype').on('change',function(){
    var type = $(this).val();
    var status = $("bug_status").val();
    if(type == "feature" ){

      $('#bug_status').html("<option value='new'>New</option><option value='started'>Started</option><option value='completed'>Complted</option>");

    }
    else if(type=="bug"){

      $('#bug_status').html("<option value='new'>New</option><option value='started'>Started</option><option value='resolved'>Resolved</option>");

    }
    else {

      alert("please select bug type");
    }

  });






});
