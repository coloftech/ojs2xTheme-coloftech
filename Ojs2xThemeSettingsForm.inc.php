<?php

/**
 * @file plugins/themes/Ojs2xTheme/Ojs2xThemeSettingsForm.inc.php
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class Ojs2xThemeSettingsForm
 * @ingroup plugins_themes_Ojs2xTheme
 *
 * @brief Form for journal managers to modify Responsive theme plugin settings
 */

import('lib.pkp.classes.form.Form');

class Ojs2xThemeSettingsForm extends Form {

	/** @var $journalId int */
	var $journalId;

	/** @var $plugin object */
	var $plugin;

	/**
	 * Constructor
	 * @param $plugin object
	 * @param $journalId int
	 */
	function Ojs2xThemeSettingsForm(&$plugin, $journalId) {
		$this->journalId = $journalId;
		$this->plugin =& $plugin;

		parent::Form($plugin->getTemplatePath() . 'templates/themeSetting/settingsForm.tpl');
	}

	/**
	 * Display the form
	 */
	function display() {
		$templateMgr =& TemplateManager::getManager(); 
		//$additionalHeadData = $templateMgr->get_template_vars('additionalHeadData');
		$themeHeadData = '<script type="text/javascript" src="' . Request::getBaseUrl() . '/plugins/themes/Ojs2xTheme/picker.js"></script>' . "\n";
		$templateMgr->addStyleSheet(Request::getBaseUrl() . '/plugins/themes/Ojs2xTheme/picker.css');
		$templateMgr->assign('themeHeadData', $themeHeadData);
		$stylesheetFilePluginLocation = $this->plugin->getPluginPath() . '/css/' . $this->plugin->getStylesheetFilename();
		if (!$this->_canUsePluginPath() || $this->plugin->getSetting($this->journalId, 'Ojs2xThemePerJournal')) {
			if (!$this->_canUsePluginPath()) {
				$templateMgr->assign('disablePluginPath', true);
				$templateMgr->assign('stylesheetFilePluginLocation', $stylesheetFilePluginLocation);
			}
			import('classes.file.PublicFileManager');
			$fileManager = new PublicFileManager();
			$stylesheetFileLocation = $fileManager->getJournalFilesPath($this->journalId) . '/' . $this->plugin->getStylesheetFilename();
		} else {
			$stylesheetFileLocation = $stylesheetFilePluginLocation;
		}
		$templateMgr->assign('canSave', $this->_is_writable($stylesheetFileLocation));
		$templateMgr->assign('stylesheetFileLocation', $stylesheetFileLocation);

		return parent::display();
	}

	/**
	 * Initialize form data.
	 */
	function initData() {
		$journalId = $this->journalId;
		$plugin =& $this->plugin;

		$this->_data = array(
			'headetSettingColour' => $plugin->getSetting($journalId, 'headetSettingColour'),
			'footerSettingColour' => $plugin->getSetting($journalId, 'footerSettingColour'),
			'buttonsSettingColour' => $plugin->getSetting($journalId, 'buttonsSettingColour'),
			'footerBottomSettingColour' => $plugin->getSetting($journalId, 'footerBottomSettingColour'),
			'themeSettingLinkColour' => $plugin->getSetting($journalId, 'themeSettingLinkColour'),
			'Ojs2xThemeBackgroundColour' => $plugin->getSetting($journalId, 'Ojs2xThemeBackgroundColour'),
			'Ojs2xThemeForegroundColour' => $plugin->getSetting($journalId, 'Ojs2xThemeForegroundColour'),
			'Ojs2xThemePerJournal' => $plugin->getSetting($journalId, 'Ojs2xThemePerJournal'),
		);
	}

	/**
	 * Assign form data to user-submitted data.
	 */
	function readInputData() {
		$this->readUserVars(array('headetSettingColour', 'footerSettingColour', 'buttonsSettingColour', 'footerBottomSettingColour', 'themeSettingLinkColour', 'Ojs2xThemeBackgroundColour', 'Ojs2xThemeForegroundColour', 'Ojs2xThemePerJournal'));
	}

