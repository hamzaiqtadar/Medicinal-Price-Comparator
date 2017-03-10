<?php

if(isset($_POST['MED_ID'])){
	$response=array();		// array which will be encoded
	$mid=$_POST['MED_ID'];		// formula or name search
	require_once __DIR__ . '/db_connect.php';	// adding class for connection
	
	$db = new DB_CONNECT();
		// if connection is successful
		$response["success"]=1;
		$apy=mysqli_query($db->connect(),"SELECT reviewtxt,username FROM review JOIN (SELECT c_id,username FROM customer)" .
				" AS mc ON (c_id=u_id) WHERE med_id =$mid");
		if($apy){
			$response["products"]=array();
			while($row = mysqli_fetch_array($apy)){
						$product=array();
						$product["review_text"]=$row["reviewtxt"];
						$product["user_name"]=$row["username"];
						array_push($response["products"],$product);
					}
				$response["found"]=1;
				echo json_encode($response);
		}
		else {
			$response["found"]=0;
			echo json_encode($response);
		}
		
		
}
else {
	$response["success"]=0;
	$response["found"]=0;
	echo json_encode($response);
}
	


?>