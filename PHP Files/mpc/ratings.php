<?php

if(isset($_POST['MED_ID'] )&& isset($_POST['U_ID']) && isset($_POST['VAL'])){
	$response=array();		// array which will be encoded
	$mid=$_POST['MED_ID'];
	$uid=$_POST['U_ID'];		
	$val=$_POST['VAL'];
	require_once __DIR__ . '/db_connect.php';	// adding class for connection
	
	$db = new DB_CONNECT();
		// if connection is successful
		$response["success"]=1;
		
		$apy=mysqli_query($db->connect(),"INSERT INTO ratings(u_id,med_id,stars) VALUES ($uid,$mid,$val)");
		if($apy){
			$apy=mysqli_query($db->connect(),"SELECT SUM(stars) AS rsum, COUNT(med_id) AS total FROM" .
					" ratings WHERE med_id=$mid;");
					$row = mysqli_fetch_array($apy);
					$num= $row["rsum"];
					$den=$row["total"];
					$response["rating"]=(double) $num/$den;
					echo json_encode($response);
		}
		else {
			$response["rating"]=-1;
			echo json_encode($response);
		}
		
		
}
else {
	$response["success"]=-1;
	$response["rating"]=-1;
	echo json_encode($response);
}
	


?>