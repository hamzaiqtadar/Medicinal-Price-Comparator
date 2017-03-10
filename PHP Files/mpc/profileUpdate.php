<?php
//this file gets the information from a user profile after it is edited
//and saves them to the database
if(isset($_POST['snme']) && isset($_POST['seml']) && isset($_POST['susr']) && isset($_POST['scel']) 
		&& isset($_POST['sadr'])&& isset($_POST['spass'])&& isset($_POST['opass'])&& isset($_POST['user_id'])){
	$nm=$_POST['snme'];
	$mail=$_POST['seml'];
	$un=$_POST['susr'];
	$cell=$_POST['scel'];
	$ads=$_POST['sadr'];
	$pass=$_POST['spass'];
	$opass=$_POST['opass'];
	$id=$_POST['user_id'];
	//all the attributes are received using Post and saved in variables
	
	require_once __DIR__ . '/db_connect.php';
	
	$response=array();
	$response["passchk"]=0;
	$response["uemail"]=0;
	$response["user"]=0;
	$response["success"]=0;
	$db = new DB_CONNECT();
	$em=mysqli_query($db->connect(),"SELECT * FROM userpass WHERE user_id='$id' AND pass='$opass'");
	if(mysqli_num_rows($em) == 1){
		$response["passchk"]=1;
		$em=mysqli_query($db->connect(),"SELECT * FROM customer WHERE c_email='$mail'");
		if(mysqli_num_rows($em)==1){
			
			$em2=mysqli_query($db->connect(),"SELECT c_id FROM customer WHERE c_email='$mail'");
			$em2=mysqli_fetch_array($em2);
			$em2=$em2['c_id'];
			if($em2==$id){
				$response["uemail"]=1;
			}
		}
		if(mysqli_num_rows($em) == 0 ||$response["uemail"]==1 ){
			$response["uemail"]=1;
			mysqli_autocommit($db->connect(),false);
			$result = mysqli_query($db->connect(),"UPDATE customer SET c_name='$nm', c_email='$mail', address='$ads',cell_no='$cell' WHERE c_id='$id'");
			
			$response["user"]=$id;
			$r2=mysqli_query($db->connect(),"UPDATE userpass SET pass='$pass' WHERE user_id='$id'");
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
		else
			echo json_encode($response);
	}
	else
			echo json_encode($response);
}
else 
	echo json_encode("error");


?>