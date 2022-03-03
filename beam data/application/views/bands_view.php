<!DOCTYPE html>
<html>
<title>BEAM</title>
<head>
	<meta charset="utf-8" />
	<style>
		#grad1 {
		 height: 1080px;
		 background-color: white; /* For browsers that do not support gradients */
		 background-image: linear-gradient(white, black); /* Standard syntax (must be last) */
		}
		
		h1 { text-align: center; 	font-family: Helvetica; }
		p.p-centre { text-align: center; font-family: helvetica; }
		
		h1 { text-align: center; 	font-family: helvetica; }
	</style>
	
<div id="grad1">

	<?php 
	foreach($css_files as $file): ?>
		<link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
	<?php endforeach; ?>
	<?php foreach($js_files as $file): ?>
		<script src="<?php echo $file; ?>"></script>
	<?php endforeach; ?>
	</head>
	<body>

	<h1>BANDS</h1>
	
		<div>
			<?php echo $output; ?>
		</div>
	</body>

</div>
</html>
