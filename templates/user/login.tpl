{**
 * templates/user/login.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2000-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.login"}
{assign var="helpTopicId" value="user.registerAndProfile"}
{assign var="registerOp" value="register"}
{assign var="registerLocaleKey" value="user.login.registerNewAccount"}
{include file="common/header1.tpl"}
{/strip}

{if !$registerOp}
	{assign var="registerOp" value="register"}
{/if}
{if !$registerLocaleKey}
	{assign var="registerLocaleKey" value="user.login.registerNewAccount"}
{/if}

{if $loginMessage}
	<span class="instruct">{translate key="$loginMessage"}</span>
	<br />
	<br />
{/if}

{if $implicitAuth}
	<a id="implicitAuthLogin" href="{url page="login" op="implicitAuthLogin"}">Login</a>
{else}
	<form id="signinForm" method="post" action="{$loginUrl}">
{/if}

{if $error}
	<span class="pkp_form_error">{translate key="$error" reason=$reason}</span>
	<br />
	<br />
{/if}

<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

{if ! $implicitAuth}
	<div class="col-lg-6">
		<div class="well">
			<div class="form-group">
				<label class="control-label" for="loginUsername">{translate key="user.username"}</label>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user"></i></span>
					<input type="text" id="loginUsername" class="form-control" name="username" value="{$username|escape}" size="20" maxlength="32" class="textField" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label" for="loginPassword">{translate key="user.password"}</label></td>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span>
					<input type="password" id="loginPassword" class="form-control" name="password" value="{$password|escape}" size="20" class="textField" />
				</div>
			</div>
			{if $showRemember}
			<!--<div class="form-group">
				<div class="input-group">
					<input type="checkbox" id="loginRemember" name="remember" value="1"{if $remember} checked="checked"{/if} /> <label for="loginRemember">{translate key="user.login.rememberUsernameAndPassword"}</label>
				</div>
			</div>-->
			{/if}{* $showRemember *}

			<div class="form-group">
                <input class="btn btn-success btn-block" type="submit" value="{translate key="user.login"}" class="button" />
                <a class="btn btn-default btn-block" href="{url page="login" op="lostPassword"}">{translate key="user.login.forgotPassword"}</a>
			</div>
            {if !$hideRegisterLink}<a href="{url page="user" op=$registerOp}">{translate key=$registerLocaleKey}</a>{/if}
		</div>
	</div>


<script type="text/javascript">
<!--
	document.getElementById('{if $username}loginPassword{else}loginUsername{/if}').focus();
// -->
</script>
{/if}{* !$implicitAuth *}

</form>

{include file="common/footer.tpl"}
