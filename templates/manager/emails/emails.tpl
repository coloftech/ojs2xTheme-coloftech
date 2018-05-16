{**
 * templates/manager/emails/emails.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of email templates in journal management.
 *
 *}
{strip}
{assign var="pageTitle" value="manager.emails"}
{include file="common/userheader.tpl"}
{/strip}

<br/>

<div id="emails">
<table class="table table-bordered" width="100%">
	<thead>
		
	<tr class="heading" valign="bottom">
		<th>{translate key="manager.emails.emailTemplates"}</th>
		<th>{translate key="email.sender"}</th>
		<th>{translate key="email.recipient"}</th>
		<th>{translate key="email.subject"}</th>
		<th align="right">{translate key="common.action"}</th>
	</tr>
	</thead>
	<tr><td colspan="5" class="headseparator">&nbsp;</td></tr>
{iterate from=emailTemplates item=emailTemplate}
	<tr valign="top">
		<td>
			{url|assign:"emailUrl" op="email" template=$emailTemplate->getEmailKey()}
			{$emailTemplate->getEmailKey()|escape|replace:"_":" "}&nbsp;{icon name="mail" url=$emailUrl}
		</td>
		<td>{translate key=$emailTemplate->getFromRoleName()}</td>
		<td>{translate key=$emailTemplate->getToRoleName()}</td>
		<td>{$emailTemplate->getSubject()|escape|truncate:50:"..."}</td>
		<td align="right" class="nowrap">
			<a href="{url op="editEmail" path=$emailTemplate->getEmailKey()}" class="action">{translate key="common.edit"}</a>
			{if $emailTemplate->getCanDisable() && !$emailTemplate->isCustomTemplate()}
				{if $emailTemplate->getEnabled() == 1}
					|&nbsp;<a href="{url op="disableEmail" path=$emailTemplate->getEmailKey()}" class="action">{translate key="manager.emails.disable"}</a>
				{else}
					|&nbsp;<a href="{url op="enableEmail" path=$emailTemplate->getEmailKey()}" class="action">{translate key="manager.emails.enable"}</a>
				{/if}
			{/if}
			{if $emailTemplate->isCustomTemplate()}
				|&nbsp;<a href="{url op="deleteCustomEmail" path=$emailTemplate->getEmailKey()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.emails.confirmDelete"}')" class="action">{translate key="common.delete"}</a>
			{else}
				|&nbsp;<a href="{url op="resetEmail" path=$emailTemplate->getEmailKey()}" onclick="return confirm('{translate|escape:"jsparam" key="manager.emails.confirmReset"}')" class="action">{translate key="manager.emails.reset"}</a>
			{/if}
		</td>
	</tr>
	<tr>
		<td colspan="5" class="{if $emailTemplates->eof()}end{/if}separator">&nbsp;</td>
	</tr>
{/iterate}
{if $emailTemplates->wasEmpty()}
	<tr>
		<td colspan="5" class="nodata">{translate key="common.none"}</td>
	</tr>
	<tr>
		<td colspan="5" class="endseparator">&nbsp;</td>
	</tr>
{else}
	<tr>
		<td colspan="3" align="left">{page_info iterator=$emailTemplates}</td>
		<td align="right" colspan="2">{page_links anchor="emails" name="emails" iterator=$emailTemplates}</td>
	</tr>
{/if}
</table>

<br />

<a href="{url op="createEmail"}" class="action">{translate key="manager.emails.createEmail"}</a><br />
<a href="{url op="resetAllEmails"}" onclick="return confirm('{translate|escape:"jsparam" key="manager.emails.confirmResetAll"}')" class="action">{translate key="manager.emails.resetAll"}</a>
</div>
{include file="common/userfooter.tpl"}

