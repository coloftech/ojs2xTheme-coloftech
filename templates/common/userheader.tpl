{strip}
{translate|assign:"applicationName" key="common.openJournalSystems"}
{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{if $pageCrumbTitle}
	{translate|assign:"pageCrumbTitleTranslated" key=$pageCrumbTitle}
{elseif !$pageCrumbTitleTranslated}
	{assign var="pageCrumbTitleTranslated" value=$pageTitleTranslated}
{/if}
{/strip}
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<title>{$pageTitleTranslated}</title>
	<meta name="description" content="{$metaSearchDescription|escape}" />
	<meta name="keywords" content="{$metaSearchKeywords|escape}" />
	<meta name="generator" content="{$applicationName} {$currentVersionString|escape}" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	{$metaCustomHeaders}
	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}
	<!-- Base Jquery -->
	{if $allowCDN}<script type="text/javascript" src="//www.google.com/jsapi"></script>
	<script type="text/javascript">{literal}
		<!--
		// Provide a local fallback if the CDN cannot be reached
		if (typeof google == 'undefined') {
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
		} else {
			google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
			google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
		}
		// -->
	{/literal}</script>
	{else}
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
	{/if}


	<!-- Compiled scripts -->
	{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}

	<script type="text/javascript">{literal}
		<!--
		$(function(){
			fontSize("#sizer", "body", 9, 16, 32, "{/literal}{$basePath|escape:"javascript"}{literal}"); // Initialize the font sizer
		});
		// -->
	{/literal}</script>

	<script type="text/javascript">
		<!--
		// initialise plugins
		{literal}
		$(function(){
			{/literal}{if $validateId}{literal}
			jqueryValidatorI18n("{/literal}{$baseUrl}{literal}", "{/literal}{$currentLocale}{literal}"); // include the appropriate validation localization
			$("form[name={/literal}{$validateId}{literal}]").validate({
				errorClass: "error",
				highlight: function(element, errorClass) {
					$(element).parent().parent().addClass(errorClass);
				},
				unhighlight: function(element, errorClass) {
					$(element).parent().parent().removeClass(errorClass);
				}
			});
			{/literal}{/if}{literal}
			$(".tagit").on('click', function() {
				$(this).find('input').focus();
			});
		});
		// -->
		{/literal}
	</script>

	{if $hasSystemNotifications}
		{url|assign:fetchNotificationUrl page='notification' op='fetchNotification' escape=false}
		<script type="text/javascript">
			$(function(){ldelim}
				$.get('{$fetchNotificationUrl}', null,
					function(data){ldelim}
						var notifications = data.content;
						var i, l;
						if (notifications && notifications.general) {ldelim}
							$.each(notifications.general, function(notificationLevel, notificationList) {ldelim}
								$.each(notificationList, function(notificationId, notification) {ldelim}
									console.log(notification);
									$.pnotify(notification);
								{rdelim});
							{rdelim});
						{rdelim}
				{rdelim}, 'json');
			{rdelim});
		</script>
	{/if}{* hasSystemNotifications *}

	{$additionalHeadData}



	<!-- ResponsiveTheme Template Plugin -->

	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/responsiveTheme/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/responsiveTheme/css/style.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/responsiveTheme/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/responsiveTheme/css/main.css" type="text/css" />

	{foreach from=$stylesheets item=cssUrl}
		<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
	{/foreach}
	
	{$themeHeadData}
	
	<!-- ResponsiveTheme -->
	{literal}
	<script type="text/javascript" src="{/literal}{$baseUrl}{literal}/plugins/themes/responsiveTheme/js/jquery.min.js"></script>
	<script type="text/javascript" src="{/literal}{$baseUrl}{literal}/plugins/themes/responsiveTheme/js/jquery-browser.js"></script>
	<script type="text/javascript">
	//Load the new jQuery locally if it could not be loaded from the CDN
	if (typeof jQuery == 'undefined' || jQuery.fn.jquery != '1.9.1')
	{
	    document.write(unescape("%3Cscript src='{/literal}{$baseUrl|escape:"javascript"}{literal}/plugins/themes/responsiveTheme/js/jquery-1.9.1.min.js' type='text/javascript'%3E%3C/script%3E"));
	}
	</script>
	
	<script type="text/javascript">
	//Ensure the new jQuery doesn't conflict. 
	var jQueryNew = window.jQuery.noConflict(true);
	</script>
	
	<script type="text/javascript" src="{/literal}{$baseUrl}{literal}/plugins/themes/responsiveTheme/js/bootstrap.min.js"></script>
	{/literal}
	{*literal}
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=1505643366421471";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<script>
		!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
	</script>
	<script type="text/javascript">
		(function() {
		  var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
		  po.src = 'https://apis.google.com/js/platform.js';
		  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
		})();
		$(function(){
		    $(".dropdown").hover(            
			    function() {
					$('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
					$(this).toggleClass('open');
					$('b', this).toggleClass("caret caret-up");                
			    },
			    function() {
					$('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
					$(this).toggleClass('open');
					$('b', this).toggleClass("caret caret-up");                
			    });
		});
	</script>
	{*}





	{/literal*}
	<!-- ResponsiveTheme end -->

	{literal}
	<script type="text/javascript">
	$(function () {
  	$('.navbar-toggle-sidebar').click(function () {
  		$('.navbar-nav').toggleClass('slide-in');
  		$('.side-body').toggleClass('body-slide-in');
  		$('#search').removeClass('in').addClass('collapse').slideUp(200);
  	});

  	$('#search-trigger').click(function () {
  		$('.navbar-nav').removeClass('slide-in');
  		$('.side-body').removeClass('body-slide-in');
  		$('.search-input').focus();
  	});
  	});
	</script>
	{/literal}
	
</head>

<body>


{include file="common/usernavbar.tpl"}