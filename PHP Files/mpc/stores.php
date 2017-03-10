<?php

if(isset($_POST['MED_ID'] )){
	$response=array();		// array which will be encoded
	$mid=$_POST['MED_ID'];
	
	require_once __DIR__ . '/db_connect.php';	// adding class for connection
	
	$db = new DB_CONNECT();
	// if connection is successful
	$response["success"]=0;
	
	$apy=mysqli_query($db->connect(),"SELECT store_id,store_name " .
		"FROM (SELECT store_id FROM stock_info WHERE medicine_id=$mid AND total_quantity > 0) AS a " .
		"JOIN (SELECT s_user_id,store_name FROM store_user) AS b " .
		"ON(s_user_id=store_id)");
	if($apy){
		if(mysqli_num_rows($apy)>0){
			$response["success"]=1;
			$response["stores"]=array();
			while($row = mysqli_fetch_array($apy)){
				$store=array();
				$store["sid"]=$row["store_id"];
				$store["sname"]=$row["store_name"];
				array_push($response["stores"],$store);
			}
				
			
			echo json_encode($response);
		}	
	}

}
else {
	$response["success"]=-1;
	$response["stores"]=-1;
	echo json_encode($response);
}



?>