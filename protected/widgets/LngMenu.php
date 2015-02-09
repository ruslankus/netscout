  <?php

class LngMenu extends CWidget
{

    public function run()
    {
        $current_lng = Yii::app()->language;
        $controller = Yii::app()->controller->id;
        $action = Yii::app()->controller->action->id;
        
        $objLngs = ExtLanguages::model()->findAll();
        
        $this->render('lng_menu',array('current' => $current_lng, 'controller' => $controller,
         'action' => $action, 'objLngs' => $objLngs,'params' => $_GET));
    }
}
