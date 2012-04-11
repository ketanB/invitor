// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({
    'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
})

jQuery.fn.submitWithAjax = function() {
    this.submit(function() {
        $.post(this.action, $(this).serialize(), null, "script");
        return false;
    })
    return this;
};

$(document).ready(function() {
//    $("#new_task").submitWithAjax();

    $('a.cloneTask').click(function() {
        $.ajax({
            url: jQuery(this).attr('href'),
            type: 'get',
            dataType: 'script'
        });

        return false;
    });

   $('.toggleUserPanel').click(function() {
       alert('hi');
   });

   
})


function changeLanguage(code)
{
  jQuery('#locale').val(''+code);
  jQuery('#form-tab').submit();
}