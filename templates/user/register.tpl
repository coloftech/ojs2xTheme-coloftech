{**
 * templates/user/register.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.register"}
{include file="common/header.tpl"}
{/strip}

<div class="row">
	<div class="col-lg-12">
		
		<form id="register" class="form-horizontal" method="post" action="{url op="registerUser"}">
		
		<p>{translate key="user.register.completeForm"}</p>
		
		{if !$implicitAuth}
			{if !$existingUser}
				{url|assign:"url" page="user" op="register" existingUser=1}
				<!--<p>{translate key="user.register.alreadyRegisteredOtherJournal" registerUrl=$url}</p>-->
			{else}
				{url|assign:"url" page="user" op="register"}
				<p>{translate key="user.register.notAlreadyRegisteredOtherJournal" registerUrl=$url}</p>
				<input type="hidden" name="existingUser" value="1"/>
			{/if}
		
			<h3>{translate key="user.profile"}</h3>
		
			{include file="common/formErrors.tpl"}
		
			{if $existingUser}
				<p>{translate key="user.register.loginToRegister"}</p>
			{/if}
		{/if}{* !$implicitAuth *}
		
		{if $source}
			<input type="hidden" name="source" value="{$source|escape}" />
		{/if}
		
		<fieldset>
		{if count($formLocales) > 1 && !$existingUser}
			<div class="form-group">
				{fieldLabel class="control-label col-lg-3" name="formLocale" key="form.formLanguage"}
				<div class="col-lg-9 value">
					{url|assign:"userRegisterUrl" page="user" op="register" escape=false}
					{form_language_chooser form="register" url=$userRegisterUrl}
					<span class="instruct">{translate key="form.formLanguage.description"}</span>
				</div>
			</div>
		{/if}{* count($formLocales) > 1 && !$existingUser *}
		
		{if !$implicitAuth}
			<div class="form-group">
				{fieldLabel class="control-label col-lg-3" name="username" required="true" key="user.username"}
				<div class="col-lg-9 value">
					<input class="form-control" type="text" name="username" value="{$username|escape}" id="username" size="20" maxlength="32" />
				{if !$existingUser}
					<div calss="instruct">{translate key="user.register.usernameRestriction"}</div>
				{/if}{* !$existingUser *}
				</div>
				
			</div>
					
			<div class="form-group">
				{fieldLabel class="control-label col-lg-3" name="password" required="true" key="user.password"}
				<div class="col-lg-9 value">
					<input type="password" name="password" value="{$password|escape}" id="password" size="20" maxlength="32" class="form-control" />
					<div calss="instruct">{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</div>
				</div>
			</div>
		
			{if !$existingUser}
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="password2" required="true" key="user.repeatPassword"}
					<div class="col-lg-9 value"><input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" maxlength="32" class="form-control" /></div>
				</div>
		
				{if $captchaEnabled}
					<div class="form-group">
						{if $reCaptchaEnabled}
						{fieldLabel class="control-label col-lg-3" name="recaptcha_challenge_field" required="true" key="common.captchaField"}
						<div class="col-lg-9 value">
							{$reCaptchaHtml}
						</div>
						{else}
						{fieldLabel class="control-label col-lg-3" name="captcha" required="true" key="common.captchaField"}
						<div class="col-lg-9 value">
							<img src="{url page="user" op="viewCaptcha" path=$captchaId}" alt="{translate key="common.captchaField.altText"}" /><br />
							<span class="instruct">{translate key="common.captchaField.description"}</span><br />
							<input name="captcha" id="captcha" value="" size="20" maxlength="32" class="form-control" />
							<input type="hidden" name="captchaId" value="{$captchaId|escape:"quoted"}" />
						</div>
						{/if}
					</div>
				{/if}{* $captchaEnabled *}
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="salutation" key="user.salutation"}
					<div class="col-lg-9 value">
						<input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" maxlength="40" class="form-control"  />
					</div>
				</div>
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="firstName" required="true" key="user.firstName"}
					<div class="col-lg-9 value">
						<input type="text" id="firstName" name="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="form-control"  />
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="middleName" key="user.middleName"}
					<div class="col-lg-9 value">
						<input type="text" id="middleName" name="middleName" value="{$middleName|escape}" size="20" maxlength="40" class="form-control"  />
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="lastName" required="true" key="user.lastName"}
					<div class="col-lg-9 value"><input type="text" id="lastName" name="lastName" value="{$lastName|escape}" size="20" maxlength="90" class="form-control"  /></div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="initials" key="user.initials"}
					<div class="col-lg-9 value"><input type="text" id="initials" name="initials" value="{$initials|escape}" size="5" maxlength="5" class="form-control"  />&nbsp;&nbsp;{translate key="user.initialsExample"}</div>
				</div>
		
				<!--<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="gender-m" key="user.gender"}
					<div class="col-lg-9 value">
						<select name="gender" id="gender" size="1" class="form-control" >
							{html_options_translate options=$genderOptions selected=$gender}
						</select>
					</div>
				</div>-->
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="affiliation" key="user.affiliation"}
					<div class="col-lg-9 value">
						<textarea id="affiliation" name="affiliation[{$formLocale|escape}]" rows="5" cols="40" class="form-control" >{$affiliation[$formLocale]|escape}</textarea><br/>
						<span class="instruct">{translate key="user.affiliation.description"}</span>
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="signature" key="user.signature"}
					<div class="col-lg-9 value">
						<textarea name="signature[{$formLocale|escape}]" id="signature" rows="5" cols="40" class="form-control" >{$signature[$formLocale]|escape}</textarea>
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="email" required="true" key="user.email"}
					<div class="col-lg-9 value">
						<input type="text" id="email" name="email" value="{$email|escape}" size="30" maxlength="90" class="form-control" />
						{if $privacyStatement}
							<a class="action" href="#privacyStatement">{translate key="user.register.privacyStatement"}</a>
						{/if}
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="confirmEmail" required="true" key="user.confirmEmail"}
					<div class="col-lg-9 value">
						<input type="text" id="confirmEmail" name="confirmEmail" value="{$confirmEmail|escape}" size="30" maxlength="90" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="orcid" key="user.orcid"}
					<div class="col-lg-9 value">
						<input type="text" id="orcid" name="orcid" value="{$orcid|escape}" size="40" maxlength="255" class="form-control" /><span class="instruct">{translate key="user.orcid.description"}</span>
					</div>
				</div>
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="userUrl" key="user.url"}
					<div class="col-lg-9 value">
						<input type="text" id="userUrl" name="userUrl" value="{$userUrl|escape}" size="30" maxlength="90" class="form-control" />
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="phone" key="user.phone"}
					<div class="col-lg-9 value">
						<input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="form-control" />
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="fax" key="user.fax"}
					<div class="col-lg-9 value">
						<input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" maxlength="24" class="form-control" />
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="mailingAddress" key="common.mailingAddress"}
					<div class="col-lg-9 value">
						<textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="form-control" >{$mailingAddress|escape}</textarea>
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="country" key="common.country"}
					<div class="col-lg-9 value">
						<select name="country" id="country" class="form-control" >
							<option value=""></option>
							{html_options options=$countries selected=$country}
						</select>
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="biography" key="user.biography"}{*translate key="user.biography.description"*}
					<div class="col-lg-9 value">
						<textarea name="biography[{$formLocale|escape}]" id="biography" rows="5" cols="40" class="form-control" >{$biography[$formLocale]|escape}</textarea>
					</div>
				</div>
		
				<div class="form-group">
					{fieldLabel class="control-label col-lg-3" name="sendPassword" key="user.sendPassword"}
					<div class="col-lg-9 value">
						<input type="checkbox" name="sendPassword" id="sendPassword" value="1"{if $sendPassword} checked="checked"{/if} />
						<label for="sendPassword">{translate key="user.sendPassword.description"}</label>
					</div>
				</div>
		
				{if count($availableLocales) > 1}
					<div class="form-group">
						<label class="control-label col-lg-3">{translate key="user.workingLanguages"}</label>
						<div class="col-lg-9 value">
							{foreach from=$availableLocales key=localeKey item=localeName}
								<input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $userLocales)} checked="checked"{/if} />
								<label for="userLocales-{$localeKey|escape}">{$localeName|escape}</label><br />
							{/foreach}
						</div>
					</div>
				{/if}{* count($availableLocales) > 1 *}
			{/if}{* !$existingUser *}
		{/if}{* !$implicitAuth *}
		
		{if $allowRegReader || $allowRegReader === null || $allowRegAuthor || $allowRegAuthor === null || $allowRegReviewer || $allowRegReviewer === null || ($currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification)}
			<div class="form-group">
				{fieldLabel class="control-label col-lg-3" suppressId="true" name="registerAs" key="user.register.registerAs"}
				<div class="col-lg-9 value">
					{if $allowRegReader || $allowRegReader === null}
						<input type="checkbox" name="registerAsReader" id="registerAsReader" value="1"{if $registerAsReader} checked="checked"{/if} />
						<label for="registerAsReader">{translate key="user.role.reader"}</label>: {translate key="user.register.readerDescription"}<br />
					{/if}
					{if $currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification}
						<input type="checkbox" name="openAccessNotification" id="openAccessNotification" value="1"{if $openAccessNotification} checked="checked"{/if} />
						<label for="openAccessNotification">{translate key="user.role.reader"}</label>: {translate key="user.register.openAccessNotificationDescription"}<br />
					{/if}
					{if $allowRegAuthor || $allowRegAuthor === null}
					<input type="checkbox" name="registerAsAuthor" id="registerAsAuthor" value="1"{if $registerAsAuthor} checked="checked"{/if} />
					<label for="registerAsAuthor">{translate key="user.role.author"}</label>: {translate key="user.register.authorDescription"}<br />
					{/if}
					{if $allowRegReviewer || $allowRegReviewer === null}
						<input type="checkbox" name="registerAsReviewer" id="registerAsReviewer" value="1"{if $registerAsReviewer} checked="checked"{/if} />
						<label for="registerAsReviewer">{translate key="user.role.reviewer"}</label>: {if $existingUser}{translate key="user.register.reviewerDescriptionNoInterests"}{else}{translate key="user.register.reviewerDescription"}{/if}
						<br />
						<div id="reviewerInterestsContainer" style="margin-left:25px;">
							<label class="desc">{translate key="user.register.reviewerInterests"}</label>
							{include file="form/interestsInput.tpl" FBV_interestsKeywords=$interestsKeywords FBV_interestsTextOnly=$interestsTextOnly}
						</div>
					{/if}
				</div>
			</div>
		{/if}
		
		</fieldset>
		
		<div class="form-group">
			<div class="col-lg-6"></div>
			<div class="col-lg-6">
				<p><input type="submit" value="{translate key="user.register"}" class="btn btn-primary btn-lg" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-default btn-lg" onclick="document.location.href='{url page="index" escape=false}'" /></p>
			</div>
		</div>
		{if ! $implicitAuth}
			<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
		{/if}{* !$implicitAuth *}
		</form>
	</div>
	<div class="col-lg-12">
		<div id="privacyStatement">
			{if $privacyStatement}
			<h3>{translate key="user.register.privacyStatement"}</h3>
			<p>{$privacyStatement|nl2br}</p>
		{/if}
		</div>
	</div>
</div>
{include file="common/footer.tpl"}

