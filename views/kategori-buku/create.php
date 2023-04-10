<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\KategoriBuku $model */

$this->title = 'Create Kategori Buku';
$this->params['breadcrumbs'][] = ['label' => 'Kategori Bukus', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="kategori-buku-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
