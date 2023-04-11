<?php

namespace app\controllers;

use app\models\Pelanggan;
use dominus77\sweetalert2\Alert;
use mdm\admin\models\form\ChangePassword;
use mdm\admin\models\form\Login;
use mdm\admin\models\form\PasswordResetRequest;
use mdm\admin\models\form\ResetPassword;
use mdm\admin\models\form\Signup;
use mdm\admin\models\User;
use Yii;
use yii\base\InvalidParamException;
use yii\filters\VerbFilter;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

/**
 * User controller
 */
class UserController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Login
     * @return string
     */
    public function actionLogin()
    {
        $this->layout = 'main-auth';
        if (!Yii::$app->getUser()->isGuest) {
            return $this->goHome();
        }

        $model = new Login();
        if ($model->load(Yii::$app->getRequest()->post()) && $model->login()) {
            $role = key(Yii::$app->authManager->getAssignments(Yii::$app->user->id));
            if ($role == 'ADMIN') {
                Yii::$app->session->setFlash('success', [
                    'title' => 'Login Berhasil',
                    'text' => 'Selamat datang di halaman admin',
                ]);
                return $this->redirect(['site/dashboard']);
            } else {
                Yii::$app->session->setFlash('success', [
                    'title' => 'Login Berhasil',
                    'text' => 'Selamat datang di Book Store.',
                ]);
                return $this->goBack();
            }
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logout
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->getUser()->logout();

        return $this->goHome();
    }

    /**
     * Signup new user
     * @return string
     */
    public function actionSignup()
    {
        $this->layout = 'main-auth';
        $model = new Signup();
        $pelanggan = new Pelanggan();
        if ($model->load(Yii::$app->getRequest()->post()) && $pelanggan->load(Yii::$app->getRequest()->post())) {
            $user = new User;
            $user->username = $model->username;
            $user->email = $model->email;
            $user->status = 10;
            $user->setPassword($model->password);
            $user->generateAuthKey();

            if ($user->save() && $pelanggan->validate()) {
                $pelanggan->user_id = $user->id;
                $pelanggan->save();
                // assign role user
                $auth = Yii::$app->authManager;
                $role = $auth->getRole('PELANGGAN');
                $auth->assign($role, $user->id);
                Yii::$app->session->setFlash('success', [
                    [
                        'title' => 'Selamat!',
                        'text' => 'Registrasi Anda berhasil.',
                    ]
                ]);
                return $this->redirect(['login']);

            }
        }

        return $this->render('signup', [
            'model' => $model,
            'pelanggan' => $pelanggan,
        ]);
    }

    /**
     * Request reset password
     * @return string
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequest();
        if ($model->load(Yii::$app->getRequest()->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->getSession()->setFlash('success', 'Check your email for further instructions.');

                return $this->goHome();
            } else {
                Yii::$app->getSession()->setFlash('error', 'Sorry, we are unable to reset password for email provided.');
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    /**
     * Reset password
     * @return string
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPassword($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->getRequest()->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->getSession()->setFlash('success', 'New password was saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }

    /**
     * Reset password
     * @return string
     */
    public function actionChangePassword()
    {
        $model = new ChangePassword();
        if ($model->load(Yii::$app->getRequest()->post()) && $model->change()) {
            return $this->goHome();
        }

        return $this->render('change-password', [
            'model' => $model,
        ]);
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}