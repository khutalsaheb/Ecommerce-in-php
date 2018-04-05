<div class="span3">
					<div class="sidebar">


<ul class="widget widget-menu unstyled">
							<li>
								<a class="collapsed" data-toggle="collapse" href="#togglePages">
									<i class="menu-icon icon-cog"></i>
										Order Management
								</a>
									<li>
										<a href="todays-orders.php">
											<i class="icon-tasks"></i>
											Today's Orders
  <?php
  				
						$user=$_SESSION['alogin'];
                  $sql_sel_query = "SELECT * FROM  vendor where username='".$user."'";
		$res_sel_query = mysql_query($sql_sel_query);
		if($res_sel_query)
		{
			$update_profile = mysql_fetch_assoc($res_sel_query);
		}
		$brand = $update_profile['brand'];
 
  $f1="00:00:00";
$from=date('Y-m-d')." ".$f1;
$t1="23:59:59";
$to=date('Y-m-d')." ".$t1;
// $result = mysql_query("SELECT * FROM Orders where  orderDate Between '$from' and '$to'");
 $result = mysql_query("SELECT * FROM `orders` INNER JOIN products ON orders.productId=products.id WHERE products.productCompany='$brand' and orderDate Between '$from' and '$to'"); 
$num_rows1 = mysql_num_rows($result);
{
?>
											<b class="label orange pull-right"><?php echo htmlentities($num_rows1); ?></b>
											<?php } ?>
										</a>
									</li>
									<li>
										<a href="pending-orders.php">
											<i class="icon-tasks"></i>
											Pending Orders
										<?php	
												$user=$_SESSION['alogin'];
                  $sql_sel_query = "SELECT * FROM  vendor where username='".$user."'";
		$res_sel_query = mysql_query($sql_sel_query);
		if($res_sel_query)
		{
			$update_profile = mysql_fetch_assoc($res_sel_query);
		}
		$brand = $update_profile['brand'];


	$status='Delivered';									 
$ret = mysql_query("SELECT * FROM `orders` INNER JOIN products ON orders.productId=products.id WHERE products.productCompany='$brand' and (orderStatus!='$status' || orderStatus is null)");
$num = mysql_num_rows($ret);
{?><b class="label orange pull-right"><?php echo htmlentities($num); ?></b>
<?php } ?>
										</a>
									</li>
									<li>
										<a href="delivered-orders.php">
											<i class="icon-inbox"></i>
											Delivered Orders
								<?php	
								$user=$_SESSION['alogin'];
                  $sql_sel_query = "SELECT * FROM  vendor where username='".$user."'";
		$res_sel_query = mysql_query($sql_sel_query);
		if($res_sel_query)
		{
			$update_profile = mysql_fetch_assoc($res_sel_query);
		}
		$brand = $update_profile['brand'];
	$status='Delivered';									 
$rt = mysql_query("SELECT * FROM `orders` INNER JOIN products ON orders.productId=products.id WHERE products.productCompany='$brand' and orderStatus='$status'");
$num1 = mysql_num_rows($rt);
{?><b class="label green pull-right"><?php echo htmlentities($num1); ?></b>
<?php } ?>

										</a>
									</li>
							
							</li>
							
						
						</ul>

	</br></br></br></br></br></br></br>
								<ul class="widget widget-menu unstyled">
						
							<li>
								<a href="logout.php">
									<i class="menu-icon icon-signout"></i>
									Logout
								</a>
							</li>
						</ul>

					</div><!--/.sidebar-->
				</div><!--/.span3-->
