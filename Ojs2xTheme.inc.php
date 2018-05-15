<?php

/**
 * @file Ojs2xTheme.inc.php
 *
 * @class Ojs2xTheme
 * @ingroup plugins_themes_Ojs2xTheme
 *
 * @brief "Ojs2xTheme" theme plugin
 */

// $Id$


import('classes.plugins.ThemePlugin');

class Ojs2xTheme extends ThemePlugin {
	/**
	 * Register the plugin, if enabled; note that this plugin
	 * runs under both Journal and Site contexts.
	 * @param $category string
	 * @param $path string
	 * @return boolean
	 */
	function register($category, $path) {
		if (parent::register($category, $path)) {
			$this->addLocaleData();
			return true;
		}
		return false;
	}
	
	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'Ojs2xTheme';
	}

	function getDisplayName() {
		return __('plugins.themes.responsiveTheme.displayName');
	}
	
	function getDescription() {
		return __('plugins.themes.responsiveTheme.description');
	}
  
	function activate(&$templateMgr) {
		// Overrides parent::activate because path needs to be changed.
		$templateMgr->assign('requestedOp', Request::getRequestedOp());
		if (($stylesheetFilename = $this->getStylesheetFilename()) != null) {
			$path = Request::getBaseUrl() . '/' . $this->getStylesheetPath() . $stylesheetFilename;
			$templateMgr->addStyleSheet($path);
			//echo "<pre style='direction: ltr;text-align: left;'>";die(print_r($path));
		}
		$templateMgr->template_dir[0] = Core::getBaseDir() 
										. DIRECTORY_SEPARATOR 
										. 'plugins' 
										. DIRECTORY_SEPARATOR 
										. 'themes' 
										. DIRECTORY_SEPARATOR 
										. 'Ojs2xTheme' 
										. DIRECTORY_SEPARATOR 
										. 'templates';   
											      
		$templateMgr->compile_id = 'Ojs2xTheme';
	}

	/**
	 * Get the filename of this plugin's stylesheet.
	 * @return String stylesheet filename
	 */
	function getStylesheetFilename() {
		return 'theme.css';
	}

	/**
	 * Get the file path to this plugin's stylesheet.
	 * @return String stylesheet path
	 */
	function getStylesheetPath() {
		$journal =& Request::getJournal();
		if ($journal && $this->getSetting($journal->getId(), 'Ojs2xThemePerJournal')) {
			import('classes.file.PublicFileManager');
			$fileManager = new PublicFileManager();
			return $fileManager->getJournalFilesPath($journal->getId())."/";
		} else {
			$cssPath = $this->getPluginPath().'/css/';
			return $cssPath;
		}
	}
	
	/**
	 * Get the available management verbs.
	 * @return array key-value pairs
	 */
	function getManagementVerbs() {
		return array(array('settings', __('plugins.themes.responsiveTheme.settings')));
	}

	/**
	 * Set the page's breadcrumbs, given the plugin's tree of items
	 * to append.
	 * @param $subclass boolean
	 */
	function setBreadcrumbs($isSubclass = false) {
		$templateMgr =& TemplateManager::getManager();
		$pageCrumbs = array(
			array(
				Request::url(null, 'user'),
				'navigation.user'
			),
			array(
				Request::url(null, 'manager'),
				'user.role.manager'
			)
		);
		$pageCrumbs[] = array(
			Request::url(null, 'manager', 'plugins'),
			'manager.plugins'
		);
		$pageCrumbs[] = array(
			Request::url(null, 'manager', 'plugins', 'themes'),
			'plugins.categories.themes'
		);

		$templateMgr->assign('pageHierarchy', $pageCrumbs);
	}

	/**
	 * Extend the {url ...} smarty to support this plugin.
	 * @param $params array
	 * @param $smarty object reference
	 * @return string
	 */
	function smartyPluginUrl($params, &$smarty) {
		$path = array($this->getCategory(), $this->getName());
		if (is_array($params['path'])) {
			$params['path'] = array_merge($path, $params['path']);
		} elseif (!empty($params['path'])) {
			$params['path'] = array_merge($path, array($params['path']));
		} else {
			$params['path'] = $path;
		}

		if (!empty($params['id'])) {
			$params['path'] = array_merge($params['path'], array($params['id']));
			unset($params['id']);
		}
		return $smarty->smartyUrl($params, $smarty);
	}

	/**
	 * Manage the theme.
	 * @param $verb string management action
	 */
	function manage($verb) {
		if ($verb != 'settings') return false;

		$journal =& Request::getJournal();
		$journalId = ($journal ? $journal->getId() : CONTEXT_ID_NONE);
		$templateMgr =& TemplateManager::getManager();

		$templateMgr->register_function('plugin_url', array(&$this, 'smartyPluginUrl'));
		$templateMgr->setCacheability(CACHEABILITY_MUST_REVALIDATE);

		$this->import('Ojs2xThemeSettingsForm');
		$form = new Ojs2xThemeSettingsForm($this, $journalId);
		if (Request::getUserVar('save')) {
			$form->readInputData();
			if ($form->validate()) {
				$form->execute();
				Request::redirect(null, 'manager', 'plugin', array('themes', 'Ojs2xTheme', 'settings'));
			} else {
				$this->setBreadCrumbs(true);
				$form->display();
			}
		} else {
			$this->setBreadCrumbs(true);
			$form->initData();
			$form->display();
		}

		return true;
	}
	


}

?>
