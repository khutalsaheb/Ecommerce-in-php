<?php
	error_reporting(0);
include('includes/config.php');
	$name =""; 
	$email = ""; 
	$contactno =""; 
	$address = ""; 
	$website = ""; 
	$username = "";
	$password = "";
	$brand = "";
	$brand_cat = "";
	$vendor_desc = "";
	$vreg_certificate ="";
	$vid_proof ="";
	$msg="";
	
	if($_POST)
	{
		$array = array();
		$name = $_POST['name']; 
		$email = strtolower($_POST['email']); 
		$contactno = $_POST['contactno']; 
		$address = $_POST['address']; 
		$website = $_POST['website']; 
		$username = $_POST['username'];
		$password = md5($_POST['password']);
		$brand = $_POST['brand'];
		$brand_cat = $_POST['brand_cat'];
		$vendor_desc = $_POST['vendor_desc'];
		$vreg_certificate =$_FILES['vreg_certificate'] ['name'];
		$vid_proof =$_FILES['vid_proof'] ['name'];
		
		if(empty($name))
		{
			$error1 = "Enter your name.";
			$code = 1;
		}
		else if(!ctype_alpha($name))
		{
			$error1= "Username must have alphabet characters only";
			$code = 1;
		}
		
		else if(!preg_match("/^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i", $email))
		{
			$error2 = "Please enter valid mail ID";
			$code = 2;			
		}
		else if(empty($contactno))
		{
			$error3 = "Enter your contact no";
			$code = 3;
		}
		else if(!is_numeric($contactno))
		{
			$error3 = "Enter numbers only";
			$code = 3;
		}
		else if(!preg_match("/^[789]\d{9}$/", $contactno))
		{
			$error3 = "Please enter valid number";
			$code = 2;			
		}
		else if(strlen($contactno)!=10)
		{
			$error3 = "Enter upto 10 digits only !";
			$code = 3;
		}
		
		else if(empty($address))
		{
			$error4 = "Enter your address";
			$code = 4;
		}
		else
		{
			if( $_FILES ['vid_proof']['name'] =="")
			{
				 $error6 =  "Please Select file for uploading.";
				  $error5 =  "Please Select file for uploading.";
			}
			else
			{
				
				$exist_query = "select * from vendor where email = '".$email."' ";
				$ans = mysql_query($exist_query);
				$row = mysql_num_rows($ans);
				if($row==0)
				{	
			 $query_vendor ="insert into vendor (name,email,contactno,address,website,username,password,brand,brand_cat,vendor_desc) values
			 ('".$name."','".$email."','".$contactno."','".$address."','".$website."','".$username."','".$password."','".$brand."','".$brand_cat."','".$vendor_desc."')";
				$query_ans = mysql_query($query_vendor);
				
				if($query_ans)
				 {
					 $recent_id = mysql_insert_id();
					 if($_FILES ['vreg_certificate']['name'])
					 {
						 $image_name = $_FILES['vreg_certificate']['name'];
						 $image_source = $_FILES['vreg_certificate']['tmp_name'];
						 @$extension = end(explode( ".",$_FILES['vreg_certificate']['name']));
						 if(($_FILES['vreg_certificate']['size'])> 2097152000) 
						 {
							 $error5 = "file is too large..";
						 }
						 else
						 {
							 $extarray=array("png","jpg","jpeg","pdf","doc","txt");
							 $ext_array=  explode(".", $_FILES['vreg_certificate']['name']);
							 $ext=$ext_array[1];
							 if(!in_array($ext,$extarray))
							 {
								 $error5 =  "Only jpg,jpeg,gif,png,doc,txt files are allowed";
							 }
							 else
							 {
								 $newfilename="vendordoc_certificate_".time().".".$ext;
								 $destination="vendordoc_certificate/".$newfilename;
								 if(move_uploaded_file($image_source,$destination))
								 {
									 $update_query = "UPDATE  vendor set vreg_certificate ='".$newfilename."' where id ='".$recent_id."' ";
									 $ans_query =mysql_query($update_query);
									if($ans_query)
									{
									//	header("location:sucess.php");
										//echo "Registration Successfully";
										echo "<script>alert('You are successfully register');</script>";
									}	
								 }
								 else
								 {
									 $error5 =  "There is an error while uploading";
								 }
							 }	 
						 }	 
						 
					 }
					 else
					 {
						 $error5 = "Please upload your certificate.";
					 }
					 
					  if($_FILES ['vid_proof']['name'])
					 {
						 $image_name = $_FILES['vid_proof']['name'];
						 $image_source = $_FILES['vid_proof']['tmp_name'];
						 @$extension = end(explode( ".",$_FILES['vid_proof']['name']));
						 if(($_FILES['vid_proof']['size'])> 2097152000) 
						 {
							 $error6 = "file is too large..";
						 }
						 else
						 {
							 $extarray=array("png","jpg","jpeg","gif","doc","txt");
							 $ext_array=  explode(".", $_FILES['vid_proof']['name']);
							 $ext=$ext_array[1];
							 if(!in_array($ext,$extarray))
							 {
								 $error6 =  "Only jpg,jpeg,gif,png,doc,txt files are allowed";
							 }
							 else
							 {
								 $newfilename="vendor_".time().".".$ext;
								 $destination="vendors/".$newfilename;
								 if(move_uploaded_file($image_source,$destination))
								 {
									 $update_query = "UPDATE  vendor set vid_proof ='".$newfilename."' where id ='".$recent_id."' ";
									 $ans_query =mysql_query($update_query);
									 if($ans_query)
									{
										echo "<script>alert('You are successfully register');</script>";
										//header("location:sucess.php");
											//echo "Registration Successfully";
									}	
									
									
								
								 }
								 else
								 {
									 $error6 =  "There is an error while uploading";
								 }
							 }	 
						 }	 
						 
					 }
					 else
					 {
						 $error6 = "Please upload  your ID proof.";
					 }
					}
				}
			else
			{
				$error2 = "User already exist";
				$error3 = "User already exist";
			}
		}
		}
		
	}
	
