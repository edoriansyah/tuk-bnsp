<?php

namespace app\controllers;

use app\models\Buku;
use app\models\BukuSearch;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

class SiteController extends Controller
{
    public $layout = 'shop-sb/main';
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new BukuSearch();
        if (Yii::$app->request->get('keyword')) {
            $listBuku = $searchModel->searchByKeyword(Yii::$app->request->queryParams);
            $listBuku = $listBuku->getModels();
        } else {
            $listBuku = Buku::find()->limit(8)->orderBy('id DESC')->all();
        }

        return $this->render('index', [
            'listBuku' => $listBuku,
            'searchModel' => $searchModel,
        ]);
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    /**
     * Dashboard page.
     */
    public function actionDashboard()
    {
        $this->layout = 'main';
        return $this->render('dashboard');
    }

    /**
     * Detail Buku
     */
    public function actionDetailBuku($id)
    {
        $buku = Buku::findOne($id);
        return $this->render('detail-buku', [
            'buku' => $buku
        ]);
    }
}