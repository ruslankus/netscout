<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header">
    	<h1>Registration</h1>
    </div>
    <div class="hr"></div>
    <div class="content-block login-block">
        <p class="in-login-p">Suspendisse vehicula eget diam non venenatis. Pellentesque lacinia erat mauris. Integer pellentesque faucibus dignissim. Curabitur ut posuere risus. Nulla sed neque ac magna vestibulum mattis eget ut nunc. Fusce iaculis sed ligula id consectetur. Vestibulum sollicitudin et justo nec commodo. Mauris et dui sit amet purus convallis hendrerit. </p>

        <?php $form=$this->beginWidget('CActiveForm',array('id' =>'','enableAjaxValidation'=>false,)); ?>
            <table>
                <input type="hidden" value="" name="Register[anti_cap]">
                <?php echo $form->error($form_model,'common');?>    
                <tbody><tr>
                    <td><?php echo $form->label($form_model,'login'); ?>:</td>
                    <td>
                        <?php echo $form->textField($form_model,'login');?>
                        <?php echo $form->error($form_model,'login')?>
                    </td>
                </tr>
                <tr>
                    <td><?php echo $form->label($form_model,'password'); ?>:</td>
                    <td>
                        <?php echo $form->passwordField($form_model,'password'); ?>
                        <?php echo $form->error($form_model,'password');?>
                    </td>
                </tr>
                <tr>
                    <td><?php echo $form->label($form_model,'email');?>:</td>
                    <td>
                        <?php echo $form->textField($form_model,'email')?>
                        <?php echo $form->error($form_model, 'email'); ?>
                    </td>
                </tr>
                <tr>
                	<td><label for="key-field"> Key</label></td>
                    <td>
                    	<?php echo $form->textField($form_model,'key1',array('class'=>'key-field','maxlength'=>4,'placeholder'=>'XXXX'));?>&nbsp;-
                    	<?php echo $form->textField($form_model,'key2',array('class'=>'key-field','maxlength'=>4,'placeholder'=>'XXXX'));?>&nbsp;-
                    	<?php echo $form->textField($form_model,'key3',array('class'=>'key-field','maxlength'=>4,'placeholder'=>'XXXX'));?>
                        <?php echo $form->error($form_model,'full_key'); ?>
                    </td>
                </tr>
<!--                <tr>-->
<!--                    <td><label for="password-field">--><!--</label>:</td>-->
<!--                    <td><input id="password-field" type="password" name="Register[cap]"></td>-->
<!--                </tr>-->
            </tbody></table>

            <div class="one-row-long">
                <input type="submit" class="button" value="Registration">
            </div>
        <?php $this->endWidget(); ?>

        
        
    </div>
    <div style="clear: both;"></div>
</div>
