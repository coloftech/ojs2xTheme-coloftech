{**
 * lib/pkp/templates/announcement/list.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2000-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of announcements without site header or footer.
 *
 *}
<div class="announcements">


{counter start=1 skip=1 assign="count"}
{iterate from=announcements item=announcement}
	{if !$numAnnouncementsHomepage || $count <= $numAnnouncementsHomepage}
	<div class="well">
		{if $announcement->getTypeId()}
			<div class="title"><h4><a href="{url page="announcement" op="view" path=$announcement->getId()}">{$announcement->getAnnouncementTypeName()|escape}: {$announcement->getLocalizedTitle()|escape}</a></h4></div>
		{else}
			<div class="title"><h4><a href="{url page="announcement" op="view" path=$announcement->getId()}">{$announcement->getLocalizedTitle()|escape}</a></h4></div>
		{/if}
		
			<div class="description">{$announcement->getLocalizedDescriptionShort()|nl2br}</div>
		
		<div class="details">
			<div class="pull-left posted">{translate key="announcement.posted"}: {$announcement->getDatePosted()}</div>
			{if $announcement->getLocalizedDescription() != null}
				<div class="pull-right more"><a class="btn btn-default" href="{url page="announcement" op="view" path=$announcement->getId()}">{translate key="announcement.viewLink"} <i class="fa fa-arrow-right"></i></a></div>
			{/if}
			<div class="clearfix"></div>
		</div>
	</div>
	{/if}
	<div class="{if $announcements->eof()}end{/if}separator"></div>
	{counter}
{/iterate}
{if $announcements->wasEmpty()}
	<div class="well">
		<div class="nodata">{translate key="announcement.noneExist"}</div>
		<div class="endseparator">&nbsp;</div>
	</div>
{/if}
</div>
