<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cart_detail".
 *
 * @property int $id
 * @property int $cart_id
 * @property int $buku_id
 *
 * @property Buku $buku
 * @property Cart $cart
 */
class CartDetail extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cart_detail';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cart_id', 'buku_id'], 'required'],
            [['cart_id', 'buku_id'], 'integer'],
            [['buku_id'], 'exist', 'skipOnError' => true, 'targetClass' => Buku::class, 'targetAttribute' => ['buku_id' => 'id']],
            [['cart_id'], 'exist', 'skipOnError' => true, 'targetClass' => Cart::class, 'targetAttribute' => ['cart_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'cart_id' => 'Cart ID',
            'buku_id' => 'Buku ID',
        ];
    }

    /**
     * Gets query for [[Buku]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBuku()
    {
        return $this->hasOne(Buku::class, ['id' => 'buku_id']);
    }

    /**
     * Gets query for [[Cart]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCart()
    {
        return $this->hasOne(Cart::class, ['id' => 'cart_id']);
    }
}
