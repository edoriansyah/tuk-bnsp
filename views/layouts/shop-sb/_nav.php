<?php
use kartik\icons\Icon;
use yii\bootstrap5\Html;
use yii\bootstrap5\Nav;

?>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="<?= Yii::$app->homeUrl ?>"><?= Icon::show('book', ['class' => 'me-1']) . Yii::$app->name ?></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <?= Nav::widget([
                'options' => ['class' => 'navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4'],
                'items' => [
                    ['label' => 'Home', 'url' => ['/site/index']],
                    ['label' => 'About', 'url' => ['/site/about']],
                    ['label' => 'Contact', 'url' => ['/site/contact']],
                ]
            ]); ?>
            <div class="d-flex">
                <?php if (Yii::$app->user->isGuest): ?>
                    <?= Html::a('<i class="bi-person-fill me-1"></i> Login', ['/user/login'], ['class' => 'btn btn-outline-dark']) ?>
                <?php else: ?>
                    <?= Html::a('<i class="bi-cart-fill me-1"></i> Cart <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>', ['/site/checkout'], ['class' => 'btn btn-outline-dark me-2']) ?>
                    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false"><i class="bi-person-fill"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li>
                                    <?= Html::a('Profile', ['#'], ['class' => 'dropdown-item']) ?>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li>
                                    <?= Html::a('Logout', ['/user/logout'], ['class' => 'dropdown-item', 'data-method' => 'post']) ?>
                                </li>
                            </ul>
                        </li>
                    </ul>
                <?php endif; ?>
            </div>
        </div>
    </div>
</nav>