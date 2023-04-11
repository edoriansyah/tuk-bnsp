<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cart".
 *
 * @property int $id
 * @property int $pelanggan_id
 * @property string $tanggal
 * @property int $checkout
 *
 * @property CartDetail[] $cartDetails
 * @property Pelanggan $pelanggan
 */
class Cart extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cart';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['pelanggan_id'], 'required'],
            [['pelanggan_id', 'checkout'], 'integer'],
            [['tanggal'], 'safe'],
            [['pelanggan_id'], 'exist', 'skipOnError' => true, 'targetClass' => Pelanggan::class, 'targetAttribute' => ['pelanggan_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pelanggan_id' => 'Pelanggan ID',
            'tanggal' => 'Tanggal',
            'checkout' => 'Checkout',
        ];
    }

    /**
     * Gets query for [[CartDetails]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCartDetails()
    {
        return $this->hasMany(CartDetail::class, ['cart_id' => 'id']);
    }

    /**
     * Gets query for [[Pelanggan]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPelanggan()
    {
        return $this->hasOne(Pelanggan::class, ['id' => 'pelanggan_id']);
    }
}
