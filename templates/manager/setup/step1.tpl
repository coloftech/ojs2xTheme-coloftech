{**
 * templates/manager/setup/step1.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 1 of journal setup.
 *
 *}
{assign var="pageTitle" value="manager.setup.gettingDownTheDetails"}
{include file="manager/setup/setupHeader.tpl"}

{include file="manager/setup/script/js1.tpl"}
<div class="row step1">
	<div class="col-lg-12">
		<form id="setupForm" method="post" action="{url op="saveSetup" path="1"}">
		{include file="common/formErrors.tpl"}
		
		{if count($formLocales) > 1}
		<div id="locales">
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="formLocale" key="form.formLanguage"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					{url|assign:"setupFormUrl" op="setup" path="1" escape=false}
					{form_language_chooser form="setupForm" url=$setupFormUrl}
					<span class="instruct">{translate key="form.formLanguage.description"}</span>
				</div>
			</div>
		</div>
		{/if}

<ul class="nav nav-tabs ">
  <li class="active"><a data-toggle="tab" href="#generalInformation" class="tab-0">{translate key="manager.setup.geninfo"}</a></li>
  <li><a data-toggle="tab" href="#principalContact" class="tab-1">{translate key="manager.setup.principal"}</a></li>
  <li><a data-toggle="tab" href="#technicalSupportContact" class="tab-2">{translate key="manager.setup.technical"}</a></li>
  <li><a data-toggle="tab" href="#setupEmails" class="tab-3">{translate key="manager.setup.email"}</a></li>
  <li><a data-toggle="tab" href="#setupPublisher" class="tab-4">{translate key="manager.setup.publisher"}</a></li>
  <li><a data-toggle="tab" href="#sponsors" class="tab-5">{translate key="manager.setup.sponsor"}</a></li>
  <li><a data-toggle="tab" href="#contributors" class="tab-6">{translate key="manager.setup.contributor"}</a></li>
  <li><a data-toggle="tab" href="#searchEngineIndexing" class="tab-7">{translate key="manager.setup.indexing"}</a></li>
  <li><a data-toggle="tab" href="#history" class="tab-8">{translate key="manager.setup.jhistory"}</a></li>
