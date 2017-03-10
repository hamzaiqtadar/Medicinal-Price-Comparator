<?php

if(isset($_POST['MED_ID'] )&& isset($_POST['U_ID']) && isset($_POST['VAL'])){
	$response["success"]=0;		// array which will be encoded
	$mid=$_POST['MED_ID'];
	$uid=$_POST['U_ID'];		
	$val=$_POST['VAL'];
	require_once __DIR__ . '/db_connect.php';	// adding class for connection
	
	$db = new DB_CONNECT();
		// if connection is successful
		$apy=mysqli_query($db->connect(),"INSERT INTO review (u_id,reviewtxt,med_id) VALUES($uid,'$val',$mid)");
    //$apy=$db->connect()->("INSERT INTO review (u_id,reviewtxt,med_id) VALUES(?,?,?)");
    //$apy->bind_param("sss", $uid,'$val',$mid);
    
		if($apy){
				$response["success"]=1;
				echo json_encode($response);
		}
		else 
			echo json_encode($response);	
}
else {
	$response["success"]=-1;
	echo json_encode($response);
}
?>