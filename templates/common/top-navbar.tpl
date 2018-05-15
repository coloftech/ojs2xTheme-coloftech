{**
 * templates/common/top-navbar.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 *
 * Top Navigation Bar
 *
 *}
<div id="top-navbar">
	<div class="container">
		<div id="social-icons" class="pull-right">
			<ul class="menu">	
				
				<li id="userHomeMenu"><a href="{url journal="index" page="index" op="index"}"><i class="fa fa-home"></i>Publisher Home</a></li> 
				{if $isUserLoggedIn}
					<li id="userHomeMenu"><a href="{url journal="index" page="user"}"><i class="fa fa-dashboard"></i>{translate key="navigation.dashboard"}</a></li> 
					<li id="userProfileMenu"><a href="{url page="user" op="profile"}"><span class="fa fa-user"></span>{translate key="navigation.profile"}</a></li> 
					<li id="logoutMenu"><a href="{url page="login" op="signOut"}"><i class="fa fa-sign-out"></i>{translate key="navigation.logout"}</a></li>
				{else}
					<li id="loginMenu"><a href="{url page="login"}"><span class="fa fa-user"></span>{translate key="navigation.login"}</a></li> 
					{if !$hideRegisterLink}
						<li id="registerMenu">
<a href="{url page="user" op="register"}"><i class="fa fa-key"></i>{translate key="navigation.register"}</a></li>
					{/if}
				{/if}
			</ul>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
