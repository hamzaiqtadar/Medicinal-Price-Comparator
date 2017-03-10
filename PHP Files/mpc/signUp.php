<?php

if(isset($_POST['snme']) && isset($_POST['seml']) && isset($_POST['susr']) && isset($_POST['scel']) 
		&& isset($_POST['sadr'])&& isset($_POST['spass'])){
	$nm=$_POST['snme'];
	$mail=$_POST['seml'];
	$un=$_POST['susr'];
	$cell=$_POST['scel'];
	$ads=$_POST['sadr'];
	$pass=$_POST['spass'];
	
	require_once __DIR__ . '/db_connect.php';
	
	$response=array();
	$response["success"]=0;
	$response["uemail"]=0;
	$response["user"]=0;
	$q="";
	$db = new DB_CONNECT();
	$em=mysqli_query($db->connect(),"SELECT * FROM customer WHERE c_email='$mail'");
	if(mysqli_num_rows($em) == 0){
		$response["uemail"]=1;
		$em=mysqli_query($db->connect(),"SELECT * FROM customer WHERE username='$un'");
		if(mysqli_num_rows($em) == 0){
			
			mysqli_autocommit($db->connect(),false);
			$result = mysqli_query($db->connect(),"INSERT INTO customer (c_name,c_email,address,cell_no,username)VALUES('$nm','$mail','$ads',$cell,'$un')");
			$q=mysqli_query($db->connect(),"SELECT c_id FROM customer WHERE username='$un'");
			$q= mysqli_fetch_array($q);
			$q=$q['c_id'];
			$response["user"]=$q;
			$r2=mysqli_query($db->connect(),"INSERT INTO userpass(pass,user_id) VALUES('$pass',$q)");
			if(!(mysqli_commit($db->connect())))
			{
				mysqli_rollback($db->connect());
				$response['success']=0;
				echo json_encode($response);
			}
			else{
				$response['success']=1;
				echo json_encode($response);
			}		
		}
		else{
			echo json_encode($response);
		}
	}
	echo json_encode($response);
}
else 
	echo json_encode("error");


?>