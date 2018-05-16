<script type="text/javascript">
	//script/js2.tpl
{literal}
	var activetab = 0;

$(function(){

  $('#changetabbutton').click(function(e){
    e.preventDefault();
   
    	var next_tab = $('.nav-tabs > .active').next('li').find('a');
    	
	    if(next_tab.length>0){
	      next_tab.trigger('click');
	    }else{
	      $('.nav-tabs li:eq(0) a').trigger('click');
	    }
	    activetab++;
    
    
    
  });
});
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
	$('.btn-save').removeClass('hidden');
	$('#changetabbutton').addClass('hidden');

	activetab = 6;
});
{/literal}
</script>