<?php 
		if($_SERVER['REQUEST_METHOD']=='GET'){	
		require_once 'config.php';	
			$sql = "SELECT DISTINCT * FROM category INNER JOIN subcategory on category.id=subcategory.categoryid INNER JOIN products ON subcategory.id=products.subCategory";
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
//"productDescription"=>$res['productDescription'],
"productImage1"=>$res['productImage1'],
"productImage2"=>$res['productImage2'],
"productImage3"=>$res['productImage3'],
"shippingCharge"=>$res['shippingCharge'],
"offers"=>$res['offers'],	
"productAvailability"=>$res['productAvailability']	
			)
		);	
		}

		echo json_encode($result);	
		
		mysqli_close($con);
		
		}
	?>
	