<?php

// This is the database connection configuration.
return array(
	'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/numbers.db',
    'class' => 'CDbConnection' 
);