<?php
if (count($error1) > 0) :?>
	<div class="error">
		<?php
		foreach ($error1 as $error) :?>
				<?php echo $error ?>
		<?php endforeach ?>
	</div>
<?php endif ?>
