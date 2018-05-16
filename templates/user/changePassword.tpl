{**
 * templates/user/changePassword.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form to change a user's password.
 *
 *}
{strip}
{assign var="pageTitle" value="user.changePassword"}
{url|assign:"currentUrl" page="user" op="changePassword"}
{include file="common/userheader.tpl"}
{/strip}

<div id="changePassword">
<form method="post" action="{url op="savePassword"}">

{include file="common/formErrors.tpl"}

<p><span class="instruct">{translate key="user.profile.changePasswordInstructions"}</span></p>

<div class="row">
	<div class="col-lg-12">
		<div class="form-group">
			{fieldLabel class="control-label col-lg-3" name="oldPassword" key="user.profile.oldPassword"}
			<div class="col-lg-9 value"><input type="password" name="oldPassword" id="oldPassword" value="{$oldPassword|escape}" size="20" maxlength="32" class="form-control"  /></div>
		</div>
		<div class="form-group">
			{fieldLabel class="control-label col-lg-3" name="password" key="user.profile.newPassword"}
			<div class="col-lg-9 value"><input type="password" name="password" value="{$password|escape}" id="password" size="20" maxlength="32" class="form-control"  /><br>
			<div class="alert alert-warning">{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</div>
			</div>
		</div>
		<div class="form-group">
			{fieldLabel class="control-label col-lg-3" name="password2" key="user.profile.repeatNewPassword"}
			<div class="col-lg-9 value"><input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" maxlength="32" class="form-control"  /></div>
		</div>
	</div>
</div>

<div class="btn-group pull-right">
	<input type="submit" value="{translate key="common.save"}" class="btn btn-primary" />
	<input type="button" value="{translate key="common.cancel"}" class="btn btn-default" onclick="document.location.href='{url page="user" escape=false}'" />
</div>


<p></p>
</form>
</div>
{include file="common/userfooter.tpl"}

