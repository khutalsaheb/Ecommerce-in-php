<?php 
		if($_SERVER['REQUEST_METHOD']=='GET'){	
	$catagory_id  = $_GET['catagory_id'];			
		require_once'config.php';	
			$sql = " SELECT DISTINCT * FROM  category INNER JOIN subcategory ON category.id=subcategory.categoryid WHERE category.id='$catagory_id'";
		$r = mysqli_query($con,$sql);		
			$result = array();		
                 while($res = mysqli_fetch_array($r)){   
	array_push($result,array(
"subcategory"=>$res['subcategory'],
"categoryid"=>$res['id']	
				
			)
		);	
		}
		//echo json_encode(($result));

 echo json_encode(array("result"=>$result));
		
		mysqli_close($con);
		
		}
	?>
	

 