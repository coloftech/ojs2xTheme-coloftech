{**
 * templates/index/journal.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Journal index page.
 *
 *}

{assign var="isHome" value=false}
{if $journalDescription || $homepageImage || $additionalHomeContent}
    {assign var="isHome" value=true}
{/if}

{assign var="isPublishingMode" value=false}
{if $issue && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
    {assign var="isPublishingMode" value=true}
{/if}

{strip}
{assign var="pageTitleTranslated" value=$siteTitle}
{include file="theme:public/common/header.tpl"}
{/strip}

{strip}
{assign var="pageTitleTranslated" value=$siteTitle}
{include file="common/header.tpl"}
{/strip}

{call_hook name="Templates::Index::journal"}

<ul class="nav nav-tabs" id="indexTab">
  {if $isPublishingMode}
    <li class="active"><a data-toggle="tab" href="#tab-issue">{translate key="plugins.themes.responsiveTheme.current"}</a></li>
  {/if}
  {if $enableAnnouncementsHomepage}
    <li {if !$isHome}class="active"{/if}><a data-toggle="tab" href="#tab-annuncements">{translate key="announcement.announcementsHome"}</a></li>
  {/if}
  {if $isHome}
    <li {if !$isHome}class="active"{/if}><a data-toggle="tab" href="#tab-home">{translate key="plugins.themes.responsiveTheme.aboutJournal"}</a></li>
  {/if}
</ul>

<div class="tab-content">
  {if $isPublishingMode}
    <div class="tab-pane active" id="tab-issue">
        <h3>{$issue->getIssueIdentification()|strip_unsafe_html|nl2br}</h3>
	{include file="issue/view.tpl"}
    </div>
  {/if}
  {if $enableAnnouncementsHomepage}
    <div class="tab-pane" id="tab-annuncements">
        {* Display announcements *}
	<div id="announcements-home">
		<h3>{translate key="announcement.announcementsHome"}</h3>
		{include file="announcement/list.tpl"}	
		<table class="announcementsMore">
			<tr>
				<td><a href="{url page="announcement"}">{translate key="announcement.moreAnnouncements"}</a></td>
			</tr>
		</table>
	</div>
    </div>
  {/if} 
  {if $isHome}
    <div id="tab-home" class="tab-pane">
      {if $journalDescription}
	<div id="journalDescription">{$journalDescription}</div>
      {/if}
      {if $homepageImage}
        <div id="homepageImage"><img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" width="{$homepageImage.width|escape}" height="{$homepageImage.height|escape}" {if $homepageImageAltText != ''}alt="{$homepageImageAltText|escape}"{else}alt="{translate key="common.journalHomepageImage.altText"}"{/if} /></div>
      {/if}
      {if $additionalHomeContent}
        <div id="additionalHomeContent">{$additionalHomeContent}</div>
      {/if}       
    </div>
  {/if}
</div>

{include file="common/footer.tpl"}

