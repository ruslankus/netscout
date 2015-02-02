<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Login</h1></div>
    <div class="hr"></div>
    <div class="content-block login-block">

        <p class="in-login-p">Suspendisse vehicula eget diam non venenatis. Pellentesque lacinia erat mauris. Integer pellentesque faucibus dignissim. Curabitur ut posuere risus. Nulla sed neque ac magna vestibulum mattis eget ut nunc. Fusce iaculis sed ligula id consectetur. Vestibulum sollicitudin et justo nec commodo. Mauris et dui sit amet purus convallis hendrerit. </p>

        <?php $form = $this->beginWidget('CActiveForm',array('enableAjaxValidation'=>false,'htmlOptions'=>array('class'=>'clearfix'))); ?>
            <table>
                <tbody><tr>
                    <td><?php echo $form->label($form_model,'username'); ?>:</td>
                    <td>
                        <?php echo $form->textField($form_model,'username'); ?>
                        <?php echo $form->error($form_model,'username'); ?>
                    </td>
                </tr>
                <tr>
                    <td><?php echo $form->label($form_model,'password'); ?>:</td>
                    <td>
                        <?php echo $form->passwordField($form_model,'password'); ?>
                        <?php echo $form->error($form_model,'password');?>
                    </td>
                </tr>
            </tbody></table>

            <div class="one-row-long">
                <input type="submit" class="button" value="Login">
                <a class="button" href="/service/register">Registration</a>
                <a class="pass-forgot" href="/account/restore">I forgot my password</a>
            </div>
        <?php $this->endWidget(); ?>
    </div>
    <div style="clear: both;"></div>
</div>
