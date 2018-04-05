<?php 
		if($_SERVER['REQUEST_METHOD']=='GET'){	
  $productName  = $_GET['productName'];
	require_once 'config.php';	
		 $sql = "SELECT DISTINCT * FROM `products` WHERE productName LIKE '{$productName}%' ";
		$r = mysqli_query($con,$sql);		
			$result = array();		
                 while($res = mysqli_fetch_array($r)){   
	array_push($result,array(
"id"=>$res['id'],
"category"=>$res['category'],
"subCategory"=>$res['subCategory'],
"productName"=>$res['productName'],
"productCompany"=>$res['productCompany'],
"productPrice"=>$res['productPrice'],
"productPriceBeforeDiscount"=>$res['productPriceBeforeDiscount'],
"productDescription"=>$res['productDescription'],
"productImage1"=>$res['productImage1'],
"productImage2"=>$res['productImage2'],
"productImage3"=>$res['productImage3'],
"shippingCharge"=>$res['shippingCharge'],
	"offers"=>$res['offers'],	
		"productAvailability"=>$res['productAvailability']	
			)
		);	
		}

		echo json_encode(($result));	
		mysqli_close($con);

		}
	?>
	