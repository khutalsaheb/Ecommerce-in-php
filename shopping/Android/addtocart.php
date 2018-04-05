<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
 
require_once'config.php';
 $name = $_POST['name'];
 $username = $_POST['username'];
 $password = $_POST['password'];
 $email = $_POST['email'];
 
 if($name == '' || $username == '' || $password == '' || $email == ''){
 
 echo 'please fill all values';
 }else{ 	
  $sql = "INSERT INTO retrofit_users (name,username,password,email) VALUES('$name','$username','$password','$email')"; 
 if(mysqli_query($con,$sql)){
 echo 'successfully Placed Order';
 }else{
 echo 'oops! Please try again!';
 }
 }
  mysqli_close($con);
}