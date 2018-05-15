{**
 * templates/about/editorialTeamBio.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * View the biography of an editorial team member.
 *
 *}

{assign var=pageTitleTranslated value=$user->getFullName()|escape}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}

<div id="container">

<div id="header">
<div id="headerTitle">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title">{translate key="about.editorialTeam"}</h4>
</div>
</div>
</div>

<div id="body">
<div id="top"></div>

<div id="main">

<div id="profilePicContent" style="float: right;">
	{assign var="profileImage" value=$user->getSetting('profileImage')}
	{if $profileImage}
		<img height="{$profileImage.height|escape}" width="{$profileImage.width|escape}" alt="{translate key="user.profile.profileImage"}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
	{/if}
</div>

<div id="mainContent">
<h3>{$pageTitleTranslated}</h3>

<div id="content">
<p>
	<em>{$user->getFullName()|escape}</em>
	{if $publishEmail}
		{assign_mailto var=address address=$user->getEmail()|escape}
		{icon name="mail" url=$address}
	{/if}
	<br />
	{if $user->getUrl()}<a href="{$user->getUrl()|escape:"quotes"}" target="_new">{$user->getUrl()|escape}</a><br/>{/if}
	{if $user->getLocalizedAffiliation()}{$user->getLocalizedAffiliation()|escape}{assign var=needsComma value=1}{/if}{if $country}{if $needsComma}, {/if}{$country|escape}{/if}
</p>

<p>{$user->getLocalizedBiography()|nl2br|strip_unsafe_html}</p>

</div><!-- content -->
</div><!-- mainContent -->
</div><!-- main -->
<div class="modal-footer">
	<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
</div>
</div><!-- body -->
</div><!-- container -->