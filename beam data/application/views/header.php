<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 19px 36px;
  text-decoration: none;
  font-size: 17px;
}


.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #6e6868;
  color: white;
}
</style>
</head>
<body>

<div class="topnav">
  <a class="active" href='<?php echo site_url('')?>'>Home</a>
  <a href='<?php echo site_url('main/agents')?>'>Agents</a>
  <a href='<?php echo site_url('main/members')?>'>Members</a>
  <a href='<?php echo site_url('main/stages')?>'>Stages</a>
  <a href='<?php echo site_url('main/performances')?>'>Performances</a>
  <a href='<?php echo site_url('main/bands')?>'>Bands</a>
</div>


</body>

</html>
