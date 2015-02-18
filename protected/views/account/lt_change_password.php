<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header">
    	<h1>Change password</h1>
    </div>
    <div class="hr"></div>
    <div class="content-block login-block">
        <p class="in-login-p">Suspendisse vehicula eget diam non venenatis. Pellentesque lacinia erat mauris. Integer pellentesque faucibus dignissim. Curabitur ut posuere risus. Nulla sed neque ac magna vestibulum mattis eget ut nunc. Fusce iaculis sed ligula id consectetur. Vestibulum sollicitudin et justo nec commodo. Mauris et dui sit amet purus convallis hendrerit. </p>

         <?php $form = $this->beginWidget('CActiveForm',array('enableAjaxValidation'=>false )); ?>
            <table>
                

             <tbody>
                <tr>
                    <td><?php echo $form->label($form_model,'temp_pass'); ?>:</td>
                    <td>
                    	<?php echo $form->passwordField($form_model,'temp_pass');?>
                        <?php echo $form->error($form_model,'temp_pass');?>
                    </td>
                </tr>
                
                <tr>
                    <td><?php echo $form->label($form_model,'new_pass'); ?>:</td>
                    <td>
                        <?php echo $form->passwordField($form_model,'new_pass');?>
                        <?php echo $form->error($form_model,'new_pass');?>
                    </td>
                </tr>
                <tr>
                    <td><?php echo $form->label($form_model,'repeat_pass');?>:</td>
                    <td>
                        <?php echo $form->passwordField($form_model,'repeat_pass');?>
                        <?php echo $form->error($form_model,'repeat_pass');?>
                    </td>
                </tr>
 
            </tbody>
            </table>

            <div class="one-row-long">
                <input type="submit" class="button change-password" value="Change password">
            </div>
        <?php $this->endWidget(); ?>

        
        
    </div>
    <div style="clear: both;"></div>
</div>