	/**
	 * Save settings. 
	 */
	function execute() {
		$plugin =& $this->plugin;
		$journalId = $this->journalId; 
		$css = '';

		// Header colours
		$headetSettingColour = $this->getData('headetSettingColour');
		$plugin->updateSetting($journalId, 'headetSettingColour', $headetSettingColour, 'string');
		$css .= "#header, #mainmenu, .dropdown-menu, .dropdown-menu.submenu {background-color: $headetSettingColour;border-color: $headetSettingColour;}\n";
		$css .= "#header {border-color: $headetSettingColour;}\n";
		$css .= "#footer {background-color: $headetSettingColour;}\n";
		$css .= "table.listing tr.fastTracked {background-color: $headetSettingColour;}\n";
		$css .= ".navbar-default .navbar-nav > .open > a, .navbar-default .navbar-nav > .open > a:hover, .navbar-default .navbar-nav > .open > a:focus, .dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus, .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {background-color: ".$this->adjustBrightness($headetSettingColour, '50').";}\n";
		$css .= ".navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus {background-color: ".$this->adjustBrightness($headetSettingColour, '50').";}\n";
		$css .= ".navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus, .dropdown-menu > .active > a, .dropdown-menu > .active > a:hover, .dropdown-menu > .active > a:focus,.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus, .navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {background-color: ".$this->adjustBrightness($headetSettingColour, '50').";}\n";
		

		// footer colours
		$footerSettingColour = $this->getData('footerSettingColour');
		$plugin->updateSetting($journalId, 'footerSettingColour', $footerSettingColour, 'string');
		$css .= "#pageFooter {background-color: $footerSettingColour;}\n";
		
		// footer colours
		$footerBottomSettingColour = $this->getData('footerBottomSettingColour');
		$plugin->updateSetting($journalId, 'footerBottomSettingColour', $footerBottomSettingColour, 'string');
		$css .= "#pageFooter-bottom {background-color: $footerBottomSettingColour;}\n";
		
		// Buttons colours
		$buttonsSettingColour = $this->getData('buttonsSettingColour');
		$plugin->updateSetting($journalId, 'buttonsSettingColour', $buttonsSettingColour, 'string');
		$css .= "input.defaultButton {color: $buttonsSettingColour;}\n";
		$css .= "input.button, .btn-primary, input.button:link, .btn-primary:link  {background-color: $buttonsSettingColour;border-color: $buttonsSettingColour;}\n";
		$css .= "input.button:hover, .btn-primary:hover, input.button:active, .btn-primary:active, input.button:visited, .btn-primary:visited {background-color: ".$this->adjustBrightness($buttonsSettingColour, '-10').";border-color: ".$this->adjustBrightness($buttonsSettingColour, '-10').";}\n";
		$css .= ".btn-primary, .btn-primary:link, a.btn-primary, a.btn-primary:link, input.button:link, .btn-primary:link {color: #ffffff;}\n";
		
		// Body link colour
		$themeSettingLinkColour = $this->getData('themeSettingLinkColour');
		$plugin->updateSetting($journalId, 'themeSettingLinkColour', $themeSettingLinkColour, 'string');
		$css .= "a,a:link {color: $themeSettingLinkColour;}\n";
		$css .= "a:hover, a:active, a:visited {color: ".$this->adjustBrightness($themeSettingLinkColour, '-10').";}\n";
		
		// Background colour of Body
		$Ojs2xThemeBackgroundColour = $this->getData('Ojs2xThemeBackgroundColour');
		$plugin->updateSetting($journalId, 'Ojs2xThemeBackgroundColour', $Ojs2xThemeBackgroundColour, 'string');
		$css .= "body {background-color: $Ojs2xThemeBackgroundColour;}\n";
		$css .= "input.defaultButton, input.defaultButton:link {background-color: #ffffff;border-color: #cccccc;}\n";
		$css .= "input.defaultButton:hover, input.defaultButton:active, input.defaultButton:visited, input.defaultButton:focus, input.btn-default:focus {background-color: #ebebeb;border-color: #adadad !important;color: #333;}\n";
		//$css .= "input.defaultButton, input.defaultButton:link {background-color: $Ojs2xThemeBackgroundColour;border-color: ".$this->adjustBrightness($Ojs2xThemeColour, '50').";}\n";
		//$css .= "input.defaultButton:hover, input.defaultButton:active, input.defaultButton:visited, input.defaultButton:focus, input.btn-default:focus {background-color: #ffffff;border-color: #cccccc;}\n";

		// Body text colour
		$Ojs2xThemeForegroundColour = $this->getData('Ojs2xThemeForegroundColour');
		$plugin->updateSetting($journalId, 'Ojs2xThemeForegroundColour', $Ojs2xThemeForegroundColour, 'string');
		$css .= "body {color: $Ojs2xThemeForegroundColour;}\n";

		import('classes.file.PublicFileManager');
		$fileManager = new PublicFileManager();
		$Ojs2xThemePerJournal = $this->getData('Ojs2xThemePerJournal');
		if (!$Ojs2xThemePerJournal && !$this->_canUsePluginPath()) {
			$Ojs2xThemePerJournal = true;
		}
		$plugin->updateSetting($journalId, 'Ojs2xThemePerJournal', $Ojs2xThemePerJournal, 'bool');
		if ($Ojs2xThemePerJournal) {
			$fileManager->writeJournalFile($journalId, $this->plugin->getStylesheetFilename(), $css);
		} else {
			$fileManager->writeFile(dirname(__FILE__) . '/css/' . $this->plugin->getStylesheetFilename(), $css);
		}
	}
	
	/**
	 * Adjust Brightness of hax colour
	 */
	function adjustBrightness($hex, $steps) {
	    // Steps should be between -255 and 255. Negative = darker, positive = lighter
	    $steps = max(-255, min(255, $steps));
	
	    // Normalize into a six character long hex string
	    $hex = str_replace('#', '', $hex);
	    if (strlen($hex) == 3) {
		$hex = str_repeat(substr($hex,0,1), 2).str_repeat(substr($hex,1,1), 2).str_repeat(substr($hex,2,1), 2);
	    }
	
	    // Split into three parts: R, G and B
	    $color_parts = str_split($hex, 2);
	    $return = '#';
	
	    foreach ($color_parts as $color) {
		$color   = hexdec($color); // Convert to decimal
		$color   = max(0,min(255,$color + $steps)); // Adjust color
		$return .= str_pad(dechex($color), 2, '0', STR_PAD_LEFT); // Make two char hex code
	    }
	
	    return $return;
	}



	/**
	 * Evaluate whether the plugin path is writable and available for use
	 */
	function _canUsePluginPath() {
		return is_writable($this->plugin->getPluginPath() . '/css/' . $this->plugin->getStylesheetFilename());
	}
	
	/**
	 * Evaluate whether a path is writable
	 * Check if the filename provided (or the parent directory, if the filename does not exist) can be written
	 */
	function _is_writable($filename) {
		if (is_writable($filename)) {
			return true;
		} elseif (!file_exists($filename) && is_writable(dirname($filename))) {
			return true;
		}
		return false;
	}
}

?>
