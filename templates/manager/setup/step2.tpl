{**
 * templates/manager/setup/step2.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 2 of journal setup.
 *
 *}
{assign var="pageTitle" value="manager.setup.journalPolicies"}
{include file="manager/setup/setupHeader.tpl"}
{include file="manager/setup/script/js2.tpl"}
<div class="row step1">
	<div class="col-lg-12">
		<form id="setupForm" method="post" action="{url op="saveSetup" path="2"}">
			{include file="common/formErrors.tpl"}
			
			{if count($formLocales) > 1}
				<div id="locales">
					<div class="form-group clearfix">
						<div class="control-label col-sm-3 col-md-3 col-lg-3">
							{fieldLabel name="formLocale" key="form.formLanguage"}
						</div>
						<div class="col-sm-9 col-md-9 col-lg-9 value">
							{url|assign:"setupFormUrl" op="setup" path="2" escape=false}
							{form_language_chooser form="setupForm" url=$setupFormUrl}
							<span class="instruct">{translate key="form.formLanguage.description"}</span>
						</div>
					</div>
				</div>
			{/if}
			<ul class="nav nav-tabs ">
  <li class="active"><a data-toggle="tab" href="#focusAndScopeDescription" class="tab-0">{translate key="manager.setup.focusAndScope"}</a></li>
  <li><a data-toggle="tab" href="#peerReviewPolicy" class="tab-1">{translate key="manager.setup.peerReviewPolicy"}</a></li>
  <li><a data-toggle="tab" href="#privacyStatementInfo" class="tab-2">{translate key="manager.setup.privacys"}</a></li>
  <li><a data-toggle="tab" href="#editorDecision" class="tab-3">{translate key="manager.setup.Decision"}</a></li>
  <li><a data-toggle="tab" href="#addItemtoAboutJournal" class="tab-4">{translate key="manager.setup.aboutJournalItem"}</a></li>
  <li><a data-toggle="tab" href="#journalArchiving" class="tab-5">{translate key="manager.setup.Archiving"}</a></li>
  <li><a data-toggle="tab" href="#reviewerDatabaseLink" class="tab-6">{translate key="manager.setup.reviewerdb"}</a></li>
