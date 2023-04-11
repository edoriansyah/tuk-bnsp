<?php

namespace app\assets;

use yii\web\AssetBundle;

/**
 * Shop Homepage Start Bootstrap asset bundle
 * https://startbootstrap.com/template/sb-admin
 * 
 * @author Edo Riansyah <edoriansyah@gmail.com>
 */
class SbAdminAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web/themes/sb-admin';
    public $css = [
        'css/styles.css',
    ];
    public $js = [
        'https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js',
        'js/scripts.js',
        // 'js/yii_override.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'rmrevin\yii\fontawesome\AssetBundle',
        // 'yii\bootstrap5\BootstrapAsset'
    ];
}