<?php

define('DB_Server', 'localhost');
define('DB_Username', 'root');
define('DB_Password', '');
define('DB_Name', 'pos_system_php');

$conn = mysqli_connect(DB_Server, DB_Username, DB_Password, DB_Name);   

if(!$conn){
    die("connection failed: ".mysqli_connect_error());
}

?>