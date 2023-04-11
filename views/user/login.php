<?php
use kartik\widgets\ActiveForm;
use yii\bootstrap5\Html;

/** @var yii\web\View $this */
/* @var $model \mdm\admin\models\form\Login */

$this->title = 'Login';
?>
<div class="col-lg-5">
    <div class="card shadow-lg border-0 rounded-lg mt-5">
        <div class="card-header">
            <h3 class="text-center font-weight-light my-4">
                <?= Html::encode($this->title) ?>
            </h3>
        </div>
        <div class="card-body">
            <?php $form = ActiveForm::begin(['id' => 'login-form', 'type' => ActiveForm::TYPE_FLOATING]); ?>
            <div class="form-floating mb-3">
                <?= $form->field($model, 'username') ?>
            </div>
            <div class="form-floating mb-3">
                <?= $form->field($model, 'password')->passwordInput() ?>
            </div>
            <div class="form-check mb-3">
                <?= $form->field($model, 'rememberMe')->checkbox() ?>
            </div>
            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                <?= Html::a('Forgot Password?', ['user/request-password-reset']) ?>
                <?= Html::submitButton('Login', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
        <div class="card-footer text-center py-3">
            <div class="small">
                <?= Html::a('Need an account? Sign up!', ['user/signup']) ?>
            </div>
        </div>
    </div>
</div>