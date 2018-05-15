{**
 * header.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2000-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site header.
 *}
 
 
<div class="row">

	<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
		<h3>{translate key="about.policies"}</h3>
		<ul>
			{if $currentJournal->getLocalizedSetting('focusScopeDesc') != ''}<li> <a href="{url page="about" op="editorialPolicies" anchor="focusAndScope"}">{translate key="about.focusAndScope"}</a></li>{/if}
			<li><a href="{url page="about" op="editorialPolicies" anchor="sectionPolicies"}">{translate key="about.sectionPolicies"}</a></li>
			{if $currentJournal->getLocalizedSetting('reviewPolicy') != ''}<li> <a href="{url page="about" op="editorialPolicies" anchor="peerReviewProcess"}">{translate key="about.peerReviewProcess"}</a></li>{/if}
			{if $currentJournal->getLocalizedSetting('pubFreqPolicy') != ''}<li> <a href="{url page="about" op="editorialPolicies" anchor="publicationFrequency"}">{translate key="about.publicationFrequency"}</a></li>{/if}
			{if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN && $currentJournal->getLocalizedSetting('openAccessPolicy') != ''}<li> <a href="{url page="about" op="editorialPolicies" anchor="openAccessPolicy"}">{translate key="about.openAccessPolicy"}</a></li>{/if}
			{if $journalSettings.enableLockss && $currentJournal->getLocalizedSetting('lockssLicense') != ''}<li> <a href="{url page="about" op="editorialPolicies" anchor="archiving"}">{translate key="about.archiving"}</a></li>{/if}
			{if $paymentConfigured && $journalSettings.journalPaymentsEnabled && $journalSettings.membershipFeeEnabled && $journalSettings.membershipFee > 0}<li> <a href="{url page="about" op="memberships"}">{translate key="about.memberships"}</a></li>{/if}
			{if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION}
				<li> <a href="{url page="about" op="subscriptions"}">{translate key="about.subscriptions"}</a></li>
				{if !empty($journalSettings.enableAuthorSelfArchive)}<li> <a href="{url page="about" op="editorialPolicies" anchor="authorSelfArchivePolicy"}">{translate key="about.authorSelfArchive"}</a></li>{/if}
				{if !empty($journalSettings.enableDelayedOpenAccess)}<li> <a href="{url page="about" op="editorialPolicies" anchor="delayedOpenAccessPolicy"}">{translate key="about.delayedOpenAccess"}</a></li>{/if}
			{/if}{* $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION *}
			{foreach key=key from=$customAboutItems item=customAboutItem}
				{if $customAboutItem.title!=''}<li> <a href="{url page="about" op="editorialPolicies" anchor=custom-$key}">{$customAboutItem.title|escape}</a></li>{/if}
			{/foreach}
			{call_hook name="Templates::About::Index::Policies"}
		</ul>
	</div>
	<div  class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
		<h3>{translate key="about.submissions"}</h3>
		<ul>
			<li> <a href="{url page="about" op="submissions" anchor="onlineSubmissions"}">{translate key="about.onlineSubmissions"}</a></li>
			{if $currentJournal->getLocalizedSetting('authorGuidelines') != ''}<li> <a href="{url page="about" op="submissions" anchor="authorGuidelines"}">{translate key="about.authorGuidelines"}</a></li>{/if}
			{if $currentJournal->getLocalizedSetting('copyrightNotice') != ''}<li> <a href="{url page="about" op="submissions" anchor="copyrightNotice"}">{translate key="about.copyrightNotice"}</a></li>{/if}
			{if $currentJournal->getLocalizedSetting('privacyStatement') != ''}<li> <a href="{url page="about" op="submissions" anchor="privacyStatement"}">{translate key="about.privacyStatement"}</a></li>{/if}
			{if $currentJournal->getSetting('journalPaymentsEnabled') && ($currentJournal->getSetting('submissionFeeEnabled') || $currentJournal->getSetting('fastTrackFeeEnabled') || $currentJournal->getSetting('publicationFeeEnabled'))}<li> <a href="{url page="about" op="submissions" anchor="authorFees"}">{translate key="about.authorFees"}</a></li>{/if}
			{call_hook name="Templates::About::Index::Submissions"}
		</ul>
	</div>
	<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
		<h3>{translate key="about.other"}</h3>
		<ul>
			{if not ($currentJournal->getSetting('publisherInstitution') == '' && $currentJournal->getLocalizedSetting('publisherNote') == '' && $currentJournal->getLocalizedSetting('contributorNote') == '' && empty($journalSettings.contributors) && $currentJournal->getLocalizedSetting('sponsorNote') == '' && empty($journalSettings.sponsors))}<li> <a href="{url page="about" op="journalSponsorship"}">{translate key="about.journalSponsorship"}</a></li>{/if}
			{if $currentJournal->getLocalizedSetting('history') != ''}<li> <a href="{url page="about" op="history"}">{translate key="about.history"}</a></li>{/if}
			<li> <a href="{url page="about" op="siteMap"}">{translate key="about.siteMap"}</a></li>
			<li> <a href="{url page="about" op="aboutThisPublishingSystem"}">{translate key="about.aboutThisPublishingSystem"}</a></li>
			{if $publicStatisticsEnabled}<li> <a href="{url page="about" op="statistics"}">{translate key="about.statistics"}</a></li>{/if}
			{call_hook name="Templates::About::Index::Other"}
		</ul>
	</div>
	<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
		<h3>{translate key="plugins.themes.responsiveTheme.share"}</h3>
		<div class="share-button">
			<a href="{$currentUrl}" class="twitter-share-button"{count} data-via="mahendrakumarve" data-dnt="true">Tweet</a>
		</div>
		<div class="share-button">
			<!--<div class="g-plus" data-action="share" data-annotation="bubble" data-href="{$currentUrl}"></div>-->
			<div class="g-plus" data-action="share" data-annotation="bubble" data-href="{$currentUrl}"></div>
		</div>
		<div class="share-button">
			<div class="fb-share-button" data-href="{$currentUrl}" data-layout="button_count"></div>
		</div>
	</div>	
	
</div> 
