{**
 * templates/copyeditor/submission.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Copyeditor's submission view.
 *
 *}
{strip}
{translate|assign:"pageTitleTranslated" key="submission.page.editing" id=$submission->getId()}
{assign var="pageCrumbTitle" value="submission.editing"}
{include file="common/userheader.tpl"}
{/strip}

{include file="copyeditor/submission/summary.tpl"}

<div class="separator"></div>

{include file="copyeditor/submission/copyedit.tpl"}

<div class="separator"></div>

{include file="copyeditor/submission/layout.tpl"}

{include file="common/userfooter.tpl"}

