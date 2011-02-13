$(document).ready(function() {
    $('#upload_submit').live('click', function(){
        $('#upload_submit').attr('value', $('#upload_submit').attr('data-disable-with') );
        $('#upload_submit').attr('disabled', "true");       
        $('#notice').hide();
        $('#errors').hide();
        
        // add parameters to try_another link
        $('#try_another a').attr('href', function(index, href){
            var upload_name = $('#upload_name').val();
            var upload_email = $('#upload_email').val();
            var upload_organization = $('#upload_organization').val();
            var param = "email=" + encodeURIComponent(upload_email) + "&name=" + encodeURIComponent(upload_name)  + "&organization=" + encodeURIComponent(upload_organization);
        
            if (href.charAt(href.length - 1) === '?') //Very unlikely
                return href + param;
            else if (href.indexOf('?') > 0)
                return href + '&' + param;
            else
                return href + '?' + param;            
        });
        
        $('#try_another').show(4000);
        _gaq.push(['_trackEvent', 'upload', 'submit']);
        $('#upload_form').submit();
    });
    
    $('#upload_csv').live('click', function(){
        _gaq.push(['_trackEvent', 'upload', 'csv']);       
    });
    $('#try_another a').live('click', function(){
        _gaq.push(['_trackEvent', 'upload', 'try_another']);       
    });
    

 });
