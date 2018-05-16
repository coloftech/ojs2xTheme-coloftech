{**
 * templates/manager/setup/step5.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 5 of journal setup.
 *
 *}
{assign var="pageTitle" value="manager.setup.customizingTheLook"}
{include file="manager/setup/setupHeader.tpl"}
{include file="manager/setup/script/js5.tpl"}


<form id="setupForm" method="post" action="{url op="saveSetup" path="5"}" enctype="multipart/form-data">
{include file="common/formErrors.tpl"}

{if count($formLocales) > 1}
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="formLocale" key="form.formLanguage"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			{url|assign:"setupFormUrl" op="setup" path="5" escape=false}
			{form_language_chooser form="setupForm" url=$setupFormUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</div>
	</div>
{/if}

<ul class="nav nav-tabs ">
  <li class="active"><a data-toggle="tab" href="#journalHomepageHeader" class="tab-0">{translate key="plugins.themes.responsiveTheme.journalHomepageHeader"}</a></li>
  <li><a data-toggle="tab" href="#jHomepage" class="tab-1">{translate key="plugins.themes.responsiveTheme.journalHomepageContent"}</a></li>
  <li><a data-toggle="tab" href="#journalPageHeaderInfo" class="tab-2">{translate key="plugins.themes.responsiveTheme.journalPageHeader"}</a></li>
  <li><a data-toggle="tab" href="#journalPageFooterInfo" class="tab-3">{translate key="plugins.themes.responsiveTheme.journalPageFooter"}</a></li>
  <li><a data-toggle="tab" href="#navigationBar" class="tab-4">{translate key="plugins.themes.responsiveTheme.navigationBar"}</a></li>
  <li><a data-toggle="tab" href="#journalLayout" class="tab-5">{translate key="plugins.themes.responsiveTheme.journalLayout"}</a></li>
  <li><a data-toggle="tab" href="#setupInfo" class="tab-6">{translate key="manager.setup.information"}</a></li>
  <li><a data-toggle="tab" href="#lists" class="tab-7">{translate key="manager.setup.lists"}</a></li>
</ul>
<div class="col-lg-12 has-error"></div>
<div class="tab-content">
<div id="journalHomepageHeader" class="tab-pane fade in active">
<h3>5.1 {translate key="manager.setup.journalHomepageHeader"}</h3>

<p>{translate key="manager.setup.journalHomepageHeaderDescription"}</p>
<div id="journalTitleAndLogo">
<h4>{translate key="manager.setup.journalTitle"}</h4>

	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			<input type="radio" name="homeHeaderTitleType[{$formLocale|escape}]" id="homeHeaderTitleType-0" value="0"{if not $homeHeaderTitleType[$formLocale]} checked="checked"{/if} /> {fieldLabel name="homeHeaderTitleType-0" key="manager.setup.useTextTitle"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="homeHeaderTitle[{$formLocale|escape}]" value="{$homeHeaderTitle[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			<input type="radio" name="homeHeaderTitleType[{$formLocale|escape}]" id="homeHeaderTitleType-1" value="1"{if $homeHeaderTitleType[$formLocale]} checked="checked"{/if} /> {fieldLabel name="homeHeaderTitleType-1" key="manager.setup.useImageTitle"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="file" name="homeHeaderTitleImage" class="uploadField" /> <input type="submit" name="uploadHomeHeaderTitleImage" value="{translate key="common.upload"}" class="button" />
		</div>
	</div>

{if $homeHeaderTitleImage[$formLocale]}
{translate key="common.fileName"}: {$homeHeaderTitleImage[$formLocale].name|escape} {$homeHeaderTitleImage[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deleteHomeHeaderTitleImage" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicFilesDir}/{$homeHeaderTitleImage[$formLocale].uploadName|escape:"url"}" width="{$homeHeaderTitleImage[$formLocale].width|escape}" height="{$homeHeaderTitleImage[$formLocale].height|escape}" style="border: 0;" alt="{translate key="common.homePageHeader.altText"}" />
<br />
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="homeHeaderTitleImageAltText" key="common.altText"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="homeHeaderTitleImageAltText[{$formLocale|escape}]" value="{$homeHeaderTitleImageAltText[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<span class="instruct">{translate key="common.altTextInstructions"}</span>
		</div>
	</div>
{/if}
</div>
<div id="journalLogoImage">
<h4>{translate key="manager.setup.journalLogo"}</h4>


	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="homeHeaderLogoImage" key="manager.setup.useImageLogo"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="file" name="homeHeaderLogoImage" id="homeHeaderLogoImage" class="uploadField" /> <input type="submit" name="uploadHomeHeaderLogoImage" value="{translate key="common.upload"}" class="button" />
		</div>
	</div>


{if $homeHeaderLogoImage[$formLocale]}
{translate key="common.fileName"}: {$homeHeaderLogoImage[$formLocale].name|escape} {$homeHeaderLogoImage[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deleteHomeHeaderLogoImage" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicFilesDir}/{$homeHeaderLogoImage[$formLocale].uploadName|escape:"url"}" width="{$homeHeaderLogoImage[$formLocale].width|escape}" height="{$homeHeaderLogoImage[$formLocale].height|escape}" style="border: 0;" alt="{translate key="common.homePageHeaderLogo.altText"}" />
<br />
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="homeHeaderLogoImageAltText" key="common.altText"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="homeHeaderLogoImageAltText[{$formLocale|escape}]" value="{$homeHeaderLogoImageAltText[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3"></div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<span class="instruct">{translate key="common.altTextInstructions"}</span>
		</div>
	</div>

{/if}
</div>

<div id="journalThumbnail">
<h4>{translate key="manager.setup.journalThumbnail"}</h4>


	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="journalThumbnail" key="manager.setup.useThumbnail"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="file" name="journalThumbnail" id="journalThumbnail" class="uploadField" /> <input type="submit" name="uploadJournalThumbnail" value="{translate key="common.upload"}" class="button" />
		</div>
	</div>


{if $journalThumbnail[$formLocale]}
{translate key="common.fileName"}: {$journalThumbnail[$formLocale].name|escape} {$journalThumbnail[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deleteJournalThumbnail" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicFilesDir}/{$journalThumbnail[$formLocale].uploadName|escape:"url"}" width="{$journalThumbnail[$formLocale].width|escape}" height="{$journalThumbnail[$formLocale].height|escape}" style="border: 0;" alt="{translate key="common.journalThumbnail.altText"}" />
<br />

	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="journalThumbnailAltText" key="common.altText"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="journalThumbnailAltText[{$formLocale|escape}]" value="{$journalThumbnailAltText[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<span class="instruct">{translate key="common.altTextInstructions"}</span>
		</div>
	</div>

{/if}
</div>
</div>
<div id="jHomepage" class="tab-pane fade">
<div id="journalHomepageContent" >
<h3>5.2 {translate key="manager.setup.journalHomepageContent"}</h3>

<p>{translate key="manager.setup.journalHomepageContentDescription"}</p>
</div>

<div id="journalDescription" >
<h4>{fieldLabel name="description" key="manager.setup.journalDescription"}</h4>

<p>{translate key="manager.setup.journalDescriptionDescription"}</p>

<p><textarea id="description" name="description[{$formLocale|escape}]" rows="3" cols="60" class="form-control">{$description[$formLocale]|escape}</textarea></p>
</div>
<div id="homepageImage">
<h4>{translate key="manager.setup.homepageImage"}</h4>

<p>{translate key="manager.setup.homepageImageDescription"}</p>


	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="homepageImage" key="manager.setup.homepageImage"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="file" name="homepageImage" id="homepageImage" class="uploadField" /> <input type="submit" name="uploadHomepageImage" value="{translate key="common.upload"}" class="button" />
		</div>
	</div>


{if $homepageImage[$formLocale]}
{translate key="common.fileName"}: {$homepageImage[$formLocale].name|escape} {$homepageImage[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deleteHomepageImage" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicFilesDir}/{$homepageImage[$formLocale].uploadName|escape:"url"}" width="{$homepageImage[$formLocale].width|escape}" height="{$homepageImage[$formLocale].height|escape}" style="border: 0;" alt="{translate key="common.journalHomepageImage.altText"}" />
<br />

	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="homepageImageAltText" key="common.altText"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="homepageImageAltText[{$formLocale|escape}]" value="{$homepageImageAltText[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<span class="instruct">{translate key="common.altTextInstructions"}</span>
		</div>
	</div>
{/if}

<div id="currentIssue">
<h4>{translate key="manager.setup.currentIssue"}</h4>


	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			<input type="checkbox" name="displayCurrentIssue" id="displayCurrentIssue" value="1" {if $displayCurrentIssue} checked="checked"{/if} />
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<label for="displayCurrentIssue">{translate key="manager.setup.displayCurrentIssue"}</label>
		</div>
	</div>

</div>
<div id="additionalContent">

<h4>{fieldLabel name="additionalHomeContent" key="manager.setup.additionalContent"}</h4>

<p>{translate key="manager.setup.additionalContentDescription"}</p>

<p><textarea name="additionalHomeContent[{$formLocale|escape}]" id="additionalHomeContent" rows="12" cols="60" class="form-control">{$additionalHomeContent[$formLocale]|escape}</textarea></p>
</div>
</div>
</div>

<div id="journalPageHeaderInfo"  class="tab-pane fade">
<h3>5.3 {translate key="manager.setup.journalPageHeader"}</h3>

<p>{translate key="manager.setup.journalPageHeaderDescription"}</p>
<div id="pageHeaderTitle">
<h4>{translate key="manager.setup.journalTitle"}</h4>


	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			<input type="radio" name="pageHeaderTitleType[{$formLocale|escape}]" id="pageHeaderTitleType-0" value="0"{if not $pageHeaderTitleType[$formLocale]} checked="checked"{/if} /> {fieldLabel name="pageHeaderTitleType-0" key="manager.setup.useTextTitle"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="pageHeaderTitle[{$formLocale|escape}]" value="{$pageHeaderTitle[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			<input type="radio" name="pageHeaderTitleType[{$formLocale|escape}]" id="pageHeaderTitleType-1" value="1"{if $pageHeaderTitleType[$formLocale]} checked="checked"{/if} /> {fieldLabel name="pageHeaderTitleType-1" key="manager.setup.useImageTitle"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="file" name="pageHeaderTitleImage" class="uploadField" /> <input type="submit" name="uploadPageHeaderTitleImage" value="{translate key="common.upload"}" class="button" />
		</div>
	</div>


{if $pageHeaderTitleImage[$formLocale]}
{translate key="common.fileName"}: {$pageHeaderTitleImage[$formLocale].name|escape} {$pageHeaderTitleImage[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deletePageHeaderTitleImage" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicFilesDir}/{$pageHeaderTitleImage[$formLocale].uploadName|escape:"url"}" width="{$pageHeaderTitleImage[$formLocale].width|escape}" height="{$pageHeaderTitleImage[$formLocale].height|escape}" style="border: 0;" alt="{translate key="common.pageHeader.altText"}" />
<br />

	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="pageHeaderTitleImageAltText" key="common.altText"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="pageHeaderTitleImageAltText[{$formLocale|escape}]" value="{$pageHeaderTitleImageAltText[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<span class="instruct">{translate key="common.altTextInstructions"}</span>
		</div>
	</div>

{/if}
</div>
<div id="journalLogo">
<h4>{translate key="manager.setup.journalLogo"}</h4>


	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="pageHeaderLogoImage" key="manager.setup.useImageLogo"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="file" name="pageHeaderLogoImage" id="pageHeaderLogoImage" class="uploadField" /> <input type="submit" name="uploadPageHeaderLogoImage" value="{translate key="common.upload"}" class="button" />
		</div>
	</div>


{if $pageHeaderLogoImage[$formLocale]}
{translate key="common.fileName"}: {$pageHeaderLogoImage[$formLocale].name|escape} {$pageHeaderLogoImage[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deletePageHeaderLogoImage" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicFilesDir}/{$pageHeaderLogoImage[$formLocale].uploadName|escape:"url"}" width="{$pageHeaderLogoImage[$formLocale].width|escape}" height="{$pageHeaderLogoImage[$formLocale].height|escape}" style="border: 0;" alt="{translate key="common.pageHeaderLogo.altText"}" />
<br />

	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="pageHeaderLogoImageAltText" key="common.altText"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="pageHeaderLogoImageAltText[{$formLocale|escape}]" value="{$pageHeaderLogoImageAltText[$formLocale]|escape}" size="40" maxlength="255" class="form-control" />
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<span class="instruct">{translate key="common.altTextInstructions"}</span>
		</div>
	</div>

{/if}
</div>

<div id="journalFavicon">
<h4>{translate key="manager.setup.journalFavicon"}</h4>

<p>{translate key="manager.setup.journalFaviconDescription"}</p>


	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="journalFavicon" key="manager.setup.useImageLogo"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="file" name="journalFavicon" id="journalFavicon" class="uploadField" /> <input type="submit" name="uploadJournalFavicon" value="{translate key="common.upload"}" class="button" />
		</div>
	</div>


{if $journalFavicon[$formLocale]}
{translate key="common.fileName"}: {$journalFavicon[$formLocale].name|escape} {$journalFavicon[$formLocale].dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deleteJournalFavicon" value="{translate key="common.delete"}" class="button" />
<br />
<img src="{$publicFilesDir}/{$journalFavicon[$formLocale].uploadName|escape:"url"}" width="16px" height="16px" style="border: 0;" alt="favicon" />
{/if}
</div>

<div id="alternateHeader">
<h4>{fieldLabel name="journalPageHeader" key="manager.setup.alternateHeader"}</h4>

<p>{translate key="manager.setup.alternateHeaderDescription"}</p>

<p><textarea name="journalPageHeader[{$formLocale|escape}]" id="journalPageHeader" rows="12" cols="60" class="form-control">{$journalPageHeader[$formLocale]|escape}</textarea></p>
</div>
</div>


<div id="journalPageFooterInfo"  class="tab-pane fade">
<h3>5.4 {fieldLabel name="journalPageFooter" key="manager.setup.journalPageFooter"}</h3>

<p>{translate key="manager.setup.journalPageFooterDescription"}</p>

<p><textarea name="journalPageFooter[{$formLocale|escape}]" id="journalPageFooter" rows="12" cols="60" class="form-control">{$journalPageFooter[$formLocale]|escape}</textarea></p>
</div>



<div id="navigationBar"  class="tab-pane fade">
<h3>5.5 {translate key="manager.setup.navigationBar"}</h3>

<p>{translate key="manager.setup.itemsDescription"}</p>


{foreach name=navItems from=$navItems[$formLocale] key=navItemId item=navItem}
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="navItems-$navItemId-name" key="manager.setup.labelName"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="navItems[{$formLocale|escape}][{$navItemId|escape}][name]" id="navItems-{$navItemId|escape}-name" value="{$navItem.name|escape}" size="30" maxlength="90" class="form-control" /> <input type="submit" name="delNavItem[{$navItemId|escape}]" value="{translate key="common.delete"}" class="button" />
			<table width="100%">
				<tr valign="top">
					<td width="5%"><input type="checkbox" name="navItems[{$formLocale|escape}][{$navItemId|escape}][isLiteral]" id="navItems-{$navItemId|escape}-isLiteral" value="1"{if $navItem.isLiteral} checked="checked"{/if} /></td>
					<td width="95%"><label for="navItems-{$navItemId|escape}-isLiteral">{translate key="manager.setup.navItemIsLiteral"}</label></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="navItems-$navItemId-url" key="common.url"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="navItems[{$formLocale|escape}][{$navItemId|escape}][url]" id="navItems-{$navItemId|escape}-url" value="{$navItem.url|escape}" size="60" maxlength="255" class="form-control" />
			<table width="100%">
				<tr valign="top">
					<td width="5%"><input type="checkbox" name="navItems[{$formLocale|escape}][{$navItemId|escape}][isAbsolute]" id="navItems-{$navItemId|escape}-isAbsolute" value="1"{if $navItem.isAbsolute} checked="checked"{/if} /></td>
					<td width="95%"><label for="navItems-{$navItemId|escape}-isAbsolute">{translate key="manager.setup.navItemIsAbsolute"}</label></td>
				</tr>
			</table>
		</div>
	</div>
	{if !$smarty.foreach.navItems.last}
	{/if}
{foreachelse}
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="navItems-0-name" key="manager.setup.labelName"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="navItems[{$formLocale|escape}][0][name]" id="navItems-0-name" size="30" maxlength="90" class="form-control" />
			<table width="100%">
				<tr valign="top">
					<td width="5%"><input type="checkbox" name="navItems[{$formLocale|escape}][0][isLiteral]" id="navItems-0-isLiteral" value="1" /></td>
					<td width="95%"><label for="navItems-0-isLiteral">{translate key="manager.setup.navItemIsLiteral"}</label></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="navItems-0-url" key="common.url"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" name="navItems[{$formLocale|escape}][0][url]" id="navItems-0-url" size="60" maxlength="255" class="form-control" />
			<table width="100%">
				<tr valign="top">
					<td width="5%"><input type="checkbox" name="navItems[{$formLocale|escape}][0][isAbsolute]" id="navItems-0-isAbsolute" value="1" /></td>
					<td width="95%"><label for="navItems-0-isAbsolute">{translate key="manager.setup.navItemIsAbsolute"}</label></td>
				</tr>
			</table>
		</div>
	</div>
{/foreach}


<p><input type="submit" name="addNavItem" value="{translate key="manager.setup.addNavItem"}" class="button" /></p>
</div>



<div id="journalLayout"  class="tab-pane fade">
<h3>5.6 {translate key="manager.setup.journalLayout"}</h3>

<p>{translate key="manager.setup.journalLayoutDescription"}</p>


	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			<label for="journalTheme">{translate key="manager.setup.journalTheme"}</label>
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<select name="journalTheme" class="form-control" id="journalTheme"{if empty($journalThemes)} disabled="disabled"{/if}>
				<option value="">{translate key="common.none"}</option>
				{foreach from=$journalThemes key=path item=journalThemePlugin}
					<option value="{$path|escape}"{if $path == $journalTheme} selected="selected"{/if}>{$journalThemePlugin->getDisplayName()|escape}</option>
				{/foreach}
			</select>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			<label for="journalStyleSheet">{translate key="manager.setup.useJournalStyleSheet"}</label>
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="file" name="journalStyleSheet" id="journalStyleSheet" class="uploadField" /> <input type="submit" name="uploadJournalStyleSheet" value="{translate key="common.upload"}" class="button" />
		</div>
	</div>


{if $journalStyleSheet}
{translate key="common.fileName"}: <a href="{$publicFilesDir}/{$journalStyleSheet.uploadName|escape:"url"}" class="file">{$journalStyleSheet.name|escape}</a> {$journalStyleSheet.dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deleteJournalStyleSheet" value="{translate key="common.delete"}" class="button" />
{/if}


<table id="assignBlocksToSidebars" border="0" align="center" style="width: 100%;">
	<tr align="center">
		<td rowspan="2" id="assignBlocksToSidebarLeft" style="with: 30%;" >
			{fieldLabel name="blockSelectLeftWidget" key="manager.setup.layout.leftSidebar"}<br/>
			<input class="button defaultButton" style="width: 100%;" type="button" value="&uarr;" onclick="moveUp(this.form.elements['blockSelectLeftWidget']);" /><br/>
			<select name="blockSelectLeftWidget" id="blockSelectLeftWidget" multiple="multiple" size="10" class="form-control" style="width: 100%; height:200px">
				{foreach from=$leftBlockPlugins item=block}
					<option value="{$block->getName()|escape}">{$block->getDisplayName()|escape}</option>
				{foreachelse}
					<option value=""></option>
				{/foreach}
			</select><br/>
			<input class="button defaultButton" style="width: 100%;" type="button" value="&darr;" onclick="moveDown(this.form.elements['blockSelectLeftWidget']);" />
		</td>
		<td>
			<input class="button defaultButton" style="width: 100%;" type="button" value="&larr;" onclick="jumpList(this.form.elements['blockUnselectedWidget'],this.form.elements['blockSelectLeftWidget']);" /><br/>
			<input class="button defaultButton" style="width: 100%;" type="button" value="&rarr;" onclick="jumpList(this.form.elements['blockSelectLeftWidget'],this.form.elements['blockUnselectedWidget']);" />
		</td>
		<td valign="top" id="assignBlocksToSidebarUnselected" style="width: 30%;" >
			{fieldLabel name="blockUnselectedWidget" key="manager.setup.layout.unselected"}<br/>
			<select name="blockUnselectedWidget" id="blockUnselectedWidget" multiple="multiple" size="10" class="form-control" style="width: 100%; height:180px;" >
				{foreach from=$disabledBlockPlugins item=block}
					<option value="{$block->getName()|escape}">{$block->getDisplayName()|escape}</option>
				{foreachelse}
					<option value=""></option>
				{/foreach}
			</select>
		</td>
		<td>
			<input class="button defaultButton" style="width: 100%;" type="button" value="&larr;" onclick="jumpList(this.form.elements['blockSelectRightWidget'],this.form.elements['blockUnselectedWidget']);" /><br/>
			<input class="button defaultButton" style="width: 100%;" type="button" value="&rarr;" onclick="jumpList(this.form.elements['blockUnselectedWidget'],this.form.elements['blockSelectRightWidget']);" />
		</td>
		<td rowspan="2" id="assignBlocksToSidebarRight" style="width: 30%;">
			{fieldLabel name="blockSelectRightWidget" key="manager.setup.layout.rightSidebar"}<br/>
			<input class="button defaultButton" style="width: 100%;" type="button" value="&uarr;" onclick="moveUp(this.form.elements['blockSelectRightWidget']);" /><br/>
			<select name="blockSelectRightWidget" id="blockSelectRightWidget" multiple="multiple" size="10" class="form-control" style="width: 100%; height:200px" >
				{foreach from=$rightBlockPlugins item=block}
					<option value="{$block->getName()|escape}">{$block->getDisplayName()|escape}</option>
				{foreachelse}
					<option value=""></option>
				{/foreach}
			</select><br/>
			<input class="button defaultButton" style="width: 100%;" type="button" value="&darr;" onclick="moveDown(this.form.elements['blockSelectRightWidget']);" />
		</td>
	</tr>
	<tr align="center">
		<td colspan="3" valign="top" height="60px">
			<input class="button defaultButton" style="width: 100%;" type="button" value="&larr;" onclick="jumpList(this.form.elements['blockSelectRightWidget'],this.form.elements['blockSelectLeftWidget']);" /><br/>
			<input class="button defaultButton" style="width: 100%;" type="button" value="&rarr;" onclick="jumpList(this.form.elements['blockSelectLeftWidget'],this.form.elements['blockSelectRightWidget']);" />
		</td>
	</tr>
</table>

<input type="hidden" name="blockSelectLeft" value="" />
<input type="hidden" name="blockSelectRight" value="" />
<input type="hidden" name="blockUnselected" value="" />
</div>

<div id="setupInfo"  class="tab-pane fade">
<h3>5.7 {translate key="manager.setup.information"}</h3>

<p>{translate key="manager.setup.information.description"}</p>

<div id="infoForReaders"><h4>{fieldLabel name="readerInformation" key="manager.setup.information.forReaders"}</h4>

<p><textarea name="readerInformation[{$formLocale|escape}]" id="readerInformation" rows="12" cols="60" class="form-control">{$readerInformation[$formLocale]|escape}</textarea></p></div>

<div id="infoForAuth"><h4>{fieldLabel name="authorInformation" key="manager.setup.information.forAuthors"}</h4>

<p><textarea name="authorInformation[{$formLocale|escape}]" id="authorInformation" rows="12" cols="60" class="form-control">{$authorInformation[$formLocale]|escape}</textarea></p></div>

<div id="infoForLibs"><h4>{fieldLabel name="librarianInformation" key="manager.setup.information.forLibrarians"}</h4>

<p><textarea name="librarianInformation[{$formLocale|escape}]" id="librarianInformation" rows="12" cols="60" class="form-control">{$librarianInformation[$formLocale]|escape}</textarea></p></div>
</div>



<div id="lists"  class="tab-pane fade">
<h3>5.8 {translate key="manager.setup.lists"}</h3>
<p>{translate key="manager.setup.listsDescription"}</p>

	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="itemsPerPage" key="manager.setup.itemsPerPage"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" size="3" name="itemsPerPage" id="itemsPerPage" class="form-control" value="{$itemsPerPage|escape}" />
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="numPageLinks" key="manager.setup.numPageLinks"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="text" size="3" name="numPageLinks" id="numPageLinks" class="form-control" value="{$numPageLinks|escape}" />
		</div>
	</div>

</div>



<p><input type="submit" onclick="prepBlockFields()" value="{translate key="common.saveAndContinue"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url op="setup" escape=false}'" /></p>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
</div>
</form>

{include file="common/userfooter.tpl"}
