{**
 * templates/article/footer.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View -- Footer component.
 *}

						{if $sharingEnabled}
						<!-- start AddThis -->
							{if isset($sharingDropDownMenu)}
								{if isset($sharingUserName)}
									<script type="text/javascript">
										var addthis_pub = '{$sharingUserName}';
									</script>
								{/if}
								<br />
								<br />
								<div class="addthis_container">
									<a href="http://www.addthis.com/bookmark.php"
										onmouseover="return addthis_open(this, '', '{$sharingArticleURL|escape:"javascript"}', '{$sharingArticleTitle|escape:"javascript"}')"
										onmouseout="addthis_close()" onclick="return addthis_sendto()">
											<img src="{$sharingButtonUrl}" width="{$sharingButtonWidth}" height="{$sharingButtonHeight}" border="0" alt="Bookmark and Share" style="border:0;padding:0" />
									</a>
									<script type="text/javascript" src="//s7.addthis.com/js/200/addthis_widget.js"></script>
								</div>
							{else}
								<a href="http://www.addthis.com/bookmark.php"
									onclick="window.open('http://www.addthis.com/bookmark.php?pub={$sharingUserName|escape:"url"}&amp;url={$sharingRequestURL|escape:"url"}&amp;title={$sharingArticleTitle|escape:"url"}', 'addthis',
														 'scrollbars=yes,menubar=no,width=620,height=520,resizable=yes,toolbar=no,location=no,status=no');
											 return false;"
									title="Bookmark using any bookmark manager!" target="_blank">
										<img src="{$sharingButtonUrl}" width="{$sharingButtonWidth}" height="{$sharingButtonHeight}" border="0" alt="Bookmark and Share" style="border:0;padding:0" />
								</a>
							{/if}
						<!-- end AddThis -->
						{/if}
						
						{if $currentJournal}
							{if $currentJournal->getSetting('includeCopyrightStatement')}
								<br/><br/>
								{translate key="submission.copyrightStatement" copyrightYear=$article->getCopyrightYear()|escape copyrightHolder=$article->getLocalizedCopyrightHolder()|escape}
							{/if}
							{if $currentJournal->getSetting('includeLicense')}
								<br /><br />
								{if $ccLicenseBadge}
									{$ccLicenseBadge}
								{elseif $article->getLicenseURL()}
									{translate key="submission.licenseURL"}: <a href="{$article->getLicenseURL()|escape}" rel="license">{$article->getLicenseURL()|escape}</a>
								{/if}
							{/if}
						{/if}
						
						{call_hook name="Templates::Article::Footer::PageFooter"}
						{strip}
							{if $currentJournal && $currentJournal->getSetting('onlineIssn')}
								{assign var=issn value=$currentJournal->getSetting('onlineIssn')}
							{elseif $currentJournal && $currentJournal->getSetting('printIssn')}
								{assign var=issn value=$currentJournal->getSetting('printIssn')}
							{/if}
							{if $issn}
								{translate|assign:"issnText" key="journal.issn"}
							{/if}
						{/strip}
						{if $displayCreativeCommons}
							{translate key="common.ccLicense"}
						{/if}
						{call_hook name="Templates::Common::Footer::PageFooter"}
		
						</div><!--main-->
						{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
							  {if $rightSidebarCode}
								 <div id="rightSidebar" class="col-xs-12 col-sm-3 col-md-3 col-lg-3 well-small">
									 {$rightSidebarCode}
								 </div>
							  {/if}
					</div> <!-- .row -->
				</div> <!-- .container -->
			</div> <!-- /content -->
			
			  
			{if $currentJournal}
				<div id="pageFooter">
					<div class="container">
						{include file="common/footer-top.tpl"}
					</div>
				</div>
			{/if}
			
			<div id="pageFooter-bottom">
				<div class="container">
					<div class="row">
						<div class="col-md-6 footer-left"><p>{$issnText}: {$issn}</p></div>
						<div class="col-md-6 footer-right">
							<p>
								{if $pageFooter}{$pageFooter}{/if}
							</p>
						</div>
					</div>
				</div>
			</div>
		</div><!-- /body -->


{if $defineTermsContextId}
<script type="text/javascript">
{literal}
<!--
	// Open "Define Terms" context when double-clicking any text
	function openSearchTermWindow(url) {
		var term;
		if (window.getSelection) {
			term = window.getSelection();
		} else if (document.getSelection) {
			term = document.getSelection();
		} else if(document.selection && document.selection.createRange && document.selection.type.toLowerCase() == 'text') {
			var range = document.selection.createRange();
			term = range.text;
		}
		if (url.indexOf('?') > -1) openRTWindowWithToolbar(url + '&defineTerm=' + term);
		else openRTWindowWithToolbar(url + '?defineTerm=' + term);
	}

	if(document.captureEvents) {
		document.captureEvents(Event.DBLCLICK);
	}
	document.ondblclick = new Function("openSearchTermWindow('{/literal}{url page="rt" op="context" path=$articleId|to_array:$galleyId:$defineTermsContextId escape=false}{literal}')");
// -->
{/literal}
</script>
{/if}

{get_debug_info}
{if $enableDebugStats}{include file=$pqpTemplate}{/if}
</body>
</html>

