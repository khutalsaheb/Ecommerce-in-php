<?php 

	require_once'config.php';	
	
	//an array to display response
	$response = array();
//	`name`, `email`, `contactno`, `password`
	//if it is an api call 
	//that means a get parameter named api call is set in the URL 
	//and with this parameter we are concluding that it is an api call

	if(isset($_GET['apicall'])){
		
		switch($_GET['apicall']){
			
			case 'signup':
				//checking the parameters required are available or not 
				if(isTheseParametersAvailable(array('name','email','password','contactno'))){
					
					//getting the values 
					$name = $_POST['name']; 
					$email = $_POST['email']; 
					$password = md5($_POST['password']);
					$contactno = $_POST['contactno']; 
					
					//checking if the user is already exist with this name or email
					//as the email and name should be unique for every user 
					$stmt = $con->prepare("SELECT id FROM users WHERE name = ? OR email = ?");
					$stmt->bind_param("ss", $name, $email);
					$stmt->execute();
					$stmt->store_result();
					
					//if the user already exist in the database 
					if($stmt->num_rows > 0){
						$response['error'] = true;
						$response['message'] = 'User already registered';
						$stmt->close();
					}else{
						
						//if user is new creating an insert query 
						$stmt = $con->prepare("INSERT INTO users (name, email, password, contactno) VALUES (?, ?, ?, ?)");
						$stmt->bind_param("ssss", $name, $email, $password, $contactno);
						
						//if the user is successfully added to the database 
						if($stmt->execute()){
							
							//fetching the user back 
							$stmt = $con->prepare("SELECT id, id, name, email, contactno FROM users WHERE name = ?"); 
							$stmt->bind_param("s",$name);
							$stmt->execute();
							$stmt->bind_result($userid, $id, $name, $email, $contactno);
							$stmt->fetch();
							
							$user = array(
								'id'=>$id, 
								'name'=>$name, 
								'email'=>$email,
								'contactno'=>$contactno
							);
							
							$stmt->close();
							
							//adding the user data in response 
							$response['error'] = false; 
							$response['message'] = 'User registered successfully'; 
							$response['user'] = $user; 
						}
					}
					
				}else{
					$response['error'] = true; 
					$response['message'] = 'required parameters are not available'; 
				}
				
			break; 
			
			case 'login':
				//for login we need the name and password 
				if(isTheseParametersAvailable(array('contactno', 'password'))){
					//getting values 
					$contactno = $_POST['contactno'];
					$password = md5($_POST['password']); 
					
					//creating the query 
					$stmt = $con->prepare("SELECT id, name, email, contactno FROM users WHERE contactno = ? AND password = ?");
					$stmt->bind_param("ss",$contactno, $password);
					
					$stmt->execute();
					
					$stmt->store_result();
					
					//if the user exist with given credentials 
					if($stmt->num_rows > 0){
						
						$stmt->bind_result($id, $name, $email, $contactno);
						$stmt->fetch();
						
						$user = array(
							'id'=>$id, 
							'name'=>$name, 
							'email'=>$email,
							'contactno'=>$contactno
						);
						
						$response['error'] = false; 
						$response['message'] = 'Login successfull'; 
						$response['user'] = $user; 
					}else{
						//if the user not found 
						$response['error'] = false; 
						$response['message'] = 'Invalid name or password';
					}
				}
			break; 
			
			case 'addtocart':
			if(isTheseParametersAvailable(array('name','email','address','contactno','city','pincode'))){
					$name = $_POST['name']; 
					$email = $_POST['email']; 
					$address =$_POST['address'];
					$contactno = $_POST['contactno']; 
					$city = $_POST['city'];
					$pincode = $_POST['pincode'];
					$orders = $_POST['orders']; 
						//if user is new creating an insert query 
						$stmt = $con->prepare("INSERT INTO cart (name, email, address, contactno,city,pincode,orders,orderdate) VALUES (?, ?,?,?,?,?,?,NOW())");
						$stmt->bind_param("sssssss",$name,$email,$address,$contactno,$city,$pincode,$orders);						
						$stmt->execute();
						//	$stmt->bind_result($name,$email,$address,$contactno,$city,$pincode);
						//	$stmt->fetch();
														
							$stmt->close();
							
							//adding the user data in response 
							$response['error'] = false; 
							$response['message'] = 'Order Booking successfully'; 
							//$response['user'] = $user; 
											
				}else{
					$response['error'] = true; 
					$response['message'] = 'required parameters are not available'; 
				}
			break;
				
			case 'wishlist':
			//`email_id`, `product_id`, `product_name`, `wishdate` 
			if(isTheseParametersAvailable(array('email','product_id'))){
				
					$email = $_POST['email']; 
					$product_id =$_POST['product_id'];
					$product_name = $_POST['product_name']; 
				
	         $stmt = $con->prepare("SELECT id FROM newwishlist WHERE email = ? AND product_id = ?");
					$stmt->bind_param("ss", $email, $product_id);
					$stmt->execute();
					$stmt->store_result();
					
					//if the user already exist in the database 
					if($stmt->num_rows > 0){
						$response['error'] = true;
						$response['message'] = 'Product already in Wishlist ';
						$stmt->close();
					}else{				
						//if user is new creating an insert query 
						$stmt = $con->prepare("INSERT INTO `newwishlist`(`email`, `product_id`, `product_name`, `wishdate`) VALUES(?,?,?,NOW())");
						$stmt->bind_param("sss",$email,$product_id,$product_name);						
						$stmt->execute();
						//	$stmt->bind_result($name,$email,$address,$contactno,$city,$pincode);
						//	$stmt->fetch();
														
							$stmt->close();
							
							//adding the user data in response 
							$response['error'] = false; 
							$response['message'] = 'Added To Wishlist successfully'; 
							//$response['user'] = $user; 
					}					
				}else{
					$response['error'] = true; 
					$response['message'] = 'required parameters are not available'; 
				}
			break;
			
			default: 
				$response['error'] = true; 
				$response['message'] = 'Invalid Operation Called';
		}
		
	}else{
		//if it is not api call 
		//pushing appropriate values to response array 
		$response['error'] = true; 
		$response['message'] = 'Invalid API Call';
	}
	
	//displaying the response in json structure 
	echo json_encode($response);
	
	//function validating all the paramters are available
	//we will pass the required parameters to this function 
	function isTheseParametersAvailable($params){
		
		//traversing through all the parameters 
		foreach($params as $param){
			//if the paramter is not available
			if(!isset($_POST[$param])){
				//return false 
				return false; 
			}
		}
		//return true if every param is available 
		return true; 
	}