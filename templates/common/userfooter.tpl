  </div>
</div>
      </div>


<footer class="pull-left footer">
		<div class="col-md-12">
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
		</div>
        <div class="col-md-12">
          <hr class="divider">
          Copyright &COPY; 2016-2018 <a href="//www.coloftech.com">COLOFTECH</a>
        </div>
</footer>
    </div>