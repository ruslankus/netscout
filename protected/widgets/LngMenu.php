  <?php

class LngMenu extends CWidget
{

    public function run()
    {
        $current_lng = Yii::app()->language;
        
        $url = Yii::app()->request->url;
        $url = explode('/',$url);
        unset($url[0],$url[1]);
        $url = implode('/',$url);
        
        //Debug::d($url);
        
        $objLngs = ExtLanguages::model()->findAll();
        
        $this->render('lng_menu',array('current' => $current_lng,'url' => $url,'objLngs' => $objLngs));
    }
}
