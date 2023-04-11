<?php
use yii\bootstrap5\Alert;
use yii\helpers\Html;
use kartik\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \mdm\admin\models\form\Signup */

$this->title = 'Signup';
?>
<div class="col-lg-7">
    <div class="card shadow-lg border-0 rounded-lg mt-5">
        <div class="card-header">
            <h3 class="text-center font-weight-light my-4">Create Account</h3>
        </div>
        <div class="card-body">
            <?php $form = ActiveForm::begin(['id' => 'form-signup', 'type' => ActiveForm::TYPE_FLOATING]); ?>
            <?php if ($model->getErrors() || $pelanggan->getErrors()) {
                echo Alert::widget([
                    'body' => Html::errorSummary([$model, $pelanggan]),
                    'options' => ['class' => 'alert-warning'],
                ]);
            } ?>
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="form-floating mb-3 mb-md-0">
                        <?= $form->field($pelanggan, 'nama') ?>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <?= $form->field($model, 'username') ?>
                    </div>
                </div>
            </div>
            <div class="form-floating mb-3">
                <?= $form->field($model, 'email') ?>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="form-floating mb-3 mb-md-0">
                        <?= $form->field($model, 'password')->passwordInput() ?>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating mb-3 mb-md-0">
                        <?= $form->field($model, 'retypePassword')->passwordInput() ?>
                    </div>
                </div>
            </div>
            <div class="mt-4 mb-0">
                <div class="d-grid">
                    <?= Html::submitButton('Create Account', ['class' => 'btn btn-primary', 'name' => 'signup-button']) ?>
                </div>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
        <div class="card-footer text-center py-3">
            <div class="small">
                <?= Html::a('Have an account? Go to login', ['user/login']) ?>
            </div>
        </div>
    </div>
</div>