{**
 * templates/about/editorialTeam.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal index.
 *
 *}
{strip}
{assign var="pageTitle" value="about.editorialTeam"}
{include file="common/header.tpl"}
{/strip}
<div id="editorialTeam">
 
<!-- Modal -->
<div id="modal" class="modal hide" tabindex="-1" role="dialog" >
  <div class="modal-body">
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal">Close</button>
  </div>
</div>
{if count($editors) > 0}
  <div id="editors">
    <div class="bs-example">
	<div class="panel-group" id="accordion">
	{if count($editors) == 1}
		<h3 class="mycustom-background">{translate key="user.role.editor"}</h3>
	{else}
		<h3 class="mycustom-background">{translate key="user.role.editors"}</h3>
	{/if}

	<div class="editorialTeam">
		{foreach from=$editors item=editor}{*url op="editorialTeamBio" path=$editor->getId()*}
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row-fluid">
						<div class="col-md-11 col-sm-11 col-xs-11 heading-text">
							<strong>{$editor->getFullName()|escape}</strong>
							{if $editor->getLocalizedAffiliation()}, {$editor->getLocalizedAffiliation()|escape}{/if}
							{if $editor->getCountry()}{assign var=countryCode value=$editor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}
						</div>
						<div class="col-md-1 col-sm-1 col-xs-1 heading-icon">
							<a class="collapsed" data-toggle="collapse" aria-expanded="true" data-parent="#accordion" aria-controls="editor{$editor->getId()}" href="#editor{$editor->getId()}" ><i class="fa fa-chevron-up text-muted"></i></a>
						</div>
					</div>
				</div>
				<div id="editor{$editor->getId()}" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="row-fluid">
							<div class="col-md-2 col-sm-2 col-xs-2">
								{assign var="profileImage" value=$editor->getSetting('profileImage')}
								{if $profileImage}
									<img height="{$profileImage.height|escape}" width="{$profileImage.width|escape}" alt="{translate key="user.profile.profileImage"}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
								{/if}
							</div>
							<div class="col-md-10 col-sm-10 col-xs-10">
							
							<p>{$editor->getLocalizedBiography()|nl2br|strip_unsafe_html}</p>
							<p>{if $editor->getUrl()}<a href="{$editor->getUrl()|escape:"quotes"}" target="_new">{$editor->getUrl()|escape}</a>{/if}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	</div>
      </div>
    </div>
  </div>
{/if}

{if count($sectionEditors) > 0}
	<div id="sectionEditors">
	{if count($sectionEditors) == 1}
		<h3 class="mycustom-background">{translate key="user.role.sectionEditor"}</h3>
	{else}
		<h3 class="mycustom-background">{translate key="user.role.sectionEditors"}</h3>
	{/if}

	<div class="editorialTeam panel-group">
		{foreach from=$sectionEditors item=sectionEditor}
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row-fluid">
						<div class="col-md-11 col-sm-11 col-xs-11 heading-text">
							<strong>{$sectionEditor->getFullName()|escape}</strong>
							{if $sectionEditor->getLocalizedAffiliation()}, {$sectionEditor->getLocalizedAffiliation()|escape}{/if}
							{if $sectionEditor->getCountry()}{assign var=countryCode value=$sectionEditor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}
						</div>
						<div class="col-md-1 col-sm-1 col-xs-1 heading-icon">
							<a class="collapsed" data-toggle="collapse" aria-expanded="true" data-parent="#accordion" aria-controls="sectionEditor{$sectionEditor->getId()}" href="#sectionEditor{$sectionEditor->getId()}" ><i class="fa fa-chevron-up text-muted"></i></a>
						</div>
					</div>
				</div>
				<div id="sectionEditor{$sectionEditor->getId()}" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="row-fluid">
							<div class="col-md-2 col-sm-2 col-xs-2">
								{assign var="profileImage" value=$sectionEditor->getSetting('profileImage')}
								{if $profileImage}
									<img height="{$profileImage.height|escape}" width="{$profileImage.width|escape}" alt="{translate key="user.profile.profileImage"}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
								{/if}
							</div>
							<div class="col-md-10 col-sm-10 col-xs-10">
							<p>{$sectionEditor->getLocalizedBiography()|nl2br|strip_unsafe_html}</p>
							<p>{if $sectionEditor->getUrl()}<a href="{$sectionEditor->getUrl()|escape:"quotes"}" target="_new">{$sectionEditor->getUrl()|escape}</a>{/if}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	</div>
	</div>
{/if}

