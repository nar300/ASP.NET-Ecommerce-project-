<?php
require_once 'config.php';

    if($_POST['act'] == 'rate'){
    	//search if the user(ip) has already gave a note
    	$ip = $_SERVER["REMOTE_ADDR"];
    	$therate = $_POST['rate'];
    	$thepost = $_POST['post_id'];

    	$query = mysqli_query($link,"SELECT * FROM wcd_rate where ip= '$ip'  "); 
    	while($data = mysqli_fetch_assoc($query)){
    		$rate_db[] = $data;
    	}

    	
    		mysqli_query($link,"INSERT INTO wcd_rate (id_post, ip, rate)VALUES('$thepost', '$ip', '$therate')");
    	
    } 
?>