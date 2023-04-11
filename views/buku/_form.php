<?php

use app\models\KategoriBuku;
use kartik\file\FileInput;
use kartik\select2\Select2;
use kartik\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Buku $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="buku-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); ?>

    <?= $form->field($model, 'judul')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'abstrak')->textarea() ?>

    <?= $form->field($model, 'penulis')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'penerbit')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'tahun_terbit')->textInput() ?>

    <?= $form->field($model, 'harga')->textInput() ?>

    <?= $form->field($model, 'stok')->textInput() ?>

    <?= $form->field($model, 'kategori_id')->widget(Select2::class, [
        'data' => ArrayHelper::map(KategoriBuku::find()->all(), 'id', 'nama'),
        'options' => ['placeholder' => 'Pilih...'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]) ?>

    <?= $form->field($model, 'file_cover')->widget(FileInput::classname(), [
        'pluginOptions' => [
            'browseClass' => 'btn btn-primary',
            'browseLabel' => '',
            'showPreview' => false,
            'showCaption' => true,
            'showRemove' => true,
            'showUpload' => false
        ]
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>