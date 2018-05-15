{**
 * templates/user/profile.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User profile form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.profile.editProfile"}
{url|assign:"url" op="profile"}
{include file="common/header.tpl"}
{/strip}

<form id="profile" method="post" action="{url op="saveProfile"}" enctype="multipart/form-data">

{include file="common/formErrors.tpl"}

<fieldset>
{if count($formLocales) > 1}
	<div class="form-group">
		{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="formLocale" required="true" key="common.language"}
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			{url|assign:"userProfileUrl" page="user" op="profile" escape=false}
			{form_language_chooser form="profile" url=$userProfileUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</div>
	</div>
{/if}
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" suppressId="true" name="username" key="user.username"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		{$username|escape}
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="salutation" key="user.salutation"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" maxlength="40" class="form-control" />
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="firstName" required="true" key="user.firstName"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<input type="text" name="firstName" id="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="form-control" />
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="middleName" key="user.middleName"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<input type="text" name="middleName" id="middleName" value="{$middleName|escape}" size="20" maxlength="40" class="form-control" />
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="lastName" required="true" key="user.lastName"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<input type="text" name="lastName" id="lastName" value="{$lastName|escape}" size="20" maxlength="90" class="form-control" />
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="initials" key="user.initials"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<input type="text" name="initials" id="initials" value="{$initials|escape}" size="5" maxlength="5" class="form-control" />&nbsp;&nbsp;{translate key="user.initialsExample"}
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="gender" key="user.gender"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<select name="gender" id="gender" size="1" class="form-control">
			{html_options_translate options=$genderOptions selected=$gender}
		</select>
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="affiliation" key="user.affiliation"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<textarea name="affiliation[{$formLocale|escape}]" id="affiliation" rows="5" cols="40" class="form-control">{$affiliation[$formLocale]|escape}</textarea><br/>
		<span class="instruct">{translate key="user.affiliation.description"}</span>
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="signature" key="user.signature"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<textarea name="signature[{$formLocale|escape}]" id="signature" rows="5" cols="40" class="form-control">{$signature[$formLocale]|escape}</textarea>
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="email" required="true" key="user.email"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<input type="text" name="email" id="email" value="{$email|escape}" size="30" maxlength="90" class="form-control" />
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="userUrl" key="user.url"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<input type="text" name="userUrl" id="userUrl" value="{$userUrl|escape}" size="30" maxlength="90" class="form-control" />
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="phone" key="user.phone"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="form-control" />
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="fax" key="user.fax"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" maxlength="24" class="form-control" />
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="mailingAddress" key="common.mailingAddress"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="form-control">{$mailingAddress|escape}</textarea>
	</div>
</div>
<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="country" key="common.country"}
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<select name="country" id="country" class="form-control">
			<option value=""></option>
			{html_options options=$countries selected=$country}
		</select>
	</div>
</div>

{if $currentJournal}
	<div class="form-group">
		<label class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label">{translate key="user.roles"}</label>
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			<label>{translate key="user.register.registerAs"}</label>
			<br>
			{if $allowRegReader}
				<input type="checkbox" id="readerRole" name="readerRole" {if $isReader || $readerRole}checked="checked" {/if}/>&nbsp;{fieldLabel name="readerRole" key="user.role.reader"}<br/>
			{/if}
			{if $allowRegAuthor}
				<input type="checkbox" id="authorRole" name="authorRole" {if $isAuthor || $authorRole}checked="checked" {/if}/>&nbsp;{fieldLabel name="authorRole" key="user.role.author"}<br/>
			{/if}
			<!--{if $allowRegReviewer}
				<input type="checkbox" id="reviewerRole" name="reviewerRole" {if $isReviewer || $reviewerRole}checked="checked" {/if}/>&nbsp;{fieldLabel name="reviewerRole" key="user.role.reviewer"}<br/>
			{/if}-->
		</div>
	</div>
{/if}
{*if $allowRegReviewer || $isReviewer}
	<div class="form-group">
		{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="interests" key="user.interests"}
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			{include file="form/interestsInput.tpl" FBV_interestsKeywords=$interestsKeywords FBV_interestsTextOnly=$interestsTextOnly}
		</div>
	</div>
{/if*}
	<div class="form-group">
	{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="biography" key="user.biography"}{*translate key="user.biography.description"*}
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			<textarea name="biography[{$formLocale|escape}]" id="biography" rows="5" cols="40" class="form-control">{$biography[$formLocale]|escape}</textarea>
		</div>
	</div>
	<div class="form-group">
		{fieldLabel class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label" name="profileImage" key="user.profile.form.profileImage"}
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			<div class="btn-group">
				<input type="file" id="profileImage" name="profileImage" class="btn btn-default" />
				<input type="submit" name="uploadProfileImage" value="{translate key="common.upload"}" class="btn btn-default" />
			{if $profileImage}
			</div>
			<div class="image-detail">
				{translate key="common.fileName"}: {$profileImage.name|escape} {$profileImage.dateUploaded|date_format:$datetimeFormatShort}
				<input type="submit" name="deleteProfileImage" value="{translate key="common.delete"}" class="btn btn-danger" />
				<br />  
				<img src="{$sitePublicFilesDir}/{$profileImage.uploadName|escape:"url"}" width="{$profileImage.width|escape}" height="{$profileImage.height|escape}" style="border: 0;" alt="{translate key="user.profile.form.profileImage"}" />
			{/if}
			</div>
		</div>
	</div>
{if count($availableLocales) > 1}
	<div class="form-group">
		<label class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label">{translate key="user.workingLanguages"}</label>
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			{foreach from=$availableLocales key=localeKey item=localeName}
			<input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $userLocales)} checked="checked"{/if} />
			<label for="userLocales-{$localeKey|escape}">{$localeName|escape}</label><br />
		{/foreach}
		</div>
	</div>
{/if}

{if $displayOpenAccessNotification}
	{assign var=notFirstJournal value=0}
	{foreach from=$journals name=journalOpenAccessNotifications key=thisJournalId item=thisJournal}
		{assign var=thisJournalId value=$thisJournal->getJournalId()}
		{assign var=publishingMode value=$thisJournal->getSetting('publishingMode')}
		{assign var=enableOpenAccessNotification value=$thisJournal->getSetting('enableOpenAccessNotification')}
		{assign var=notificationEnabled value=$user->getSetting('openAccessNotification', $thisJournalId)}
		{if !$notFirstJournal}
			{assign var=notFirstJournal value=1}
			<div class="form-group">

				<label class="col-lg-2 col-md-3 col-sm-3 col-xs-12 control-label">{translate key="user.profile.form.openAccessNotifications"}</label>
				<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		{/if}

		{if $publishingMode == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification}
			<input type="checkbox" name="openAccessNotify[]" {if $notificationEnabled}checked="checked" {/if}id="openAccessNotify-{$thisJournalId|escape}" value="{$thisJournalId|escape}" />
			<label for="openAccessNotify-{$thisJournalId|escape}">{$thisJournal->getLocalizedTitle()|escape}</label><br/>
		{/if}

		{if $smarty.foreach.journalOpenAccessNotifications.last}
				</div>
			</div>
		{/if}
	{/foreach}
{/if}

</fieldset>
<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12"></div>
<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
<p>
	<input type="button" value="{translate key="common.cancel"}" class="btn btn-default btn-lg" onclick="document.location.href='{url page="user"}'" />
	<input type="submit" value="{translate key="common.save"}" class="btn btn-primary btn-lg" />
</p>
</div>
</form>

<p><span class="formRequired pull-right">{translate key="common.requiredField"}</span></p>
{include file="common/footer.tpl"}

