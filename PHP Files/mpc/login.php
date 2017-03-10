<?php
	$response["success"]=0;
	if(isset($_POST['mi']) && isset($_POST['sw'])){
	$email=$_POST['mi'];
	$pass=$_POST['sw'];
	
 require_once __DIR__ . '/db_connect.php';
 	$response=array();
 	$response["success"]=0;
    $db = new DB_CONNECT();
    $result = mysqli_query($db->connect(), "SELECT * FROM customer join userpass on(c_id=user_id) where username='$email' and pass='$pass'") ;
    if(mysqli_num_rows($result) == 1){
    		$product=array();
    		$response['products']=array();
    		$row = mysqli_fetch_array($result);
    		$product['name']=$row['c_name'];
    		$product['email']=$row['c_email'];
    		$product['username']=$row['username'];
    		$product['cell_no']=$row['cell_no'];
    		$product['address']=$row['address'];
    		$product['user']=$row['c_id'];
    		array_push($response['products'],$product);
    		$response["success"]=1;
    }
    
 
    echo json_encode($response);
	}
	else 
	echo json_encode("error");
	

?>