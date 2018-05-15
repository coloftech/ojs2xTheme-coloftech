{**
 * templates/author/index.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Journal author index.
 *
 *}
{strip}
{assign var="pageTitle" value="common.queue.long.$pageToDisplay"}
{include file="common/userheader.tpl"}
{/strip}

<ul class="pagination">
	<li{if ($pageToDisplay == "active")} class="active"{/if} style="padding:5px;"><a class="" href="{url op="index" path="active"}" style="padding: 5px;">{translate key="common.queue.short.active"}</a></li>
	<li{if ($pageToDisplay == "completed")} class="active"{/if} style="padding:5px;"><a class="" href="{url op="index" path="completed"}" style="padding: 5px;">{translate key="common.queue.short.completed"}</a></li>
</ul>

<br />

{include file="author/$pageToDisplay.tpl"}
<div id="submitStart">
<h4>{translate key="author.submit.startHereTitle"}</h4>
{url|assign:"submitUrl" op="submit"}
{translate submitUrl=$submitUrl key="author.submit.startHereLink"}<br />
</div>

{call_hook name="Templates::Author::Index::AdditionalItems"}

{include file="common/userfooter.tpl"}

