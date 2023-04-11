<?php
use yii\bootstrap5\Breadcrumbs;
use yii\bootstrap5\Html;

$this->title = 'Detail Buku - ' . $buku->judul;
?>
<!-- Product section-->
<section class="py-1">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <?= Breadcrumbs::widget(['links' => ['Detail Buku']]) ?>

            <div class="col-md-6">
                <?= Html::img(['cover/' . $buku->cover], ['class' => 'card-img-top mb-5 mb-md-0']) ?>
            </div>
            <div class="col-md-6">
                <div class="small mb-1">
                    <?= $buku->kategori->nama . ' - ' . $buku->tahun_terbit ?>
                </div>
                <h1 class="display-5 fw-bolder">
                    <?= $buku->judul ?>
                </h1>
                <div class="fs-5 mb-5">
                    <span>
                        <?= Yii::$app->formatter->asCurrency($buku->harga) ?>
                    </span>
                </div>
                <p class="lead">
                    <?= $buku->abstrak ?>
                </p>
                <div class="d-flex">
                    <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1"
                        style="max-width: 3rem" />
                    <button class="btn btn-outline-dark flex-shrink-0" type="button">
                        <i class="bi-cart-fill me-1"></i>
                        Add to cart
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>