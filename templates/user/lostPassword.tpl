{**
 * templates/user/lostPassword.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2000-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.login.resetPassword"}
{assign var="registerOp" value="register"}
{assign var="registerLocaleKey" value="user.login.registerNewAccount"}
{include file="common/header.tpl"}
{/strip}
{if !$registerLocaleKey}
	{assign var="registerLocaleKey" value="user.login.registerNewAccount"}
{/if}

<div class="well">
<form id="reset" action="{url page="login" op="requestResetPassword"}" method="post">
<p><span class="instruct">{translate key="user.login.resetPasswordInstructions"}</span></p>

{if $error}
	<p><span class="pkp_form_error">{translate key="$error"}</span></p>
{/if}

<div class="row">
	<div class="col-lg-12">
		<div class="form-group">
                    <label class="control-label col-lg-3 requestResetPassword">{translate key="user.login.registeredEmail"}</label>
                    <div class="col-lg-9 value"><input type="text" name="email" value="{$username|escape}" size="30" maxlength="90" class="form-control" /></div>
                </div>
        </div>
</div>

<p><input type="submit" value="{translate key="user.login.resetPassword"}" class="btn btn-primary" /></p>

{if !$hideRegisterLink}
	<ul><li><a href="{url page="user" op=$registerOp}">{translate key=$registerLocaleKey}</a></li></ul>
{/if}

<script type="text/javascript">
<!--
	document.getElementById('reset').email.focus();
// -->
</script>
</form>
</div>

{include file="common/footer.tpl"}
