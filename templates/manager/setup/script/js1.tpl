{literal}
<script type="text/javascript">
	//script/js1.tpl

</script>
<script type="text/javascript">
	var activetab = 0;
$('#setupForm').on('submit',function(e){
	e.preventDefault();
	var data = $(this).serialize();

	var url = {/literal}'{url op="saveSetup" path="1"}';{literal}
				$.ajax({

		      type: 'post',
		      url: url,
		      data: data,
		      dataType:'html',
		      success: function (resp) {
		      		get_notifications();		     
		      	
					$('.btn-save').addClass('hidden');
					$('#changetabbutton').removeClass('hidden');

		    		$('.tab-0').trigger('click');	
		      	return false;						
		      },
		      onerror: function(error){
		      	alert('Unknown error occured.');
		      }
			});
	return false;
});
$(function(){

  $('#changetabbutton').click(function(e){
    e.preventDefault();
    var is_allowed = checkinput();
    if(is_allowed != false){
    	var next_tab = $('.nav-tabs > .active').next('li').find('a');
    	
	    if(next_tab.length>0){
	      next_tab.trigger('click');
	    }else{
	      $('.nav-tabs li:eq(0) a').trigger('click');
	    }
	    activetab++;
    }
    
    

  });
});

function get_notifications() {
	// body...
	$.get('http://bisu.journal/index.php/jaanrs/notification/fetchNotification', null,
					function(data){
						var notifications = data.content;
						var i, l;
						if (notifications && notifications.general) {
							$.each(notifications.general, function(notificationLevel, notificationList) {
								$.each(notificationList, function(notificationId, notification) {
									console.log(notification.pnotify_text);
									
									$('.has-error').addClass('alert alert-danger').html(notification.pnotify_text);
									
									//
								});
							});
							setTimeout(function(){
							$('.has-error').removeClass('alert alert-success').html('');
							},10000);
							return false;
						}else{
							$('.has-error').removeClass('alert alert-danger').html('');

							$('.has-error').addClass('alert alert-success').html('Setup update successfull.');
							setTimeout(function(){
							$('.has-error').removeClass('alert alert-success').html('');
							},5000);
							return true;
						}
				}, 'json');
}


$('.tab-0').on('click',function(){
	$('.nav-tabs li').removeClass('active');
	$('.tab-pane').removeClass('in active');
	$(this).parent().addClass('active');
	var tab = $(this).attr('href');
	$(tab).addClass('in active');
	activetab = 0;
});

$('.tab-1').on('click',function(){
	$('.nav-tabs li').removeClass('active');
	$('.tab-pane').removeClass('in active');
	$(this).parent().addClass('active');
	var tab = $(this).attr('href');
	$(tab).addClass('in active');
	activetab = 1;
});

$('.tab-2').on('click',function(){
	$('.nav-tabs li').removeClass('active');
	$('.tab-pane').removeClass('in active');
	$(this).parent().addClass('active');
	var tab = $(this).attr('href');
	$(tab).addClass('in active');
	activetab = 2;
});

$('.tab-3').on('click',function(){
	$('.nav-tabs li').removeClass('active');
	$('.tab-pane').removeClass('in active');
	$(this).parent().addClass('active');
	var tab = $(this).attr('href');
	$(tab).addClass('in active');
	activetab = 3;
});

$('.tab-4').on('click',function(){
	$('.nav-tabs li').removeClass('active');
	$('.tab-pane').removeClass('in active');
	$(this).parent().addClass('active');
	var tab = $(this).attr('href');
	$(tab).addClass('in active');

	activetab = 4;
});

$('.tab-5').on('click',function(){
	$('.nav-tabs li').removeClass('active');
	$('.tab-pane').removeClass('in active');
	$(this).parent().addClass('active');
	var tab = $(this).attr('href');
	$(tab).addClass('in active');

	activetab = 5;
});

$('.tab-6').on('click',function(){
	$('.nav-tabs li').removeClass('active');
	$('.tab-pane').removeClass('in active');
	$(this).parent().addClass('active');
	var tab = $(this).attr('href');
	$(tab).addClass('in active');

	activetab = 6;
});

$('.tab-7').on('click',function(){
	$('.nav-tabs li').removeClass('active');
	$('.tab-pane').removeClass('in active');
	$(this).parent().addClass('active');
	var tab = $(this).attr('href');
	$(tab).addClass('in active');

	activetab = 7;


});

$('.tab-8').on('click',function(){
	$('.nav-tabs li').removeClass('active');
	$('.tab-pane').removeClass('in active');
	$(this).parent().addClass('active');
	var tab = $(this).attr('href');
	$(tab).addClass('in active');

	$('.btn-save').removeClass('hidden');
	$('#changetabbutton').addClass('hidden');

	activetab = 8;
});

function checkinput() {
	// body...
	//console.log(activetab);
	//return false;
	var notification = '';
	if(activetab == 0){
		if(($('#title').val() == '') || ($('#initials').val() == '') ){
			notification ='Required * field should not be empty!';
			$('.has-error').addClass('alert alert-danger').html(notification);
			
			return false;
		}
	}else if(activetab == 1){
		if(($('#contactName').val() == '') || ($('#contactEmail').val() == '') ){
			notification ='Required * field should not be empty!';
			$('.has-error').addClass('alert alert-danger').html(notification);
			
			return false;
		}
	
	}else if(activetab == 2){
		if(($('#supportName').val() == '') || ($('#supportEmail').val() == '') ){
			notification ='Required * field should not be empty!';
			$('.has-error').addClass('alert alert-danger').html(notification);
			
			return false;
		}
	}else{
		$('.has-error').removeClass('alert alert-danger');
		return true;
	}

}
</script>
{/literal}