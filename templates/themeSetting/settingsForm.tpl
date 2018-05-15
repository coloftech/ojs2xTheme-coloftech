{**
 * plugins/themes/responsiveTheme/settingsForm.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Responsive Theme plugin settings
 *
 *}
{strip}
{assign var="pageTitle" value="plugins.themes.responsiveTheme.displayName"}
{include file="common/header.tpl"}
{/strip}

<div id="responsiveThemeSettings">
<div id="description">{translate key="plugins.themes.responsiveTheme.description"}</div>

<div class="separator"></div>

<br />

<form method="post" action="{plugin_url path="settings"}">
{include file="common/formErrors.tpl"}

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="headetSettingColour" required="true" key="plugins.themes.responsiveTheme.header"}</td>
		<td width="80%" class="value">
			<input name="headetSettingColour" type="text" id="headetSettingColour" size="7" maxlength="7" value="{$headetSettingColour|escape}" {if $headetSettingColour}style="background-color: {$headetSettingColour|escape};" {/if}/>
			<span onclick="openPicker('headetSettingColour')" class="picker_buttons">{translate key="plugins.themes.responsiveTheme.pickColour"}</span>
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="footerSettingColour" required="true" key="plugins.themes.responsiveTheme.footer"}</td>
		<td width="80%" class="value">
			<input name="footerSettingColour" type="text" id="footerSettingColour" size="7" maxlength="7" value="{$footerSettingColour|escape}" {if $footerSettingColour}style="background-color: {$footerSettingColour|escape};" {/if}/>
			<span onclick="openPicker('footerSettingColour')" class="picker_buttons">{translate key="plugins.themes.responsiveTheme.pickColour"}</span>
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="footerBottomSettingColour" required="true" key="plugins.themes.responsiveTheme.footerBottom"}</td>
		<td width="80%" class="value">
			<input name="footerBottomSettingColour" type="text" id="footerBottomSettingColour" size="7" maxlength="7" value="{$footerBottomSettingColour|escape}" {if $footerBottomSettingColour}style="background-color: {$footerBottomSettingColour|escape};" {/if}/>
			<span onclick="openPicker('footerBottomSettingColour')" class="picker_buttons">{translate key="plugins.themes.responsiveTheme.pickColour"}</span>
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="buttonsSettingColour" required="true" key="plugins.themes.responsiveTheme.buttons"}</td>
		<td width="80%" class="value">
			<input name="buttonsSettingColour" type="text" id="buttonsSettingColour" size="7" maxlength="7" value="{$buttonsSettingColour|escape}" {if $buttonsSettingColour}style="background-color: {$buttonsSettingColour|escape};" {/if}/>
			<span onclick="openPicker('buttonsSettingColour')" class="picker_buttons">{translate key="plugins.themes.responsiveTheme.pickColour"}</span>
		</td>
	</tr>
	<tr valign="top">
		<td class="label">{fieldLabel name="themeSettingLinkColour" required="true" key="plugins.themes.responsiveTheme.link"}</td>
		<td class="value">
			<input name="themeSettingLinkColour" type="text" id="themeSettingLinkColour" size="7" maxlength="7" value="{$themeSettingLinkColour|escape}" {if $themeSettingLinkColour}style="background-color: {$themeSettingLinkColour|escape};" {/if}/>
			<span onclick="openPicker('themeSettingLinkColour')" class="picker_buttons">{translate key="plugins.themes.responsiveTheme.pickColour"}</span>
		</td>
	</tr>
	<tr valign="top">
		<td class="label">{fieldLabel name="responsiveThemeBackgroundColour" required="true" key="plugins.themes.responsiveTheme.background"}</td>
		<td class="value">
			<input name="responsiveThemeBackgroundColour" type="text" id="responsiveThemeBackgroundColour" size="7" maxlength="7" value="{$responsiveThemeBackgroundColour|escape}" {if $responsiveThemeBackgroundColour}style="background-color: {$responsiveThemeBackgroundColour|escape};" {/if}/>
			<span onclick="openPicker('responsiveThemeBackgroundColour')" class="picker_buttons">{translate key="plugins.themes.responsiveTheme.pickColour"}</span>
		</td>
	</tr>
	<tr valign="top">
		<td class="label">{fieldLabel name="responsiveThemeForegroundColour" required="true" key="plugins.themes.responsiveTheme.foreground"}</td>
		<td class="value">
			<input name="responsiveThemeForegroundColour" type="text" id="responsiveThemeForegroundColour" size="7" maxlength="7" value="{$responsiveThemeForegroundColour|escape}" {if $responsiveThemeForegroundColour}style="background-color: {$responsiveThemeForegroundColour|escape};" {/if}/>
			<span onclick="openPicker('responsiveThemeForegroundColour')" class="picker_buttons">{translate key="plugins.themes.responsiveTheme.pickColour"}</span>
		</td>
	</tr>
	<tr valign="top">
		<td class="label">{fieldLabel name="responsiveThemePerJournal" key="plugins.themes.responsiveTheme.perJournal"}</td>
		<td class="value">
			<input name="responsiveThemePerJournal" type="checkbox" id="responsiveThemePerJournal" value="on" {if ($responsiveThemePerJournal || $disablePluginPath)}checked="checked" {/if}{if $disablePluginPath}disabled="disabled" {/if}/>
			{if $disablePluginPath}<span class="instruct">{translate key="plugins.themes.responsiveTheme.notWritablePlugin" stylesheetFileLocation=$stylesheetFilePluginLocation}</span>{/if}
		</td>
	</tr>
</table>

<br/>

{if !$canSave}{translate key="plugins.themes.responsiveTheme.notWritable" stylesheetFileLocation=$stylesheetFileLocation}<br/>{/if}

<input type="submit" {if !$canSave}disabled="disabled" {/if}name="save" class="button defaultButton" value="{translate key="common.save"}"/> <input type="button" class="button" value="{translate key="common.cancel"}" onclick="history.go(-1)"/>
</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
</div>
{include file="common/footer.tpl"}
