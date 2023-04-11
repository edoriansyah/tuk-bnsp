<?php
use kartik\widgets\ActiveForm;
use yii\bootstrap5\Html;

/** @var yii\web\View $this */

$this->title = Yii::$app->name . ' - Home';
?>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Welcome to Book Store</h1>
            <p class="lead fw-normal text-white-50 mb-0">The best place to shopping a book</p>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-3">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row mb-4">
            <div class="col-md-12">
                <?php
                $form = ActiveForm::begin(['action' => ['site/index'], 'method' => 'get']);
                echo $form->field($searchModel, 'keyword')->textInput(['placeholder' => 'Cari buku...', 'class' => 'form-control-lg', 'style' => 'width:100%;'])->label(false);
                ActiveForm::end();
                ?>
            </div>
        </div>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <?php foreach ($listBuku as $buku): ?>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <?= Html::img(['cover/' . $buku->cover], ['class' => 'card-img-top h-50']) ?>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">
                                    <?= $buku->judul ?>
                                </h5>
                                <span class="text-muted">
                                    <?= $buku->tahun_terbit . ' - ' . $buku->kategori->nama ?>
                                </span><br>
                                <!-- Product price-->
                                <span>
                                    <?= Yii::$app->formatter->asCurrency($buku->harga) ?>
                                </span>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <?= Html::a('View options', ['/site/detail-buku', 'id' => $buku->id], ['class' => 'btn btn-outline-dark mt-auto']) ?>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>