</ul>
<div class="col-lg-12 has-error"></div>
<div class="tab-content">

		<div id="generalInformation" class="tab-pane fade in active">
			<h3>1.1 {translate key="manager.setup.generalInformation"}</h3>
			
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="title" required="true" key="manager.setup.journalTitle"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
						<input type="text" name="title[{$formLocale|escape}]" id="title" value="{$title[$formLocale]|escape}" size="40" maxlength="120" class="form-control" required />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="initials" required="true" key="manager.setup.journalInitials"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
						<input type="text" name="initials[{$formLocale|escape}]" id="initials" value="{$initials[$formLocale]|escape}" size="8" maxlength="16" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="abbreviation" key="manager.setup.journalAbbreviation"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
						<input type="text" name="abbreviation[{$formLocale|escape}]" id="abbreviation" value="{$abbreviation[$formLocale]|escape}" size="40" maxlength="120" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="printIssn" key="manager.setup.printIssn"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
						<input type="text" name="printIssn" id="printIssn" value="{$printIssn|escape}" size="8" maxlength="16" class="form-control" />
				</div>
				</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="onlineIssn" key="manager.setup.onlineIssn"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
						<input type="text" name="onlineIssn" id="onlineIssn" value="{$onlineIssn|escape}" size="8" maxlength="16" class="form-control" />
						<br />
						<span class="instruct">{translate key="manager.setup.issnDescription"}</span>
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="mailingAddress" key="common.mailingAddress"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
						<textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="form-control">{$mailingAddress|escape}</textarea>
						<br />
						<span class="instruct">{translate key="manager.setup.mailingAddressDescription"}</span>
				</div>
			</div>
			{if $categoriesEnabled}
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
						{fieldLabel name=categories key="manager.setup.categories"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
							<select id="categories" name="categories[]" class="form-control" multiple="multiple">
								{html_options options=$allCategories selected=$categories}
							</select>
							<br/>
							{translate key="manager.setup.categories.description"}
				</div>
			</div>
			{/if}{* $categoriesEnabled *}
		</div>

		<div id="principalContact" class="tab-pane fade">
			<h3>1.2 {translate key="manager.setup.principalContact"}</h3>
			
			<p>{translate key="manager.setup.principalContactDescription"}</p>
			
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contactName" key="user.name" required="true"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="contactName" id="contactName" value="{$contactName|escape}" size="30" maxlength="60" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contactTitle" key="user.title"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="contactTitle[{$formLocale|escape}]" id="contactTitle" value="{$contactTitle[$formLocale]|escape}" size="30" maxlength="90" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contactAffiliation" key="user.affiliation"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<textarea name="contactAffiliation[{$formLocale|escape}]" id="contactAffiliation" rows="5" cols="40" class="form-control">{$contactAffiliation[$formLocale]|escape}</textarea>
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contactEmail" key="user.email" required="true"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="contactEmail" id="contactEmail" value="{$contactEmail|escape}" size="30" maxlength="90" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contactPhone" key="user.phone"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="contactPhone" id="contactPhone" value="{$contactPhone|escape}" size="15" maxlength="24" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contactFax" key="user.fax"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="contactFax" id="contactFax" value="{$contactFax|escape}" size="15" maxlength="24" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contactMailingAddress" key="common.mailingAddress"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<textarea name="contactMailingAddress[{$formLocale|escape}]" id="contactMailingAddress" rows="3" cols="40" class="form-control">{$contactMailingAddress[$formLocale]|escape}</textarea>
				</div>
			</div>
		</div>


		
		<div id="technicalSupportContact" class="tab-pane fade">
			<h3>1.3 {translate key="manager.setup.technicalSupportContact"}</h3>
			
			<p>{translate key="manager.setup.technicalSupportContactDescription"}</p>
			
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="supportName" key="user.name" required="true"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="supportName" id="supportName" value="{$supportName|escape}" size="30" maxlength="60" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="supportEmail" key="user.email" required="true"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="supportEmail" id="supportEmail" value="{$supportEmail|escape}" size="30" maxlength="90" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="supportPhone" key="user.phone"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="supportPhone" id="supportPhone" value="{$supportPhone|escape}" size="15" maxlength="24" class="form-control" />
				</div>
			</div>
		</div>
			
		<div id="setupEmails"  class="tab-pane fade">
			<h3>1.4 {translate key="manager.setup.emails"}</h3>
			<div class="form-group clearfix hidden">
				<div class="control-label">
						{translate key="manager.setup.emailHeaderDescription"}<br />&nbsp;
				</div>
			</div>
			<div class="form-group clearfix hidden">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="emailHeader" key="manager.setup.emailHeader"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<textarea name="emailHeader" id="emailHeader" rows="3" cols="60" class="form-control">{$emailHeader|escape}</textarea>
					<div class="instruct">{translate key="manager.setup.emailSignatureDescription"}</div>
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="emailSignature" key="manager.setup.emailSignature"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<textarea name="emailSignature" id="emailSignature" rows="3" cols="60" class="form-control">{$emailSignature|escape}</textarea>
					<div class="instruct">{translate key="manager.setup.emailBounceAddressDescription"}</div>
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="envelopeSender" key="manager.setup.emailBounceAddress"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="envelopeSender" id="envelopeSender" size="40" maxlength="255" class="form-control" {if !$envelopeSenderEnabled}disabled="disabled" value=""{else}value="{$envelopeSender|escape}"{/if} />
					{if !$envelopeSenderEnabled}
					<br />
					<span class="instruct">{translate key="manager.setup.emailBounceAddressDisabled"}</span>
					{/if}
				</div>
			</div>
		</div>
			
		
		<div id="setupPublisher" class="tab-pane fade">
			<h3>1.5 {translate key="manager.setup.publisher"}</h3>
			
			<p>{translate key="manager.setup.publisherDescription"}</p>
			
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="publisherNote" key="manager.setup.note"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<textarea name="publisherNote[{$formLocale|escape}]" id="publisherNote" rows="5" cols="40" class="form-control">{$publisherNote[$formLocale]|escape}</textarea>
					<br/>
					<span class="instruct">{translate key="manager.setup.publisherNoteDescription"}</span>
						
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="publisherInstitution" key="manager.setup.institution"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="publisherInstitution" id="publisherInstitution" value="{$publisherInstitution|escape}" size="40" maxlength="90" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="publisherUrl" key="common.url"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="publisherUrl" id="publisherUrl" value="{$publisherUrl|escape}" size="40" maxlength="255" class="form-control" />
				</div>
			</div>
		</div>
		
		<div id="sponsors" class=" tab-pane fade">
			<h3>1.6 {translate key="manager.setup.sponsors"}</h3>
			
			<p>{translate key="manager.setup.sponsorsDescription"}</p>
			
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="sponsorNote" key="manager.setup.note"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<textarea name="sponsorNote[{$formLocale|escape}]" id="sponsorNote" rows="5" cols="40" class="form-control">{$sponsorNote[$formLocale]|escape}</textarea>
					<br/>
					<span class="instruct">{translate key="manager.setup.sponsorNoteDescription"}</span>
				</div>
			</div>
			{foreach name=sponsors from=$sponsors key=sponsorId item=sponsor}
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="sponsors-$sponsorId-institution" key="manager.setup.institution"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="sponsors[{$sponsorId|escape}][institution]" id="sponsors-{$sponsorId|escape}-institution" value="{$sponsor.institution|escape}" size="40" maxlength="90" class="form-control" />{if $smarty.foreach.sponsors.total > 1} <input type="submit" name="delSponsor[{$sponsorId|escape}]" value="{translate key="common.delete"}" class="button" />{/if}
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="sponsors-$sponsorId-url" key="common.url"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="sponsors[{$sponsorId|escape}][url]" id="sponsors-{$sponsorId|escape}-url" value="{$sponsor.url|escape}" size="40" maxlength="255" class="form-control" />
				</div>
				{if !$smarty.foreach.sponsors.last}
				<div class="separator"></div>
				{/if}
			</div>
				
			{foreachelse}
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="sponsors-0-institution" key="manager.setup.institution"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="sponsors[0][institution]" id="sponsors-0-institution" size="40" maxlength="90" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="sponsors-0-url" key="common.url"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="sponsors[0][url]" id="sponsors-0-url" size="40" maxlength="255" class="form-control" />
				</div>
			</div>
			{/foreach}
			
			<p><input type="submit" name="addSponsor" value="{translate key="manager.setup.addSponsor"}" class="button" /></p>
		</div>


		
		<div id="contributors" class="tab-pane fade">
			<h3>1.7 {translate key="manager.setup.contributors"}</h3>
			
			<p>{translate key="manager.setup.contributorsDescription"}</p>
			
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contributorNote" key="manager.setup.note"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<textarea name="contributorNote[{$formLocale|escape}]" id="contributorNote" rows="5" cols="40" class="form-control">{$contributorNote[$formLocale]|escape}</textarea>
					<br/>
					<span class="instruct">{translate key="manager.setup.contributorNoteDescription"}</span>
				</div>
			</div>
			{foreach name=contributors from=$contributors key=contributorId item=contributor}
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contributors-$contributorId-name" key="manager.setup.contributor"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="contributors[{$contributorId|escape}][name]" id="contributors-{$contributorId|escape}-name" value="{$contributor.name|escape}" size="40" maxlength="90" class="form-control" />{if $smarty.foreach.contributors.total > 1} <input type="submit" name="delContributor[{$contributorId|escape}]" value="{translate key="common.delete"}" class="button" />{/if}
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contributors-$contributorId-url" key="common.url"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="contributors[{$contributorId|escape}][url]" id="contributors-{$contributorId|escape}-url" value="{$contributor.url|escape}" size="40" maxlength="255" class="form-control" />
				</div>
				{if !$smarty.foreach.contributors.last}
				<div class="separator"></div>
				{/if}
			</div>
				
			{foreachelse}
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contributors-0-name" key="manager.setup.contributor"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="contributors[0][name]" id="contributors-0-name" size="40" maxlength="90" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="contributors-0-url" key="common.url"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="contributors[0][url]" id="contributors-0-url" size="40" maxlength="255" class="form-control" />
				</div>
			</div>
			{/foreach}
			
			<p><input type="submit" name="addContributor" value="{translate key="manager.setup.addContributor"}" class="button" /></p>
		</div>
		

		
		<div id="searchEngineIndexing" class="tab-pane fade">
			<h3>1.8 {translate key="manager.setup.searchEngineIndexing"}</h3>
			
			<p>{translate key="manager.setup.searchEngineIndexingDescription"}</p>
			
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="searchDescription" key="common.description"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="searchDescription[{$formLocale|escape}]" id="searchDescription" value="{$searchDescription[$formLocale]|escape}" size="40" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="searchKeywords" key="common.keywords"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<input type="text" name="searchKeywords[{$formLocale|escape}]" id="searchKeywords" value="{$searchKeywords[$formLocale]|escape}" size="40" class="form-control" />
				</div>
			</div>
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="customHeaders" key="manager.setup.customTags"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<textarea name="customHeaders[{$formLocale|escape}]" id="customHeaders" rows="3" cols="40" class="form-control">{$customHeaders[$formLocale]|escape}</textarea>
					<br />
					<span class="instruct">{translate key="manager.setup.customTagsDescription"}</span>
				</div>
			</div>
			
		</div>
		

		
		<div id="history" class="tab-pane">
			<h3>1.9 {translate key="manager.setup.history"}</h3>
		
			<p>{translate key="manager.setup.historyDescription"}</p>
			
			<div class="form-group clearfix">
				<div class="control-label col-sm-3 col-md-3 col-lg-3">
					{fieldLabel name="history" key="manager.setup.history"}
				</div>
				<div class="col-sm-9 col-md-9 col-lg-9 value">
					<textarea name="history[{$formLocale|escape}]" id="history" rows="5" cols="40" class="form-control">{$history[$formLocale]|escape}</textarea>
				</div>
			</div>
			
		</div>	


</div>
		
		

		<div class="separator"></div>
		
		
		<p><button type="button" id="changetabbutton" class="btn btn-info btn-sm">Next</button><input type="submit" value="{translate key="common.saveAndContinue"}" class="btn btn-success btn-save hidden" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url op="setup" escape=false}'" /></p>
		
		<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
		
		</form>
		
	</div>
</div>

{include file="common/footer.tpl"}