?>

<html>
<head>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>

  </script>
  
<script>
	$('#vreg_certificate').bind('change', function() {

  //this.files[0].size gets the size of your file.
  alert(this.files[0].size);

});
		
		
		function myFunction_fname(val)
	{
		var letters = /^[A-Za-z]+$/;  
		//alert("hello");
		var name = document.getElementById('vname').value;
		//alert(name);
		if(name == "")
		{
			document.getElementById("vname_er").innerHTML = 'Please enter your name ';
			return false;  
		}
		else if(val.match(letters))  
		{  
			document.getElementById("vname_er").innerHTML = "";
			error = 1 ;  
		}  
		else  
		{  
			document.getElementById("vname_er").innerHTML = 'Name must have alphabet characters only'; 
			return false;  
		} 
	}
	

	
		function myFunction_email(val)
			{
				var mail_format = /^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i;
				
				var email = document.getElementById('vemail').value;
				//alert(mail1);
				//if(email == "")
				//{
				//document.getElementById("vemail_er").innerHTML = 'Please enter your Email address ';
				//return false;  
				//}
				 if(val.match(mail_format))  
				{  
				document.getElementById("vemail_er").innerHTML = "";
				//return true;  
				error = 1 ;  
				}  
				else  
				{  
				document.getElementById("vemail_er").innerHTML = 'Please enter valid mail ID';
				return false;  
			  
				} 
			}
			
			function myFunction_mob(val)
			{
				//alert("Hello");
				var contactno_format = /^([0|\+[0-9]{1,5})?([7-9][0-9]{9})$/;
				var size =  /^\d{10}$/;
				var mob = document.getElementById('contactno').value;
				if(mob == "")
				{
					document.getElementById("vmobno_er").innerHTML = 'Please enter your contactno number ';
				}
				else if(!val.match(contactno_format))  
				{  
					document.getElementById("vmobno_er").innerHTML = 'Please Enter correct number';
				}  
				else if(!val.match(size)) 
				{  
					document.getElementById("vmobno_er").innerHTML = 'Please Enter 10 number only';
					
				} 
				else
				{
					document.getElementById("vmobno_er").innerHTML = "";
					error = 1 ;  			
				}
			}
			
			function validation()
			{
					var vreg_certificate=document.getElementById('vreg_certificate').value;
					var vid_proof=document.getElementById('vid_proof').value;
					
					if(vreg_certificate)
					{
						var extension=vreg_certificate.substr(vreg_certificate.lastIndexOf('.')+1).toLowerCase();
						
						if(extension=='jpg' || extension=='jpeg' || extension =='png' || extension =='doc' || extension =='pdf') 
						{
							document.getElementById("vreg_cer_er").innerHTML = "";
						}
						else 
						{
							document.getElementById("vreg_cer_er").innerHTML = "Not Allowed Extension!";
							return false;
						}

					}	
					
					if(vid_proof)
					{		
						var extension=vid_proof.substr(vid_proof.lastIndexOf('.')+1).toLowerCase();
						
						if(extension=='jpg' || extension=='jpeg' || extension =='png' || extension =='doc' || extension =='pdf') 
						{
							document.getElementById("vid_er").innerHTML = "";
						}
						else 
						{
							document.getElementById("vid_er").innerHTML = "Not Allowed Extension!";
							return false;
						}
					
					}
			}
	
			function validateUrl(textval)   // return true or false.
			{
				//alert("Hello");
				var urlregex = new RegExp("^(http:\/\/www.|https:\/\/www.|ftp:\/\/www.|www.){1}([0-9A-Za-z]+\.)");
				if (urlregex.test(textval))
				{
					
				}
			}
</script>
	<style>
	.error
	{
		color :red;
	}
	#cart_img,#cart
	{
		display:none;
	}
	</style>
</head>
<body>
<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>Home Page</title>

	    <!-- Bootstrap Core CSS -->
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    
	    <!-- Customizable CSS -->
	    <link rel="stylesheet" href="assets/css/main.css">
	    <link rel="stylesheet" href="assets/css/green.css">
	    <link rel="stylesheet" href="assets/css/owl.carousel.css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css">
		<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
		<link href="assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<link rel="stylesheet" href="assets/css/rateit.css">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

		<!-- Demo Purpose Only. Should be removed in production -->
		<link rel="stylesheet" href="assets/css/config.css">

		<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
		<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
		<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
		<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
		<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="assets/images/favicon.ico">

	</head>
    <body class="cnt-home">
	
		
 
	<!--vendor singup-->
  <div class="container" >
 <div class="module-foot">
							<div class="control-group">
								<div class="controls clearfix"></br></br></br></br>
							  	<label class="forgot-password pull-left" style="font-size=25px">Vendor Registration</label>		
								<a href="http://localhost/ShoppingPortalProVersion/shopping/vendor/" class="forgot-password pull-right" style="font-size=25px">Already Registered ?</a>			
					 	
								</div>
							</div>
						</div>
	<div class ="row">
		<div class ="col-md-12">
			<div class ="col-md-3"></div>
			<div class ="col-md-6"  id ="vend_singup">
			<?php 
						if($msg)
						{
					?>
						<div class="alert alert-success">
							<strong><?php echo $msg; ?></strong>
						</div>
					<?php
						}
					?>
			<form action ="" method ="post" enctype='multipart/form-data'>
			    <!--<form action ="" method ="post">--> 
				<div class ="form-group">
					<label>Vendor Name</label><span style = "color:red; padding :5px;">*</span>
					<input type ="text" class="form-control" name ="name" id="name" placeholder="Enter your Name" onkeypress="myFunction_fname(this.value);" required>
					<div class ="error" id="vname_er">
					<?php if(isset($error1))
					{
						echo $error1;
					}?>
					</div>
					 
				</div>
				
				<div class ="form-group">
					<label>Contact Email</label><span style = "color:red; padding :5px;">*</span>
					<input type ="email" class ="form-control" name ="email" id="email" placeholder ="Enter your Email Id" onchange ="myFunction_email(this.value);" required>
					<div class ="error" id="vemail_er">
					<?php if(isset($error2))
					{
						echo $error2;
					}?>
					</div>
				</div>
				
				<div class ="form-group">
					<label>Contact Number</label><span style = "color:red; padding :5px;">*</span>
					<input type ="text"  class= "form-control" name ="contactno" id="contactno" placeholder= "Enter Your contact Number" maxlength ="10" onchange ="myFunction_mob(this.value);" required>
					<div class ="error" id= "vmobno_er">
					<?php if(isset($error3))
					{
						echo $error3;
					}?>
					</div>
				</div>
				
				<div class ="form-group">
					<label>Vendor Address</label><span style = "color:red; padding :5px;">*</span>
					<textarea class ="form-control" name ="address" id="address" placeholder ="Enter Your Address"  style="resize:none" onchange ="myFunction_address(this.value);"required></textarea>
					<div class ="error" id="vaddress_er">
					<?php if(isset($error4))
					{
						echo $error4;
					}?>
					</div>
				</div>
				
				<div class ="form-group">
					<label>Username</label>
					<input type ="text" class ="form-control" name="username"  id="username" placeholder ="Enter User name" onkeypress ="validateUrl(this.value);" required>
					<div class ="error" id ="website_er"></div>
				</div>
				
				<div class ="form-group">
					<label>Password</label>
					<input type ="password" class ="form-control" name="password"  id="password" placeholder ="Enter Password" onkeypress ="validateUrl(this.value);" required >
					<div class ="error" id ="website_er"></div>
				</div>
				
				<div class ="form-group">
					<label>Confirm Password</label>
					<input type ="password" class ="form-control" name="website"  id="website" placeholder ="Enter Confirm Password" onkeypress ="validateUrl(this.value);" required >
					<div class ="error" id ="website_er"></div>
				</div>
				
				<div class ="form-group">
					<label>Vendor website</label>
					<input type ="text" class ="form-control" name="website"  id="website" placeholder ="http://www." onkeypress ="validateUrl(this.value);" required>
					<div class ="error" id ="website_er" ></div>
				</div>
				
				<div class ="form-group">
					<label>Comapny/Brand Name</label>
					<input type ="text" class ="form-control" name="brand"  id="brand" placeholder ="Like Dell,Samsung" onkeypress ="validateUrl(this.value);" required>
					<div class ="error" id ="website_er"></div>
				</div>
				
				<div class ="form-group">
					<label>Category Name</label>
					<input type ="text" class ="form-control" name="brand_cat"  id="brand_cat" placeholder ="Core I3(model number)" onkeypress ="validateUrl(this.value);" required>
					<div class ="error" id ="website_er"></div>
				</div>
				
					
				
				<div class ="form-group">
					<label>Description Of vendor Service</label>
				
						<textarea class ="form-control" name ="vendor_desc" id="vendor_desc" placeholder ="Description of your service"  style="resize:none" required></textarea>
					<!--<div class ="error" id ="website_er"></div>-->
				</div>
				
				<div class ="form-group">
					<label>Registration Certificate(Company) </label><span style = "color:red; padding :5px;">*</span><span style = "color:red;">(Note:valid file format png,jpg,jpeg)</span>
					<input type ="file" name ="vreg_certificate"  id = "vreg_certificate" onchange = "validation();" required>
					<div class ="error" id="vreg_cer_er">
					<?php if(isset($error5))
					{
						echo $error5;
					}?>
					</div>
				</div>
				
				<div class= "form-group">
					<label>ID Proof(Pancard /Address Proof)</label><span style = "color:red; padding :5px;">*</span>
					<span style = "color:red;">(Note:valid file format png,jpg,jpeg)</span>
					<input type ="file" name ="vid_proof"  id = "vid_proof" onchange = "validation();" required>
					<div class ="error" id="vid_er">
					<?php if(isset($error6))
					{
						echo $error6;
					}?>
					</div>
				</div>
				
				<div class="form-group">
					<button type ="submit" class ="btn btn-danger col-md-offset-3 col-xs-offset-3" style ="font-size:25px;" onclick ="validation();">SUBMIT</button> 
				</div>
			
			</div>
		</form>
			<div class="col-md-3"></div>
		</div>
	</div>
  </div><br><br><br><br><br><br>
  
  
  
</body>
<html>