{if count($layoutEditors) > 0}
	<div id="layoutEditors" class="panel-group">
	{if count($layoutEditors) == 1}
		<h3 class="mycustom-background">{translate key="user.role.layoutEditor"}</h3>
	{else}
		<h3 class="mycustom-background">{translate key="user.role.layoutEditors"}</h3>
	{/if}

	<div class="editorialTeam">
		{foreach from=$layoutEditors item=layoutEditor}
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row-fluid">
						<div class="span11">
							<strong>{$layoutEditor->getFullName()|escape}</strong>{if $layoutEditor->getLocalizedAffiliation()}, {$layoutEditor->getLocalizedAffiliation()|escape}{/if}{if $layoutEditor->getCountry()}{assign var=countryCode value=$layoutEditor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}
						</div>
						<div class="span1">
							<a class="collapsed" data-toggle="collapse" aria-expanded="true" data-parent="#accordion" aria-controls="layoutEditor{$layoutEditor->getId()}" href="#layoutEditor{$layoutEditor->getId()}" ><i class="fa fa-chevron-up text-muted"></i></a>
						</div>
					</div>
				</div>
				<div id="layoutEditor{$layoutEditor->getId()}" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="row-fluid">
							<div class="col-md-2 col-sm-2 col-xs-2">
								{assign var="profileImage" value=$layoutEditor->getSetting('profileImage')}
								{if $profileImage}
									<img height="{$profileImage.height|escape}" width="{$profileImage.width|escape}" alt="{translate key="user.profile.profileImage"}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
								{/if}
							</div>
							<div class="col-md-10 col-sm-10 col-xs-10">
							<p>
								{if $layoutEditor->getUrl()}<a href="{$layoutEditor->getUrl()|escape:"quotes"}" target="_new">{$layoutEditor->getUrl()|escape}</a><br/>{/if}
								
							</p>
							
							<p>{$layoutEditor->getLocalizedBiography()|nl2br|strip_unsafe_html}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	</div>
	</div>
{/if}

{if count($copyEditors) > 0}
	<div id="copyEditors" class="panel-group">
	{if count($copyEditors) == 1}
		<h3 class="mycustom-background">{translate key="user.role.copyeditor"}</h3>
	{else}
		<h3 class="mycustom-background">{translate key="user.role.copyeditors"}</h3>
	{/if}

	<div class="editorialTeam">
		{foreach from=$copyEditors item=copyEditor}
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row-fluid">
						<div class="span11">
							<strong>{$copyEditor->getFullName()|escape}</strong>{if $copyEditor->getLocalizedAffiliation()}, {$copyEditor->getLocalizedAffiliation()|escape}{/if}{if $copyEditor->getCountry()}{assign var=countryCode value=$copyEditor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}
						</div>
						<div class="span1">
							<a class="collapsed" data-toggle="collapse" aria-expanded="true" data-parent="#accordion" aria-controls="copyEditor{$copyEditor->getId()}" href="#copyEditor{$copyEditor->getId()}" ><i class="fa fa-chevron-up text-muted"></i></a>
						</div>
					</div>
				</div>
				<div id="copyEditor{$copyEditor->getId()}" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="row-fluid">
							<div class="span2">
								{assign var="profileImage" value=$copyEditor->getSetting('profileImage')}
								{if $profileImage}
									<img height="{$profileImage.height|escape}" width="{$profileImage.width|escape}" alt="{translate key="user.profile.profileImage"}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
								{/if}
							</div>
							<div class="span10">
							<p>{$copyEditor->getLocalizedBiography()|nl2br|strip_unsafe_html}</p>
							<p>{if $copyEditor->getUrl()}<a href="{$copyEditor->getUrl()|escape:"quotes"}" target="_new">{$copyEditor->getUrl()|escape}</a>{/if}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	</div>
	</div>
{/if}

{if count($proofreaders) > 0}
	<div id="proofreaders" class="panel-group">
	{if count($proofreaders) == 1}
		<h3 class="mycustom-background">{translate key="user.role.proofreader"}</h3>
	{else}
		<h3 class="mycustom-background">{translate key="user.role.proofreaders"}</h3>
	{/if}

	<div class="editorialTeam">
		{foreach from=$proofreaders item=proofreader}
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row-fluid">
						<div class="span11">
							<strong>{$proofreader->getFullName()|escape}</strong>{if $proofreader->getLocalizedAffiliation()}, {$proofreader->getLocalizedAffiliation()|escape}{/if}{if $proofreader->getCountry()}{assign var=countryCode value=$proofreader->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}
						</div>
						<div class="span1">
							<a class="collapsed" data-toggle="collapse" aria-expanded="true" data-parent="#accordion" aria-controls="proofreader{$proofreader->getId()}" href="#proofreader{$proofreader->getId()}" ><i class="fa fa-chevron-up text-muted"></i></a>
						</div>
					</div>
				</div>
				<div id="proofreader{$proofreader->getId()}" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="row-fluid">
							<div class="span2">
								{assign var="profileImage" value=$proofreader->getSetting('profileImage')}
								{if $profileImage}
									<img height="{$profileImage.height|escape}" width="{$profileImage.width|escape}" alt="{translate key="user.profile.profileImage"}" src="{$sitePublicFilesDir}/{$profileImage.uploadName}" />
								{/if}
							</div>
							<div class="span10">
							<p>{$proofreader->getLocalizedBiography()|nl2br|strip_unsafe_html}</p>
							<p>{if $proofreader->getUrl()}<a href="{$proofreader->getUrl()|escape:"quotes"}" target="_new">{$proofreader->getUrl()|escape}</a>{/if}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	</div>
	</div>
{/if}
</div>

{include file="common/footer.tpl"}