</ul>
<div class="col-lg-12 has-error"></div>
<div class="tab-content">

			<div id="focusAndScopeDescription" class="tab-pane fade in active">
				<h3>2.1 {translate key="manager.setup.focusAndScopeOfJournal"}</h3>
				<p>{fieldLabel name="focusScopeDesc" key="manager.setup.focusAndScopeDescription"}</p>
				<p>
					<textarea name="focusScopeDesc[{$formLocale|escape}]" id="focusScopeDesc" rows="12" cols="60" class="form-control">{$focusScopeDesc[$formLocale]|escape}</textarea>
				</p>
			</div>
			<div id="peerReviewPolicy" class="tab-pane fade">
				<h3>2.2 {translate key="manager.setup.peerReviewPolicy"}</h3>
				<div id="peerReviewDescription">
					<p>{translate key="manager.setup.peerReviewDescription"}</p>
					
					<h4>{fieldLabel name="reviewPolicy" key="manager.setup.reviewPolicy"}</h4>
					
					<p><textarea name="reviewPolicy[{$formLocale|escape}]" id="reviewPolicy" rows="12" cols="60" class="form-control">{$reviewPolicy[$formLocale]|escape}</textarea></p>
				</div>
				<div id="reviewGuidelinesInfo">
					<h4>{fieldLabel name="reviewGuidelines" key="manager.setup.reviewGuidelines"}</h4>
					{url|assign:"reviewFormsUrl" op="reviewForms"}
					<p>{translate key="manager.setup.reviewGuidelinesDescription" reviewFormsUrl=$reviewFormsUrl}</p>
					<p><textarea name="reviewGuidelines[{$formLocale|escape}]" id="reviewGuidelines" rows="12" cols="60" class="form-control">{$reviewGuidelines[$formLocale]|escape}</textarea></p>
				</div>
				
				<div id="reviewProcess">
					<h4>{translate key="manager.setup.reviewProcess"}</h4>
					
					<p>{translate key="manager.setup.reviewProcessDescription"}</p>
				
					<div class="form-group clearfix">
							<div class="control-label col-sm-1 col-md-1 col-lg-1">
								<input type="radio" name="mailSubmissionsToReviewers" id="mailSubmissionsToReviewers-0" value="0"{if not $mailSubmissionsToReviewers} checked="checked"{/if} />
							</div>
							<div class="col-sm-11 col-md-11 col-lg-11 value">
								<label for="mailSubmissionsToReviewers-0"><strong>{translate key="manager.setup.reviewProcessStandard"}</strong></label>
								<br />
								<span class="instruct">{translate key="manager.setup.reviewProcessStandardDescription"}</span>
							</div>
					</div>
					<div class="form-group clearfix">
							<div class="control-label col-sm-1 col-md-1 col-lg-1">
								<input type="radio" name="mailSubmissionsToReviewers" id="mailSubmissionsToReviewers-1" value="1"{if $mailSubmissionsToReviewers} checked="checked"{/if} />
							</div>
							<div class="col-sm-11 col-md-11 col-lg-11 value">
								<label for="mailSubmissionsToReviewers-1"><strong>{translate key="manager.setup.reviewProcessEmail"}</strong></label>
								<br />
								<span class="instruct">{translate key="manager.setup.reviewProcessEmailDescription"}</span>
							</div>
					</div>
				</div>
				<div id="reviewOptions">
					<h4>{translate key="manager.setup.reviewOptions"}</h4>
					<script type="text/javascript">
						{literal}
						<!--
							function toggleAllowSetInviteReminder(form) {
								form.numDaysBeforeInviteReminder.disabled = !form.numDaysBeforeInviteReminder.disabled;
							}
							function toggleAllowSetSubmitReminder(form) {
								form.numDaysBeforeSubmitReminder.disabled = !form.numDaysBeforeSubmitReminder.disabled;
							}
						// -->
						{/literal}
					</script>
					<p>
						<strong>{translate key="manager.setup.reviewOptions.reviewTime"}</strong><br/>
						{fieldLabel name="numWeeksPerReview" key="manager.setup.reviewOptions.numWeeksPerReview"}:
						<input type="text" name="numWeeksPerReview" id="numWeeksPerReview" value="{$numWeeksPerReview|escape}" size="2" maxlength="8" class="form-control" /> {translate key="common.weeks"}<br/>
						{translate key="common.note"}: {translate key="manager.setup.reviewOptions.noteOnModification"}
					</p>
				
					<p>
						<strong>{translate key="manager.setup.reviewOptions.reviewerReminders"}</strong><br/>
						{translate key="manager.setup.reviewOptions.automatedReminders"}:<br/>
						
						<input type="checkbox" name="remindForInvite" id="remindForInvite" value="1" onclick="toggleAllowSetInviteReminder(this.form)"{if !$scheduledTasksEnabled} disabled="disabled" {elseif $remindForInvite} checked="checked"{/if} />&nbsp;
						{fieldLabel name="remindForInvite" key="manager.setup.reviewOptions.remindForInvite1"}
						
						<select name="numDaysBeforeInviteReminder" id="numDaysBeforeInviteReminder" size="1" class="form-control"{if not $remindForInvite || !$scheduledTasksEnabled} disabled="disabled"{/if}>
							{section name="inviteDayOptions" start=3 loop=11}
							<option value="{$smarty.section.inviteDayOptions.index}"{if $numDaysBeforeInviteReminder eq $smarty.section.inviteDayOptions.index or ($smarty.section.inviteDayOptions.index eq 5 and not $remindForInvite)} selected="selected"{/if}>{$smarty.section.inviteDayOptions.index}</option>
							{/section}
						</select>
						{fieldLabel name="numDaysBeforeInviteReminder" key="manager.setup.reviewOptions.remindForInvite2"}
						
						<br/>
				
						<input type="checkbox" name="remindForSubmit" id="remindForSubmit" value="1" onclick="toggleAllowSetSubmitReminder(this.form)"{if !$scheduledTasksEnabled} disabled="disabled"{elseif $remindForSubmit} checked="checked"{/if} />&nbsp;
						{fieldLabel name="remindForSubmit" key="manager.setup.reviewOptions.remindForSubmit1"}
						
						<select name="numDaysBeforeSubmitReminder" id="numDaysBeforeSubmitReminder" size="1" class="form-control"{if not $remindForSubmit || !$scheduledTasksEnabled} disabled="disabled"{/if}>
							{section name="submitDayOptions" start=0 loop=11}
								<option value="{$smarty.section.submitDayOptions.index}"{if $numDaysBeforeSubmitReminder eq $smarty.section.submitDayOptions.index} selected="selected"{/if}>{$smarty.section.submitDayOptions.index}</option>
						{/section}
						</select>
						{fieldLabel name="numDaysBeforeSubmitReminder" key="manager.setup.reviewOptions.remindForSubmit2"}
						
						{if !$scheduledTasksEnabled}
						<br/>
						{translate key="manager.setup.reviewOptions.automatedRemindersDisabled"}
						{/if}
					</p>
				
					<p>
						<strong>{translate key="manager.setup.reviewOptions.reviewerRatings"}</strong><br/>
						<input type="checkbox" name="rateReviewerOnQuality" id="rateReviewerOnQuality" value="1"{if $rateReviewerOnQuality} checked="checked"{/if} />&nbsp;
						<label for="rateReviewerOnQuality">{translate key="manager.setup.reviewOptions.onQuality"}</label>
					</p>
				
					<p>
						<strong>{translate key="manager.setup.reviewOptions.reviewerAccess"}</strong><br/>
						<input type="checkbox" name="reviewerAccessKeysEnabled" id="reviewerAccessKeysEnabled" value="1"{if $reviewerAccessKeysEnabled} checked="checked"{/if} />&nbsp;
						<label for="reviewerAccessKeysEnabled">{translate key="manager.setup.reviewOptions.reviewerAccessKeysEnabled"}</label><br/>
						<span class="instruct">{translate key="manager.setup.reviewOptions.reviewerAccessKeysEnabled.description"}</span><br/>
						<input type="checkbox" name="restrictReviewerFileAccess" id="restrictReviewerFileAccess" value="1"{if $restrictReviewerFileAccess} checked="checked"{/if} />&nbsp;
						<label for="restrictReviewerFileAccess">{translate key="manager.setup.reviewOptions.restrictReviewerFileAccess"}</label>
					</p>
				
					<p>
						<strong>{translate key="manager.setup.reviewOptions.blindReview"}</strong><br/>
						<input type="checkbox" name="showEnsuringLink" id="showEnsuringLink" value="1"{if $showEnsuringLink} checked="checked"{/if} />&nbsp;
						{get_help_id|assign:"blindReviewHelpId" key="editorial.sectionEditorsRole.review.blindPeerReview" url="true"}
						<label for="showEnsuringLink">{translate key="manager.setup.reviewOptions.showEnsuringLink" blindReviewHelpId=$blindReviewHelpId}</label><br/>
					</p>
				</div>
			</div>
			<div id="privacyStatementInfo" class="tab-pane fade">
				<h3>2.3 {fieldLabel name="privacyStatement" key="manager.setup.privacyStatement"}</h3>
				
				<p><textarea name="privacyStatement[{$formLocale|escape}]" id="privacyStatement" rows="12" cols="60" class="form-control">{$privacyStatement[$formLocale]|escape}</textarea></p>
			
			</div>
			
			
			<div id="editorDecision" class="tab-pane fade">
				<h3>2.4 {translate key="manager.setup.editorDecision"}</h3>
				
				<p><input type="checkbox" name="notifyAllAuthorsOnDecision" id="notifyAllAuthorsOnDecision" value="1"{if $notifyAllAuthorsOnDecision} checked="checked"{/if} /> <label for="notifyAllAuthorsOnDecision">{translate key="manager.setup.notifyAllAuthorsOnDecision"}</label></p>
			</div>
		
			<div id="addItemtoAboutJournal" class="tab-pane fade">
				<h3>2.5 {translate key="manager.setup.addItemtoAboutJournal"}</h3>
				
				
				{foreach name=customAboutItems from=$customAboutItems[$formLocale] key=aboutId item=aboutItem}
					<div class="form-group clearfix">
						<div class="control-label col-sm-3 col-md-3 col-lg-3">
							{fieldLabel name="customAboutItems-$aboutId-title" key="common.title"}
						</div>
						<div class="col-sm-9 col-md-9 col-lg-9 value">
							<input type="text" name="customAboutItems[{$formLocale|escape}][{$aboutId|escape}][title]" id="customAboutItems-{$aboutId|escape}-title" value="{$aboutItem.title|escape}" size="40" maxlength="255" class="form-control" />{if $smarty.foreach.customAboutItems.total > 1} <input type="submit" name="delCustomAboutItem[{$aboutId|escape}]" value="{translate key="common.delete"}" class="button" />{/if}
						</div>
					</div>
					<div class="form-group clearfix">
						<div class="control-label col-sm-3 col-md-3 col-lg-3">
							{fieldLabel name="customAboutItems-$aboutId-content" key="manager.setup.aboutItemContent"}
						</div>
						<div class="col-sm-9 col-md-9 col-lg-9 value">
							<textarea name="customAboutItems[{$formLocale|escape}][{$aboutId|escape}][content]" id="customAboutItems-{$aboutId|escape}-content" rows="12" cols="40" class="form-control">{$aboutItem.content|escape}</textarea>
						</div>
					</div>
					{if !$smarty.foreach.customAboutItems.last}
					<tr valign="top">
						<td colspan="2" class="separator">&nbsp;</td>
					</tr>
					{/if}
				{foreachelse}
					<div class="form-group clearfix">
						<div class="control-label col-sm-3 col-md-3 col-lg-3">
							{fieldLabel name="customAboutItems-0-title" key="common.title"}
						</div>
						<div class="col-sm-9 col-md-9 col-lg-9 value">
							<input type="text" name="customAboutItems[{$formLocale|escape}][0][title]" id="customAboutItems-0-title" value="" size="40" maxlength="255" class="form-control" />
						</div>
					</div>
					<div class="form-group clearfix">
						<div class="control-label col-sm-3 col-md-3 col-lg-3">
							{fieldLabel name="customAboutItems-0-content" key="manager.setup.aboutItemContent"}
						</div>
						<div class="col-sm-9 col-md-9 col-lg-9 value">
							<textarea name="customAboutItems[{$formLocale|escape}][0][content]" id="customAboutItems-0-content" rows="12" cols="40" class="form-control"></textarea>
						</div>
					</div>
				{/foreach}
				
				<p><input type="submit" name="addCustomAboutItem" value="{translate key="manager.setup.addAboutItem"}" class="button" /></p>
			</div>
			
			<div id="journalArchiving" class="tab-pane fade">
				<h3>2.6 {translate key="manager.setup.journalArchiving"}</h3>
				
				<p>{translate key="manager.setup.preservationDescription"}</p>
				
				{call_hook name="Templates::Manager::Setup::JournalArchiving"}
				
				<p>{translate key="manager.setup.lockssDescription" lockssExistingArchiveUrl=$lockssExistingArchiveUrl lockssNewArchiveUrl=$lockssNewArchiveUrl}</p>
				
				{url|assign:"lockssUrl" page="gateway" op="lockss"}
				<p><input type="checkbox" name="enableLockss" id="enableLockss" value="1"{if $enableLockss} checked="checked"{/if} /> <label for="enableLockss">{translate key="manager.setup.lockssEnable" lockssUrl=$lockssUrl}</label></p>
				
				<p>
					<textarea name="lockssLicense[{$formLocale|escape}]" id="lockssLicense" rows="6" cols="60" class="form-control">{$lockssLicense[$formLocale]|escape}</textarea>
					<br />
					<span class="instruct">{fieldLabel name="lockssLicense" key="manager.setup.lockssLicenses"}</span>
				</p>
			</div>
			
			
			<div id="reviewerDatabaseLink" class="tab-pane fade">
				<h3>2.7 {translate key="manager.setup.reviewerDatabaseLink"}</h3>
				
				<p>{translate key="manager.setup.reviewerDatabaseLink.desc"}</p>
				
				{foreach name=reviewerDatabaseLinks from=$reviewerDatabaseLinks key=reviewerDatabaseLinkId item=reviewerDatabaseLink}
					<div class="form-group clearfix">
						<div class="control-label col-sm-3 col-md-3 col-lg-3">
							{fieldLabel name="reviewerDatabaseLinks-$reviewerDatabaseLinkId-title" key="common.title"}
						</div>
						<div class="col-sm-9 col-md-9 col-lg-9 value">
							<input type="text" name="reviewerDatabaseLinks[{$reviewerDatabaseLinkId|escape}][title]" id="reviewerDatabaseLinks-{$reviewerDatabaseLinkId|escape}-title" value="{$reviewerDatabaseLink.title|escape}" size="40" maxlength="255" class="form-control" />{if $smarty.foreach.reviewerDatabaseLinks.total > 1} <input type="submit" name="delReviewerDatabaseLink[{$reviewerDatabaseLinkId|escape}]" value="{translate key="common.delete"}" class="button" />{/if}
						</div>
					</div>
					<div class="form-group clearfix">
						<div class="control-label col-sm-3 col-md-3 col-lg-3">
							{fieldLabel name="reviewerDatabaseLinks-$reviewerDatabaseLinkId-url" key="common.url"}
						</div>
						<div class="col-sm-9 col-md-9 col-lg-9 value">
							<input type="text" name="reviewerDatabaseLinks[{$reviewerDatabaseLinkId|escape}][url]" id="reviewerDatabaseLinks-{$reviewerDatabaseLinkId|escape}-url" value="{$reviewerDatabaseLink.url|escape}" size="40" maxlength="255" class="form-control" />
						</div>
					</div>
					{if !$smarty.foreach.reviewerDatabaseLinks.last}
					<tr valign="top">
						<td colspan="2" class="separator">&nbsp;</td>
					</tr>
					{/if}
				{foreachelse}
					<div class="form-group clearfix">
						<div class="control-label col-sm-3 col-md-3 col-lg-3">
							{fieldLabel name="reviewerDatabaseLinks-0-title" key="common.title"}
						</div>
						<div class="col-sm-9 col-md-9 col-lg-9 value">
							<input type="text" name="reviewerDatabaseLinks[0][title]" id="reviewerDatabaseLinks-0-title" value="" size="40" maxlength="255" class="form-control" />
						</div>
					</div>
					<div class="form-group clearfix">
						<div class="control-label col-sm-3 col-md-3 col-lg-3">
							{fieldLabel name="reviewerDatabaseLinks-0-url" key="common.url"}
						</div>
						<div class="col-sm-9 col-md-9 col-lg-9 value">
							<input type="text" name="reviewerDatabaseLinks[0][url]" id="reviewerDatabaseLinks-0-url" value="" size="40" maxlength="255" class="form-control" />
						</div>
					</div>
				{/foreach}
				
				<p><input type="submit" name="addReviewerDatabaseLink" value="{translate key="manager.setup.addReviewerDatabaseLink"}" class="button" /></p>
			</div>
</div>
			
			
			<div class="separator"></div>
			
			<p><button type="button" id="changetabbutton" class="btn btn-info btn-sm">Next</button><input type="submit" value="{translate key="common.saveAndContinue"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url op="setup" escape=false}'" /></p>
			
			<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
		
		</form>
	</div>
</div>
{include file="common/userfooter.tpl"}

