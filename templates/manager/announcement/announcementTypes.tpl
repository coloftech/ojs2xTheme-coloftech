{**
 * announcementTypes.tpl
 *
 * Copyright (c) 2013-2018 Simon Fraser University
 * Copyright (c) 2000-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of announcement types in management.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.announcementTypes"}
{assign var="pageId" value="manager.announcementTypes"}
{include file="common/userheader.tpl"}
{/strip}

<ul class="pagination">
	<li><a href="{url op="announcements"}">{translate key="manager.announcements"}</a></li>
	<li class="active"><a href="{url op="announcementTypes"}">{translate key="manager.announcementTypes"}</a></li>
</ul>

<br />

<div id="announcementTypes">
<table class="table table-bordered">
	<thead>
		
	<tr class="heading" valign="bottom">
		<th>{translate key="manager.announcementTypes.typeName"}</th>
		<th>{translate key="common.action"}</th>
	</tr>
	</thead>
	<tr>
		<td colspan="2" class="headseparator">&nbsp;</td>
	</tr>
{iterate from=announcementTypes item=announcementType}
	<tr valign="top">
		<td>{$announcementType->getLocalizedTypeName()|escape}</td>
		<td><a href="{url op="editAnnouncementType" path=$announcementType->getId()}" class="action">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a href="{url op="deleteAnnouncementType" path=$announcementType->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.announcementTypes.confirmDelete"}')" class="action">{translate key="common.delete"}</a></td>
	</tr>
	<tr>
		<td colspan="2" class="{if $announcementTypes->eof()}end{/if}separator">&nbsp;</td>
	</tr>
{/iterate}
{if $announcementTypes->wasEmpty()}
	<tr>
		<td colspan="2" class="nodata">{translate key="manager.announcementTypes.noneCreated"}</td>
	</tr>
	<tr>
		<td colspan="2" class="endseparator">&nbsp;</td>
	</tr>
{else}
	<tr>
		<td align="left">{page_info iterator=$announcementTypes}</td>
		<td align="right">{page_links anchor="announcementTypes" name="announcementTypes" iterator=$announcementTypes}</td>
	</tr>
{/if}
</table>

<a href="{url op="createAnnouncementType"}" class="action">{translate key="manager.announcementTypes.create"}</a>
</div>

{include file="common/userfooter.tpl"}

