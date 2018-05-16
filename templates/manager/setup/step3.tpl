{**
 * templates/manager/setup/step3.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 3 of journal setup.
 *}
{assign var="pageTitle" value="manager.setup.guidingSubmissions"}
{include file="manager/setup/setupHeader.tpl"}
{include file="manager/setup/script/js3.tpl"}

<form name="setupForm" id="setupForm" method="post" action="{url op="saveSetup" path="3"}">
{include file="common/formErrors.tpl"}

{if count($formLocales) > 1}
<div id="locale">
	<div class="form-group clearfix">
		<td width="20%" class="label">
			{fieldLabel name="formLocale" key="form.formLanguage"}
		</td>
		<td width="80%" class="value">
			{url|assign:"setupFormUrl" op="setup" path="3" escape=false}
			{form_language_chooser form="setupForm" url=$setupFormUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</td>
	</div>
</div>
{/if}
<ul class="nav nav-tabs ">
  <li class="active"><a data-toggle="tab" href="#authorGuidelinesInfo" class="tab-0">{translate key="manager.setup.authorGuidelines"}</a></li>
  <li><a data-toggle="tab" href="#permissions" class="tab-1">{translate key="submission.permissions"}</a></li>
  <li><a data-toggle="tab" href="#competingInterests" class="tab-2">{translate key="manager.setup.competingInterests"}</a></li>
  <li><a data-toggle="tab" href="#forAuthorsToIndexTheirWork" class="tab-3">{translate key="manager.setup.forAuthorsToIndexTheirWork"}</a></li>
  <li><a data-toggle="tab" href="#registerJournalForIndexing" class="tab-4">{translate key="manager.setup.registerJournalForIndexing"}</a></li>
  <li><a data-toggle="tab" href="#notifications" class="tab-5">{translate key="manager.setup.notifications"}</a></li>
  <li><a data-toggle="tab" href="#citationAssistant" class="tab-6">{translate key="manager.setup.citationAssistant"}</a></li>
</ul>
<div class="col-lg-12 has-error"></div>
<div class="tab-content">
<div id="authorGuidelinesInfo"   class="tab-pane fade in active">
<div id="authorGuidelinesInfo-old">
<h3>3.1 {fieldLabel name="authorGuidelines" key="manager.setup.authorGuidelines"}</h3>

<p>{translate key="manager.setup.authorGuidelinesDescription"}</p>

<p>
	<textarea name="authorGuidelines[{$formLocale|escape}]" id="authorGuidelines" rows="12" cols="60" class="form-control">{$authorGuidelines[$formLocale]|escape}</textarea>
</p>

</div>

<div id="submissionPreparationChecklist">
<h4>{translate key="manager.setup.submissionPreparationChecklist"}</h4>

<p>{translate key="manager.setup.submissionPreparationChecklistDescription"}</p>

{foreach name=checklist from=$submissionChecklist[$formLocale] key=checklistId item=checklistItem}
	{if !$notFirstChecklistItem}
		{assign var=notFirstChecklistItem value=1}
		<div class="form-group clearfix">
			<div class="control-label col-sm-1 col-md-1 col-lg-1">
				{translate key="common.order"}
			</div>
			<div class="col-sm-11 col-md-11 col-lg-11 value"></div>
		</div>
	{/if}

	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
			<input type="text" name="submissionChecklist[{$formLocale|escape}][{$checklistId|escape}][order]" value="{$checklistItem.order|escape}" size="3" maxlength="2" class="form-control" />
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<textarea name="submissionChecklist[{$formLocale|escape}][{$checklistId|escape}][content]" id="submissionChecklist-{$checklistId|escape}" rows="3" cols="40" class="form-control">{$checklistItem.content|escape}</textarea>
		</div>
		<div class="col-sm-2 col-md-2 col-lg-2 value">
			<input type="submit" name="delChecklist[{$checklistId|escape}]" value="{translate key="common.delete"}" class="button" />
		</div>
	</div>
{/foreach}

{if $notFirstChecklistItem}
	
{/if}

<p><input type="submit" name="addChecklist" value="{translate key="manager.setup.addChecklistItem"}" class="button" /></p>
</div>

</div>

<div id="permissions"  class="tab-pane fade">
<h3>3.2 {translate key="submission.permissions"}</h3>

<h4>{fieldLabel name="copyrightNotice" key="manager.setup.authorCopyrightNotice"}</h4>
{url|assign:"sampleCopyrightWordingUrl" page="information" op="sampleCopyrightWording"}
<p>{translate key="manager.setup.authorCopyrightNoticeDescription" sampleCopyrightWordingUrl=$sampleCopyrightWordingUrl}</p>

<p><textarea name="copyrightNotice[{$formLocale|escape}]" id="copyrightNotice" rows="12" cols="60" class="form-control">{$copyrightNotice[$formLocale]|escape}</textarea></p>


	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{translate key="submission.copyrightHolder"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="radio" value="author" name="copyrightHolderType" {if $copyrightHolderType=="author"}checked="checked" {/if}id="copyrightHolderType-author" />&nbsp;<label for="copyrightHolderType-author">{translate key="user.role.author"}</label>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3"></div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="radio" value="journal" name="copyrightHolderType" {if $copyrightHolderType=="journal"}checked="checked" {/if}id="copyrightHolderType-journal" />&nbsp;<label for="copyrightHolderType-journal">{translate key="journal.journal"}</label> ({$currentJournal->getLocalizedTitle()|escape})
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3"></div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="radio" value="other" name="copyrightHolderType" {if $copyrightHolderType=="other"}checked="checked" {/if}id="copyrightHolderType-other" />&nbsp;<label for="copyrightHolderType-other">{translate key="common.other"}</label>&nbsp;&nbsp;<input type="text" name="copyrightHolderOther[{$formLocale|escape}]" id="copyrightHolderOther" value="{$copyrightHolderOther[$formLocale]|escape}" />
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{translate key="manager.setup.copyrightYearBasis"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="radio" value="issue" name="copyrightYearBasis" {if $copyrightYearBasis=="issue"}checked="checked" {/if}id="copyrightYearBasis-issue" />&nbsp;<label for="copyrightYearBasis-issue">{translate key="issue.issue"}</label> ({translate key="manager.setup.copyrightYearBasis.Issue"})
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3"></div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="radio" value="article" name="copyrightYearBasis" {if $copyrightYearBasis=="article"}checked="checked" {/if}id="copyrightYearBasis-article" />&nbsp;<label for="copyrightYearBasis-article">{translate key="article.article"}</label> ({translate key="manager.setup.copyrightYearBasis.Article"})
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{translate key="manager.setup.permissions.priorAgreement"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="checkbox" name="copyrightNoticeAgree" id="copyrightNoticeAgree" value="1"{if $copyrightNoticeAgree} checked="checked"{/if} />&nbsp;<label for="copyrightNoticeAgree">{translate key="manager.setup.authorCopyrightNoticeAgree"}</label>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{translate key="manager.setup.permissions.display"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="checkbox" name="includeCopyrightStatement" id="includeCopyrightStatement" value="1"{if $includeCopyrightStatement} checked="checked"{/if} />&nbsp;<label for="includeCopyrightStatement">{translate key="manager.setup.includeCopyrightStatement"}</label>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{fieldLabel name="licenseURLSelect" key="submission.licenseURL"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<select name="licenseURLSelect" id="licenseURLSelect" onchange="document.getElementById('licenseURL').value=document.getElementById('licenseURLSelect').options[document.getElementById('licenseURLSelect').selectedIndex].value; document.getElementById('licenseURL').readOnly=(document.getElementById('licenseURL').value==''?false:true);">
				{assign var=foundCc value=0}
				{foreach from=$ccLicenseOptions key=ccUrl item=ccNameKey}
					<option {if $licenseURL == $ccUrl}selected="selected" {/if}value="{$ccUrl|escape}">{$ccNameKey|translate}</option>
					{if $licenseURL == $ccUrl}
						{assign var=foundCc value=1}
					{/if}
				{/foreach}
				<option {if !$foundCc}selected="selected" {/if}value="">Other</option>
			</select>
			<br/>
			<input type="text" name="licenseURL" id="licenseURL" value="{$licenseURL|escape}" {if $foundCc}readonly="readonly" {/if}size="40" maxlength="255" class="form-control" />
			<br/>
			{fieldLabel name="licenseURL" key="manager.setup.licenseURLDescription"}
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-3 col-md-3 col-lg-3">
			{translate key="manager.setup.permissions.display"}
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9 value">
			<input type="checkbox" name="includeLicense" id="includeLicense" value="1"{if $includeLicense} checked="checked"{/if} />&nbsp;<label for="includeLicense">{translate key="manager.setup.includeLicense"}</label>
		</div>
	</div>
</table>

<p>{translate key="manager.setup.resetPermissions.description"}</p>
<p><input id="resetPermissionsButton" type="button" value="{translate key="manager.setup.resetPermissions"}" class="button" /></p>
</div>

<div class="separator"></div>

<div id="competingInterests"   class="tab-pane fade">
<h3>3.3 {translate key="manager.setup.competingInterests"}</h3>

<p>{translate key="manager.setup.competingInterests.description"}</p>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
			<input type="checkbox" name="requireAuthorCompetingInterests" id="requireAuthorCompetingInterests" value="1"{if $requireAuthorCompetingInterests} checked="checked"{/if} />
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<label for="requireAuthorCompetingInterests">{translate key="manager.setup.competingInterests.requireAuthors"}</label>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
			<input type="checkbox" name="requireReviewerCompetingInterests" id="requireReviewerCompetingInterests" value="1"{if $requireReviewerCompetingInterests} checked="checked"{/if} />
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<label for="requireReviewerCompetingInterests">{translate key="manager.setup.competingInterests.requireReviewers"}</label>
		</div>
	</div>

<h4>{fieldLabel name="competingInterestGuidelines" key="manager.setup.competingInterests.guidelines"}</h4>
<p><textarea name="competingInterestGuidelines[{$formLocale|escape}]" id="competingInterestGuidelines" rows="12" cols="60" class="form-control">{$competingInterestGuidelines[$formLocale]|escape}</textarea></p>
</div>

<div class="separator"></div>

<div id="forAuthorsToIndexTheirWork"   class="tab-pane fade">
<h3>3.4 {translate key="manager.setup.forAuthorsToIndexTheirWork"}</h3>

<p>{translate key="manager.setup.forAuthorsToIndexTheirWorkDescription"}</p>


	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
			<input type="checkbox" name="metaDiscipline" id="metaDiscipline" value="1"{if $metaDiscipline} checked="checked"{/if} />
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<h4>{fieldLabel name="metaDiscipline" key="manager.setup.discipline"}</h4>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<span class="instruct">{translate key="manager.setup.disciplineDescription"}</span><br/>
			<span class="instruct">{translate key="manager.setup.disciplineProvideExamples"}:</span>
			<br />
			<input type="text" name="metaDisciplineExamples[{$formLocale|escape}]" id="metaDisciplineExamples" value="{$metaDisciplineExamples[$formLocale]|escape}" size="60" class="form-control" />
			<br />
			<span class="instruct">{fieldLabel name="metaDisciplineExamples" key="manager.setup.disciplineExamples"}</span>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
			<input type="checkbox" name="metaSubjectClass" id="metaSubjectClass" value="1"{if $metaSubjectClass} checked="checked"{/if} />
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<h4>{fieldLabel name="metaSubjectClass" key="manager.setup.subjectClassification"}</h4>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<table width="100%">
				<tr valign="top">
					<td width="10%">{fieldLabel name="metaSubjectClassTitle" key="common.title"}</td>
					<td width="90%"><input type="text" name="metaSubjectClassTitle[{$formLocale|escape}]" id="metaSubjectClassTitle" value="{$metaSubjectClassTitle[$formLocale]|escape}" size="40" class="form-control" /></td>
				</tr>
				<tr valign="top">
					<td width="10%">{fieldLabel name="metaSubjectClassUrl" key="common.url"}</td>
					<td width="90%"><input type="text" name="metaSubjectClassUrl[{$formLocale|escape}]" id="metaSubjectClassUrl" value="{$metaSubjectClassUrl[$formLocale]|escape}" size="40" class="form-control" /></td>
				</tr>
			</table>
			<span class="instruct">{translate key="manager.setup.subjectClassificationExamples"}</span>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
			<input type="checkbox" name="metaSubject" id="metaSubject" value="1"{if $metaSubject} checked="checked"{/if} />
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<h4>{fieldLabel name="metaSubject" key="manager.setup.subjectKeywordTopic"}</h4>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<span class="instruct">{translate key="manager.setup.subjectProvideExamples"}:</span>
			<br />
			<input type="text" name="metaSubjectExamples[{$formLocale|escape}]" id="metaSubjectExamples" value="{$metaSubjectExamples[$formLocale]|escape}" size="60" class="form-control" />
			<br />
			<span class="instruct">{fieldLabel name="metaSubjectExamples" key="manager.setup.subjectExamples"}</span>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
			<input type="checkbox" name="metaCoverage" id="metaCoverage" value="1"{if $metaCoverage} checked="checked"{/if} />
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<h4>{fieldLabel name="metaCoverage" key="manager.setup.coverage"}</h4>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<span class="instruct">{translate key="manager.setup.coverageDescription"}</span><br/>
			<span class="instruct">{translate key="manager.setup.coverageGeoProvideExamples"}:</span>
			<br />
			<input type="text" name="metaCoverageGeoExamples[{$formLocale|escape}]" id="metaCoverageGeoExamples" value="{$metaCoverageGeoExamples[$formLocale]|escape}" size="60" class="form-control" />
			<br />
			<span class="instruct">{fieldLabel name="metaCoverageGeoExamples" key="manager.setup.coverageGeoExamples"}</span>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<span class="instruct">{translate key="manager.setup.coverageChronProvideExamples"}:</span>
			<br />
			<input type="text" name="metaCoverageChronExamples[{$formLocale|escape}]" id="metaCoverageChronExamples" value="{$metaCoverageChronExamples[$formLocale]|escape}" size="60" class="form-control" />
			<br />
			<span class="instruct">{fieldLabel name="metaCoverageChronExamples" key="manager.setup.coverageChronExamples"}</span>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<span class="instruct">{translate key="manager.setup.coverageResearchSampleProvideExamples"}:</span>
			<br />
			<input type="text" name="metaCoverageResearchSampleExamples[{$formLocale|escape}]" id="metaCoverageResearchSampleExamples" value="{$metaCoverageResearchSampleExamples[$formLocale]|escape}" size="60" class="form-control" />
			<br />
			<span class="instruct">{fieldLabel name="metaCoverageResearchSampleExamples" key="manager.setup.coverageResearchSampleExamples"}</span>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
			<input type="checkbox" name="metaType" id="metaType" value="1"{if $metaType} checked="checked"{/if} />
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<h4>{fieldLabel name="metaType" key="manager.setup.typeMethodApproach"}</h4>
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			<span class="instruct">{translate key="manager.setup.typeProvideExamples"}:</span>
			<br />
			<input type="text" name="metaTypeExamples[{$formLocale|escape}]" id="metaTypeExamples" value="{$metaTypeExamples[$formLocale]|escape}" size="60" class="form-control" />
			<br />
			<span class="instruct">{fieldLabel name="metaTypeExamples" key="manager.setup.typeExamples"}</span>
		</div>
	</div>

</div>

<div class="separator"></div>

<div id="registerJournalForIndexing"   class="tab-pane fade">
<h3>3.5 {translate key="manager.setup.registerJournalForIndexing"}</h3>

{url|assign:"oaiUrl" page="oai"}
<p>{translate key="manager.setup.registerJournalForIndexingDescription" oaiUrl=$oaiUrl siteUrl=$baseUrl}</p>
</div>

<div class="separator"></div>

<div id="notifications"  class="tab-pane fade">
<h3>3.6 {translate key="manager.setup.notifications"}</h3>

<p>{translate key="manager.setup.notifications.description"}</p>

	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
			<input {if !$submissionAckEnabled}disabled="disabled" {/if}type="checkbox" name="copySubmissionAckPrimaryContact" id="copySubmissionAckPrimaryContact" value="true" {if $copySubmissionAckPrimaryContact}checked="checked"{/if}/>
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			{fieldLabel name="copySubmissionAckPrimaryContact" key="manager.setup.notifications.copyPrimaryContact"}
		</div>
	</div>
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1">
			<input {if !$submissionAckEnabled}disabled="disabled" {/if}type="checkbox" name="copySubmissionAckSpecified" id="copySubmissionAckSpecified" value="true" {if $copySubmissionAckSpecified}checked="checked"{/if}/>
		</div>
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			{fieldLabel name="copySubmissionAckSpecified" key="manager.setup.notifications.copySpecifiedAddress"}<br/>
			{fieldLabel name="copySubmissionAckAddress" key="user.email"}&nbsp;&nbsp;<input {if !$submissionAckEnabled}disabled="disabled" {/if}type="text" class="form-control" id="copySubmissionAckAddress" name="copySubmissionAckAddress" value="{$copySubmissionAckAddress|escape}"/>
		</div>
	</div>
	{if !$submissionAckEnabled}
	<div class="form-group clearfix">
		<div class="control-label col-sm-1 col-md-1 col-lg-1"></div>
		{url|assign:"preparedEmailsUrl" op="emails"}
		<div class="col-sm-11 col-md-11 col-lg-11 value">
			{translate key="manager.setup.notifications.submissionAckDisabled" preparedEmailsUrl=$preparedEmailsUrl}
		</div>
	</div>
	{/if}

</div>

<div class="separator"></div>

<div id="citationAssistant"  class="tab-pane fade">
<h3>3.7 {translate key="manager.setup.citationAssistant"}</h3>

<a name="metaCitationEditing"></a>
{if $citationEditorError}
	<p>{translate key=$citationEditorError}</p>
{else}
	<p>{translate key="manager.setup.metaCitationsDescription"}</p>
	<table width="100%" class="data">
		<tr valign="top">
			<td width="5%" class="label">
				<input type="checkbox" name="metaCitations" id="metaCitations" value="1"{if $metaCitations} checked="checked"{/if} />
			</td>
			<td width="95%" class="value"><label for="metaCitations">{translate key="manager.setup.citations"}</label>
			</td>
		</tr>
	</table>

	<div id="citationFilterSetupToggle" {if !$metaCitations}style="visible: none"{/if}>
		<h4>{translate key="manager.setup.citationFilterParser"}</h4>
		<p>{translate key="manager.setup.citationFilterParserDescription"}</p>
		{load_url_in_div id="parserFilterGridContainer" loadMessageId="manager.setup.filter.parser.grid.loadMessage" url="$parserFilterGridUrl"}

		<h4>{translate key="manager.setup.citationFilterLookup"}</h4>
		<p>{translate key="manager.setup.citationFilterLookupDescription"}</p>
		{load_url_in_div id="lookupFilterGridContainer" loadMessageId="manager.setup.filter.lookup.grid.loadMessage" url="$lookupFilterGridUrl"}
		<h4>{translate key="manager.setup.citationOutput"}</h4>
		<p>{translate key="manager.setup.citationOutputStyleDescription"}</p>
		{fbvElement type="select" id="metaCitationOutputFilterSelect" name="metaCitationOutputFilterId"
				from=$metaCitationOutputFilters translate=false selected=$metaCitationOutputFilterId|escape
				defaultValue="-1" defaultLabel="manager.setup.filter.pleaseSelect"|translate}
	</div>
	{literal}<script type='text/javascript'>
		$(function(){ 
			// jQuerify DOM elements
			$metaCitationsCheckbox = $('#metaCitations');
			$metaCitationsSetupBox = $('#citationFilterSetupToggle');

			// Set the initial state
			initialCheckboxState = $metaCitationsCheckbox.attr('checked');
			if (initialCheckboxState) {
				$metaCitationsSetupBox.css('display', 'block');
			} else {
				$metaCitationsSetupBox.css('display', 'none');
			}

			// Toggle the settings box.
			// NB: Has to be click() rather than change() to work in IE.
			$metaCitationsCheckbox.click(function(){
				checkboxState = $metaCitationsCheckbox.attr('checked');
				toggleState = ($metaCitationsSetupBox.css('display') === 'block');
				if (checkboxState !== toggleState) {
					$metaCitationsSetupBox.toggle(300);
				}
			});
		});
		
		function permissionsValues() {
			perm = ':';
			licenseNames = ["copyrightYearBasis", "copyrightHolderType"];
			for (l = 0; l < licenseNames.length; l++) {
				ele = document.getElementsByName(licenseNames[l]);
				for (i = 0; i < ele.length; i++) {
					if (ele[i].type == 'radio') {
						if (ele[i].checked) {
							perm += ele[i].value + ':';
							break;
						}
					} else {
						perm += ele[i].value + ':';
					}
				}
			};
			licenseIds = ["copyrightHolderOther", "licenseURL"];
			for (l = 0; l < licenseIds.length; l++) {
				ele = document.getElementById(licenseIds[l]);
				if (ele) {
					perm += ele.value + ':';
				}
			}
			return perm;
		}
		var resetValues;
		$(document).ready( function () {
			resetValues = permissionsValues();
			$('#resetPermissionsButton').click( function ( event ) {
				if (resetValues == permissionsValues()) {
					{/literal}
					confirmAction('{url op="resetPermissions"}', '{translate|escape:"jsparam" key="manager.setup.confirmResetLicense"}');
					{literal}
				} else {
					{/literal}
					window.alert('{translate|escape:"jsparam" key="manager.setup.confirmResetLicenseChanged"}')
					{literal}
				}
				event.preventDefault();
			});
		});
	</script>{/literal}
{/if}
</div>

</div>
<div class="separator"></div>

<p><input type="submit" value="{translate key="common.user.update"}" class="btn btn-success btn-sm" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url op="setup" escape=false}'" /></p>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

</form>

{include file="common/userfooter.tpl"}
