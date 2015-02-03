<?php

// This is the database connection configuration.
return array(
	//'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/netscout.db',
	// uncomment the following lines to use a MySQL database
	
	'connectionString' => 'mysql:host=localhost;dbname=netscout_db',
	'emulatePrepare' => true,
	'username' => 'netscout',
	'password' => '12345',
	'charset' => 'utf8',
	
);