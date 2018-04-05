
<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
if(isset($_POST['submit']))
	
{
	//print_r($_POST);
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
	    $dir="Certificates/$email";
		
		$query="SELECT * FROM vendor where email='$email' AND contactno='$contactno'";
		$answer=mysql_query($query);
		$row = mysql_num_rows($answer);
		if($row ==0)
		{
	mkdir($dir);// directory creation for product images
	move_uploaded_file($_FILES["vreg_certificate"]["tmp_name"],"Certificates/$email/".$_FILES["vreg_certificate"]["name"]);
	move_uploaded_file($_FILES["vid_proof"]["tmp_name"],"Certificates/$email/".$_FILES["vid_proof"]["name"]);
//	move_uploaded_file($_FILES["productimage3"]["tmp_name"],"productimages/$productname/".$_FILES["productimage3"]["name"]);
 $sql="INSERT INTO `vendor`(`name`, `email`, `contactno`, `address`, `website`, `username`, `password`, `brand`, `brand_cat`, `vendor_desc`, `vreg_certificate`, `vid_proof`, `creationDate`) VALUES('$name','$email','$contactno','$address','$website','$username','$password','$brand','$brand_cat','$vendor_desc','$vreg_certificate','$vid_proof',NOW())";
$ans = mysql_query($sql);
$_SESSION['msg']="Vendor Inserted Successfully !!";

}
else{
	$_SESSION['msg']=" User Allready Exist!!";
	
}
}
	
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Insert Vendor</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
<script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>


</head>
<body>
<?php include('include/header.php');?>

	<div class="wrapper">
		<div class="container">
			<div class="row">
<?php include('include/sidebar.php');?>				
			<div class="span9">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>Insert Vendor</h3>
							</div>
							<div class="module-body">

									<?php if(isset($_POST['submit']))
{?>
									<div class="alert alert-success">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Well done!</strong>	<?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?>
									</div>
<?php } ?>


									<?php if(isset($_GET['del']))
{?>
									<div class="alert alert-error">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Oh snap!</strong> 	<?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?>
									</div>
<?php } ?>

									<br />

			<form class="form-horizontal row-fluid" name="vendor-manage" method="post" enctype="multipart/form-data">


<div class="control-group">
<label class="control-label" for="basicinput">Vendor Name</label>
<div class="controls">
<input type="text"    name="name"  placeholder="Enter Vendor Name" class="span8 tip" required>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Email Address</label>
<div class="controls">
<input type="text"    name="email"  placeholder="Enter Contact Number" class="span8 tip" required>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Contact Number</label>
<div class="controls">
<input type="text"    name="contactno"  placeholder="Enter Contact Number" class="span8 tip" required>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Address</label>
<div class="controls">
<textarea  name="address"  placeholder="Enter Address Description" rows="6" class="span8 tip">
</textarea>  
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Website</label>
<div class="controls">
<input type="text"    name="website"  placeholder="Enter website" class="span8 tip" required>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">User Name</label>
<div class="controls">
<input type="text"    name="username"  placeholder="Enter User Name" class="span8 tip" required>
</div>
</div>


<div class="control-group">
<label class="control-label" for="basicinput">Password</label>
<div class="controls">
<input type="password"    name="password"  placeholder="Enter Password" class="span8 tip" required>
</div>
</div>


<div class="control-group">
<label class="control-label" for="basicinput">Confirm Password</label>
<div class="controls">
<input type="password" placeholder="Enter Password" class="span8 tip" required>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Product Brand</label>
<div class="controls">
<input type="text"    name="brand"  placeholder="Enter Product brand" class="span8 tip" required>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Product Brand Catagory</label>
<div class="controls">
<input type="text"    name="brand_cat"  placeholder="Enter Product Brand Catagory" class="span8 tip" required>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Vendor Description</label>
<div class="controls">
<textarea  name="vendor_desc"  placeholder="Vendor Description" rows="6" class="span8 tip">
</textarea>  
</div>
</div>


<div class="control-group">
<label class="control-label" for="basicinput">Registration Certificate(Company) </label>
<div class="controls">
<input type="file" name="vreg_certificate" id="vreg_certificate" value="" class="span8 tip" required>
</div>
</div>


<div class="control-group">
<label class="control-label" for="basicinput">ID Proof(Pancard /Address Proof)</label>
<div class="controls">
<input type="file" name="vid_proof"  id="vid_proof" value="" class="span8 tip" required>
</div>
</div>



	<div class="control-group">
											<div class="controls">
												<button type="submit" name="submit" class="btn">SUBMIT</button>
											</div>
										</div>
									</form>
							</div>
						</div>


	
						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

<?php include('include/footer.php');?>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
<?php } ?>