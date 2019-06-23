<?php 
//change the values with your own hosting setting
 $mysql_host = "localhost";
 $mysql_database = "rating";
 $mysql_user = "root";
 $mysql_password = "";

 $link = mysqli_connect($mysql_host,$mysql_user,$mysql_password);
 mysqli_select_db($link,$mysql_database);
?>