{**
 * articleBreadcrumbs.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2000-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Breadcrumbs
 *
 *}
<ol class="breadcrumb">
    <li><a href="{url page="index"}" target="_parent">{translate key="navigation.home"}</a></li>
    {if $issue}<li><a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" target="_parent">{$issue->getIssueIdentification(false,true)|escape}</a></li>{/if}
    <li><a href="{url page="article" op="view" path=$articleId|to_array:$galleyId}" class="current" target="_parent">{$article->getFirstAuthor(true)|escape}</a></li>
</ol>
