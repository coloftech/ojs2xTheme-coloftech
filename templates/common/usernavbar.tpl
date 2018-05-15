  <nav class="navbar navbar-default navbar-static-top" style="padding-left:10px;">
    <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle navbar-toggle-sidebar collapsed">
      MENU
      </button>
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">
        <i class="fa fa-home"></i> Publication Area 
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">      
      <form class="navbar-form navbar-left hidden" method="GET" role="search">
        <div class="form-group">
          <input type="text" name="q" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="{url journal="index"}" >Visit Site</a></li>
    <li id="about"><a href="{url page="about"}">{translate key="navigation.about"}</a></li>
        <li class="dropdown ">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
            Account
            <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li class="dropdown-header">SETTINGS</li>{if $hasOtherJournals}
    {if !$showAllJournals}
      <li> <a href="{url journal="index" page="user"}">{translate key="user.showAllJournals"}</a></li>
    {/if}
  {/if}
  {if $currentJournal}
    {if $subscriptionsEnabled}
      <li> <a href="{url page="user" op="subscriptions"}">{translate key="user.manageMySubscriptions"}</a></li>
    {/if}
  {/if}
  {if $currentJournal}
    {if $acceptGiftPayments}
      <li> <a href="{url page="user" op="gifts"}">{translate key="gifts.manageMyGifts"}</a></li>
    {/if}
  {/if}
  <li> <a href="{url page="user" op="profile"}">{translate key="user.editMyProfile"}</a></li>

  {if !$implicitAuth}
    <li> <a href="{url page="user" op="changePassword"}">{translate key="user.changeMyPassword"}</a></li>
  {/if}

  {if $currentJournal}
    {if $journalPaymentsEnabled && $membershipEnabled}
      {if $dateEndMembership}
        <li> <a href="{url page="user" op="payMembership"}">{translate key="payment.membership.renewMembership"}</a> ({translate key="payment.membership.ends"}: {$dateEndMembership|date_format:$dateFormatShort})</li>
      {else}
        <li> <a href="{url page="user" op="payMembership"}">{translate key="payment.membership.buyMembership"}</a></li>   
      {/if}
    {/if}{* $journalPaymentsEnabled && $membershipEnabled *}
  {/if}{* $userJournal *}
  <li class="divider"></li>
  <li> <a href="{url page="login" op="signOut"}">{translate key="user.logOut"}</a></li>
  {call_hook name="Templates::User::Index::MyAccount"}
            </ul>
          </li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
  <div class="container-fluid main-container" style="margin-left:25px;">
      <div class="col-md-2 sidebar">
        <div class="row">
  <!-- uncomment code for absolute positioning tweek see top comment in css -->
  <div class="absolute-wrapper"> </div>
  <!-- Menu -->
  <div class="side-menu">
    <nav class="navbar navbar-info" role="navigation">
      <!-- Main Menu -->
      <div class="side-menu-container">
        <ul class="nav navbar-nav">
          <li id="logo"><a href="">
                   {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
                      <img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
                    {/if}

      </a></li>
          <li id="home"><a href="{url page="index"}">{translate key="navigation.home"}</a></li>

          {if $isUserLoggedIn}
            <li id="userHome"><a href="{if $hasOtherJournals}{url journal="index" page="user"}{else}{url journal=$journalPath page="author"}{/if}">{translate key="navigation.user.home"}</a></li>
          {else}
            <li id="login"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
            {if !$hideRegisterLink}
              <li id="register"><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>
            {/if}
          {/if}{* $isUserLoggedIn *}

          {if $siteCategoriesEnabled}
            <li id="categories"><a href="{url journal="index" page="search" op="categories"}">{translate key="navigation.categories"}</a></li>
          {/if}{* $categoriesEnabled *}

          {if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
            <li id="search"><a href="{url page="search"}">{translate key="navigation.search"}</a></li>
          {/if}

          {if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
            <li id="current"><a href="{url page="issue" op="current"}">{translate key="navigation.current"}</a></li>
            <li id="archives"><a href="{url page="issue" op="archive"}">{translate key="navigation.archives"}</a></li>
          {/if}

          {if $enableAnnouncements}
            <li id="announcements"><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
          {/if}{* enableAnnouncements *}

          {call_hook name="Templates::Common::Header::Navbar::CurrentJournal"}

          {foreach from=$navMenuItems item=navItem key=navItemKey}
            {if $navItem.url != '' && $navItem.name != ''}
              <li class="navItem" id="navItem-{$navItemKey|escape}"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$baseUrl}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
            {/if}
          {/foreach}
        </ul>
      </div><!-- /.navbar-collapse -->
    </nav>

  </div>
</div>      </div>

      <div class="col-md-10 content">
          <div class="panel panel-default">
  <div class="panel-heading">
    {include file="common/breadcrumbs.tpl"}
  </div>
  <div class="panel-body">
