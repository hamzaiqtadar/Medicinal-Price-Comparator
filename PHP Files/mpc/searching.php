<?php

if(isset($_POST['text'])&& isset($_POST['type'])){
	$response=array();		// array which will be encoded
	$type=$_POST['type'];		// formula or name search
	$text=$_POST['text'];
	require_once __DIR__ . '/db_connect.php';	// adding class for connection
	
	$db = new DB_CONNECT();
		// if connection is successful
		$response["success"]=1;
		switch($type){
			case "formula":
				$result= mysqli_query($db->connect(),"SELECT medicine_id, medicine_name,formula_name,company_name,unit,price_per_unit FROM medicine_info JOIN gen_formula ON(formula_id=med_gen_for) " .
						"JOIN company ON(company_id=med_company_id) JOIN medicine_type ON (med_type=type_id) WHERE formula_name LIKE '%$text%' ORDER BY formula_name DESC");
				if(mysqli_num_rows($result)>0){
					$response["products"]=array();
					while($row = mysqli_fetch_array($result)){
						$product=array();
						$product["medicine_id"]=$row["medicine_id"];
						$product["medicine_name"]=$row["medicine_name"];
						$product["formula_name"]=$row["formula_name"];
						$product["company_name"]=$row["company_name"];
						$product["unit"]=$row["unit"];
						$product["price_per_unit"]=$row["price_per_unit"];
						
						array_push($response["products"],$product);
					}
					$response["found"]=1;
				}
				break;
			case "name":
				//$result= mysqli_query($db->connect(),"SELECT medicine_id, medicine_name,formula_name FROM medicine_info JOIN gen_formula ON(formula_id=med_gen_for) WHERE medicine_name LIKE '%$text%' ORDER BY medicine_name DESC");
				$result= mysqli_query($db->connect(),"SELECT medicine_id, medicine_name,formula_name,company_name,unit,price_per_unit FROM medicine_info JOIN gen_formula ON(formula_id=med_gen_for) " .
						"JOIN company ON(company_id=med_company_id) JOIN medicine_type ON (med_type=type_id) WHERE medicine_name LIKE '%$text%' ORDER BY medicine_name DESC");
				
				if(mysqli_num_rows($result)>0){
					$response["products"]=array();
					while($row = mysqli_fetch_array($result)){
						$product=array();					// temporary array which store asingle row
						$product["medicine_id"]=$row["medicine_id"];
						$product["medicine_name"]=$row["medicine_name"];
						$product["formula_name"]=$row["formula_name"];
						$product["company_name"]=$row["company_name"];
						$product["unit"]=$row["unit"];
						$product["price_per_unit"]=$row["price_per_unit"];
						
						array_push($response["products"],$product);	// the row is pushed in array of rows
					}
					$response["found"]=1;
				}
				break;
			case "price":
			$result= mysqli_query($db->connect(),"SELECT medicine_id, medicine_name,formula_name,company_name,unit,price_per_unit FROM medicine_info JOIN gen_formula ON(formula_id=med_gen_for) " .
						"JOIN company ON(company_id=med_company_id) JOIN medicine_type ON (med_type=type_id) WHERE formula_name = '$text' ORDER BY price_per_unit");
				
				if(mysqli_num_rows($result)>0){
					$response["products"]=array();
					while($row = mysqli_fetch_array($result)){
						$product=array();					// temporary array which store asingle row
						$product["medicine_id"]=$row["medicine_id"];
						$product["medicine_name"]=$row["medicine_name"];
						$product["formula_name"]=$row["formula_name"];
						$product["company_name"]=$row["company_name"];
						$product["unit"]=$row["unit"];
						$product["price_per_unit"]=$row["price_per_unit"];
						
						array_push($response["products"],$product);	// the row is pushed in array of rows
					}
					$response["found"]=1;
				}
			break;
			default:
				break;
		}
		echo json_encode($response);
}
else {
	$response["success"]=0;
	$response["found"]=0;
	echo json_encode($response);
}
	


?>