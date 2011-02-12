$(document).ready(function() {
    $('#upload_submit').live('click', function(){
        $('#upload_submit').attr('value', $('#upload_submit').attr('data-disable-with') );
        $('#upload_submit').attr('disabled', "true");       
        $('#notice').hide();
        
        // add parameters to try_another link
        $('#try_another a').attr('href', function(index, href){
            var upload_name = $('#upload_name').val();
            var upload_email = $('#upload_email').val();
            var param = "email=" + encodeURIComponent(upload_email) + "&name=" + encodeURIComponent(upload_name);
        
            if (href.charAt(href.length - 1) === '?') //Very unlikely
                return href + param;
            else if (href.indexOf('?') > 0)
                return href + '&' + param;
            else
                return href + '?' + param;            
        });
        
        $('#try_another').show(4000);
        $('#upload_form').submit();
    });
    

 });
