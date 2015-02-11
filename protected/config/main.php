<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'Netscout',
    'defaultController' => 'Page',

	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
        'application.models.ext.*',
        'application.models.forms.*', 
		'application.components.*',
        'application.helpers.*',
	),

	'modules'=>array(
		// uncomment the following to enable the Gii tool
		
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'1234',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),
		
	),

	// application components
	'components'=>array(

		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),

		// uncomment the following to enable URLs in path-format
		
		'urlManager'=>array(
            'class' => 'application.components.UrlManager',
			'urlFormat'=>'path',
            'showScriptName'=>false,
			'rules'=>array(
                
                '<language:\w{2}>' => 'main/index',
                '<language:\w{2}>/<controller:\w+>'=>'<controller>/index',
                '<language:\w{2}>/<controller:\w+>/<id:\d+>'=>'<controller>/view',
                '<language:\w{2}>/<controller:\w+>/<action:\w+>/<id:\d+>/*'=>'<controller>/<action>',
                '<language:\w{2}>/<controller:\w+>/<action:\w+>/*'=>'<controller>/<action>',
                /*
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
                */
			),
		),
		

		// database settings are configured in database.php
		'db'=>require(dirname(__FILE__).'/database.php'),
        //'customer_db'=> require(dirname(__FILE__).'/customer_db.php'),
        //'numbers_db' => require(dirname(__FILE__).'/numbers_db.php'),
       

		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),

		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
                */
				
			),
		),

	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'webmaster@example.com',
        'sourceLanguage' => 'en',
        'defaultLanguage' => 'en'

	),
);
