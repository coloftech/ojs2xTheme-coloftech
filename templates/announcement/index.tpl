{**
 * lib/pkp/templates/announcement/index.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2000-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of announcements.
 *
 *}
{strip}
{assign var="pageTitle" value="announcement.announcements"}
{assign var="pageId" value="announcement.announcements"}
{include file="common/header.tpl"}
{/strip}

<div id="announcementList">
<div class="announcements">
{if $announcementsIntroduction|nl2br != null}
	<div class="intro">{$announcementsIntroduction|nl2br}</div>
{/if}
{iterate from=announcements item=announcement}
	<div class="well">
		{if $announcement->getTypeId()}
			<div class="title"><h4>{$announcement->getAnnouncementTypeName()|escape}: {$announcement->getLocalizedTitle()|escape}</h4></div>
		{else}
			<div class="title"><h4>{$announcement->getLocalizedTitle()|escape}</h4></div>
		{/if}
		
			<div class="description">{$announcement->getLocalizedDescriptionShort()|nl2br}</div>
		
		<div class="details">
			<div class="pull-left posted">{translate key="announcement.posted"}: {$announcement->getDatePosted()}</div>
			{if $announcement->getLocalizedDescription() != null}
				<div class="pull-right more"><a class="btn btn-default" href="{url op="view" path=$announcement->getId()}">{translate key="announcement.viewLink"} <i class="fa fa-arrow-right"></i></a></div>
			{/if}
			<div class="clearfix"></div>
		</div>
		<div class="{if $announcements->eof()}end{/if}separator"></div>
	</div>
{/iterate}
{if $announcements->wasEmpty()}
	<div class="well">
		<div class="nodata">{translate key="announcement.noneExist"}</div>
		<div class="endseparator">&nbsp;</div>
	</div>
{else}
	<div class="pageination">
		<div align="left">{page_info iterator=$announcements}</div>
		<div align="right">{page_links anchor="announcements" name="announcements" iterator=$announcements}</div>
	</div>
{/if}
</div>
</div>

{include file="common/footer.tpl"}
