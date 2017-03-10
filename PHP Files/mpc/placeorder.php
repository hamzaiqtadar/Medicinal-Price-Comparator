<?php

$json = file_get_contents('php://input',true);
$obj = json_decode($json,true);
require_once __DIR__ . '/db_connect.php';	// adding class for connection

$db = new DB_CONNECT();
$array=$obj['cart'];
$continue=1;
// if connection is successful
	foreach($array as $order) { //foreach element in $arr
		$mid=$order['mi'];
		$apy=mysqli_query($db->connect(),"SELECT SUM(total_quantity) AS qty FROM" .
					" stock_info WHERE medicine_id=$mi;");
					$row = mysqli_fetch_array($apy);
					$num= $row["qty"];
		if($num<$order['qty'])
		{
			$continue=0;
			break;
		}
		//$uses = $item['var1']; //etc
	}
	if($continue==1){
		mysqli_autocommit($db->connect(),false);
		$trans=mysqli_query($db->connect(),"Insert INTO payment_transcation(t_status,t_val_date) " .
												"VALUES('Pending',DATE_ADD(NOW(), INTERVAL 7 DAY))");
				
		$tid=mysqli_insert_id ($trans);
		$trans=mysqli_query($db->connect(),"Insert Into order_tbl(customer_id,date_added,transaction_id,due_date,order_status) " .
											"Values(7,now(),3,now(),'Pending')");
		$tid=mysqli_insert_id ($trans);
	}


echo json_encode($array[0]['medicine_name']);
?>