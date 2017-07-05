/**
 * 
 */
function showTip(data, success) {
    $('.tip').text(data);
    $('.tip').css("display","block");
    
    $('.tip').removeClass('alert alert-success alert-warning');
    if(success){
    	$('.tip').addClass('alert alert-success');
    } else {
    	$('.tip').addClass('alert alert-warning');
    }
    setTimeout("$('.tip').css('display','none');",2000);
}