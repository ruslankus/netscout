<?php 
class GenLic
{

    /**
     * Находит для кажого символа числовое соответствие
     * @param $char
     * @return int
     */
    private static function _ioc($char)
    {
        $offset = 999;
        $encoding = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890[]- ";
    
        for($i = 0; $i < strlen($encoding); $i++)
        {
            if($char == $encoding[$i])
            {
                return $i + $offset;
            }
        }
    
        return -1;
    }//end:ioc
    
    /**
     * Разбивает строку на символы, затем находит к ним числа, записывает числа в бинврном виде в файл
     * @param $string
     * @param $len
     * @param $handle
     */
    private static function _write_binary_str($string,$len,$handle)
    {
        for($i = 0; $i < $len; $i++)
        {
            if($i < strlen($string))
            {
                $char = $string[$i];
            }
            else
            {
                $char = "?";
            }
    
            $val = self::_ioc($char);
    
            $packVal = pack("i1",$val);
            fwrite($handle,$packVal);
        }
        
    }//end: write_binary_str
    
    
    /**
     * @param $id - Id licence
     */
    public static function generateLic($id)
    {
        $arrData = ExtUserLicence::model()->get_user_and_licence_info($id);
        //Debug::d($arrData);
            //Формат лицензионного файла
        $license_header = "[HEADER]"; //заголовок
        //$license_key = "KDC-POD-45D-12D"; //лицензионный ключ
        $license_key = trim($arrData['lic_number']);
        //$license_key ="4444-4444-4444";
        $article_key = trim($arrData['part_number']); //ключ товара (артикл)
        //$article_key = "NET02-01STD0050-00005";
        $license_type = trim($arrData['comment']);
        //$license_type = "Standard Edition limited to 50 Users";
        
        $name = trim($arrData['f_name']); //имя пользователя
        //$name = "Vasia";
        $surname = trim($arrData['l_name']); //фамилия пользователя
        //$surname = "Pupkin";
        $max_pc_to_see = (int)($arrData['user_limit']); //максимальный размер локальной сети
        //$max_pc_to_see = 50;
        $footer = "[FOOTER]"; //футер
        //Debug::d($arrData);
        //запись
        $filename = "license.lic";
        $file = fopen($filename,"wb"); //открыть файл для бинарной записи
        
        self::_write_binary_str($license_header,40,$file);
        self::_write_binary_str($license_key,40,$file);
        self::_write_binary_str($article_key,40,$file);
        self::_write_binary_str($license_type,40,$file);
        self::_write_binary_str($name,20,$file);
        self::_write_binary_str($surname,20,$file);
        $pack = pack("i1",$max_pc_to_see);
        fwrite($file,$pack);
        self::_write_binary_str($footer,40,$file);
        fclose($file);
        
        header('Content-type: application/txt');//тут тип
        header('Content-Disposition: attachment; filename='.$filename);
        readfile($filename);
        Yii::app()->end();
        
    }



    
} 