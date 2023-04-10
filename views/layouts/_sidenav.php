<?php
use yii\bootstrap5\Html;

?>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
            <div class="sb-sidenav-menu-heading">Core</div>
            <?= Html::a('<div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>Dashboard', ['/site/dashboard'], ['class' => 'nav-link']) ?>
            <?= Html::a('<div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>Order', ['/order'], ['class' => 'nav-link']) ?>
            <div class="sb-sidenav-menu-heading">Master Data</div>
            <?= Html::a('<div class="sb-nav-link-icon"><i class="fas fa-book"></i></div>Buku', ['/buku'], ['class' => 'nav-link']) ?>
            <?= Html::a('<div class="sb-nav-link-icon"><i class="fas fa-swatchbook"></i></div>Kategori Buku', ['/kategori-buku'], ['class' => 'nav-link']) ?>
            <div class="sb-sidenav-menu-heading">Admin Area</div>
            <?= Html::a('<div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>User', ['/admin/user'], ['class' => 'nav-link']) ?>
            <?= Html::a('<div class="sb-nav-link-icon"><i class="fas fa-users-cog"></i></div>RBAC<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>', ['/admin'], ['class' => 'nav-link collapsed', 'data-bs-toggle' => 'collapse', 'data-bs-target' => '#collapseRbac', 'aria-expanded' => 'false', 'aria-controls' => 'collapseRbac']) ?>
            <div class="collapse" id="collapseRbac" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <?= Html::a('Grant Access', ['/admin/assignment'], ['class' => 'nav-link']) ?>
                    <?= Html::a('Role', ['/admin/role'], ['class' => 'nav-link']) ?>
                    <?= Html::a('Permission', ['/admin/permission'], ['class' => 'nav-link']) ?>
                    <?= Html::a('Route', ['/admin/route'], ['class' => 'nav-link']) ?>
                </nav>
            </div>
        </div>
    </div>
    <div class="sb-sidenav-footer">
        <div class="small">Logged in as:</div>
        <?= Yii::$app->user->identity->username ?>
    </div>
</nav>