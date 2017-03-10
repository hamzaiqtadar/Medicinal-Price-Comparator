<?php

 require_once __DIR__ . '/db_connect.php';
 	$response["success"]=0;
    $db = new DB_CONNECT();
    if(!$db)
    $response["success"]=0;
    else
    $response["success"]=1;
    echo json_encode($response);


?>