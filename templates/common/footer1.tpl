			
						{strip}
							{if $currentJournal && $currentJournal->getSetting('onlineIssn')}
								{assign var=issn value=$currentJournal->getSetting('onlineIssn')}
							{elseif $currentJournal && $currentJournal->getSetting('printIssn')}
								{assign var=issn value=$currentJournal->getSetting('printIssn')}
							{/if}
							{if $issn}
								{translate|assign"issnText" key="journal.issn"}
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
						<div class="col-md-6 footer-left">
						<div class="col-md-6 footer-right">
							<p>
								{if $pageFooter}{$pageFooter}{/if}
							</p>
						</div>
					</div>
				</div>
			</div>
		</div><!-- /body -->

		<script>
            var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
            (function(d,t){literal}{var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}{/literal}(document,'script'));
        </script>

        
    </body>
</html>



