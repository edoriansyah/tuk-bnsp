<?php

namespace app\assets;

use yii\web\AssetBundle;

/**
 * Shop Homepage Start Bootstrap asset bundle
 * https://startbootstrap.com/template/shop-homepage
 * 
 * @author Edo Riansyah <edoriansyah@gmail.com>
 */
class ShopAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web/themes/shop-sb';
    public $css = [
        'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css',
        'css/styles.css',
    ];
    public $js = [
        'https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js',
        'js/scripts.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'rmrevin\yii\fontawesome\AssetBundle',
        // 'yii\bootstrap5\BootstrapAsset'
    ];
}