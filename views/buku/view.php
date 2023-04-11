<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Buku $model */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Bukus', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="buku-view">

    <h1>
        <?= Html::encode($model->judul) ?>
    </h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'template' => '<tr><th style="width: 20%">{label}</th><td>{value}</td></tr>',
        'attributes' => [
            // 'id',
            'judul',
            'abstrak:ntext',
            'penulis',
            'penerbit',
            'tahun_terbit',
            'harga',
            'stok',
            'kategori.nama',
            [
                'attribute' => 'cover',
                'format' => 'raw',
                'value' => function ($model) {
                return Html::img(Yii::$app->urlManager->createUrl('cover/' . $model->cover), ['width' => '100px']);
            }
            ]
        ],
    ]) ?>

</div>