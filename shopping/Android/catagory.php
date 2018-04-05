<?php 
		if($_SERVER['REQUEST_METHOD']=='GET'){		
		require_once'config.php';	
			$sql = "SELECT DISTINCT * FROM category";	 
		$r = mysqli_query($con,$sql);		
			$result = array();		
                 while($res = mysqli_fetch_array($r)){   
             	array_push($result,array(
             "id"=>$res['id'],
             "name"=>$res['categoryName']		
			)
		);	
		}
		echo json_encode(($result));	
		mysqli_close($con);
		
		}
	?>
	

 