<script type="text/javascript">
	//script/js5.tpl

</script>
<script type="text/javascript">
{literal}
<!--

// Swap the given entries in the select field.
function swapEntries(field, i, j) {
	var tmpLabel = field.options[j].label;
	var tmpVal = field.options[j].value;
	var tmpText = field.options[j].text;
	var tmpSel = field.options[j].selected;
	field.options[j].label = field.options[i].label;
	field.options[j].value = field.options[i].value;
	field.options[j].text = field.options[i].text;
	field.options[j].selected = field.options[i].selected;
	field.options[i].label = tmpLabel;
	field.options[i].value = tmpVal;
	field.options[i].text = tmpText;
	field.options[i].selected = tmpSel;
}

// Move selected items up in the given select list.
function moveUp(field) {
	var i;
	for (i=0; i<field.length; i++) {
		if (field.options[i].selected == true && i>0) {
			swapEntries(field, i-1, i);
		}
	}
}

// Move selected items down in the given select list.
function moveDown(field) {
	var i;
	var max = field.length - 1;
	for (i = max; i >= 0; i=i-1) {
		if(field.options[i].selected == true && i < max) {
			swapEntries(field, i+1, i);
		}
	}
}

// Move selected items from select list a to select list b.
function jumpList(a, b) {
	var i;
	for (i=0; i<a.options.length; i++) {
		if (a.options[i].selected == true) {
			bMax = b.options.length;
			b.options[bMax] = new Option(a.options[i].text);
			b.options[bMax].value = a.options[i].value;
			a.options[i] = null;
			i=i-1;
		}
	}
}

function prepBlockFields() {
	var i;
	var theForm = document.getElementById('setupForm');

	theForm.elements["blockSelectLeft"].value = "";
	for (i=0; i<theForm.blockSelectLeftWidget.options.length; i++) {
		theForm.blockSelectLeft.value += encodeURI(theForm.blockSelectLeftWidget.options[i].value) + " ";
	}

	theForm.blockSelectRight.value = "";
	for (i=0; i<theForm.blockSelectRightWidget.options.length; i++) {
		theForm.blockSelectRight.value += encodeURI(theForm.blockSelectRightWidget.options[i].value) + " ";
	}

	theForm.blockUnselected.value = "";
	for (i=0; i<theForm.blockUnselectedWidget.options.length; i++) {
		theForm.blockUnselected.value += encodeURI(theForm.blockUnselectedWidget.options[i].value) + " ";
	}
	return true;
}

// -->
var activetab = 0;
$('#setupForm').on('submit',function(){
	//alert('Great');

	var data = $(this).serialize();
	//console.log(data);
	var url = {/literal}'{url op="saveSetup" path="5"}';{literal}
	//console.log(url);
				$.ajax({

		      type: 'post',
		      url: url,
		      data: data,
		      dataType:'html',
		      success: function (resp) {
		      	//alert('Settings Updated.');
				var notification = get_notifications();

		      	activetab++;
		      	$('.tab-'+activetab).click();	
		      		//return false;						
		      },
		      onerror: function(error){
		      	alert('Unknown error occured.');
		      }
			});
	return false;
});

function get_notifications() {
	// body...
	$.get('http://bisu.journal/index.php/jaanrs/notification/fetchNotification', null,
					function(data){
						var notifications = data.content;
						var i, l;
						console.log(data);
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

{/literal}
</script>