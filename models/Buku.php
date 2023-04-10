<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "buku".
 *
 * @property int $id
 * @property string $judul
 * @property string $penulis
 * @property string $penerbit
 * @property int $tahun_terbit
 * @property float $harga
 * @property int $stok
 * @property int $kategori_id
 * @property string|null $cover
 *
 * @property KategoriBuku $kategori
 * @property OrderDetail[] $orderDetails
 */
class Buku extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'buku';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['judul', 'penulis', 'penerbit', 'tahun_terbit', 'harga', 'stok', 'kategori_id'], 'required'],
            [['tahun_terbit', 'stok', 'kategori_id'], 'integer'],
            [['harga'], 'number'],
            [['judul', 'penulis', 'penerbit', 'cover'], 'string', 'max' => 100],
            [['kategori_id'], 'exist', 'skipOnError' => true, 'targetClass' => KategoriBuku::class, 'targetAttribute' => ['kategori_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'judul' => 'Judul',
            'penulis' => 'Penulis',
            'penerbit' => 'Penerbit',
            'tahun_terbit' => 'Tahun Terbit',
            'harga' => 'Harga',
            'stok' => 'Stok',
            'kategori_id' => 'Kategori ID',
            'cover' => 'Cover',
        ];
    }

    /**
     * Gets query for [[Kategori]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getKategori()
    {
        return $this->hasOne(KategoriBuku::class, ['id' => 'kategori_id']);
    }

    /**
     * Gets query for [[OrderDetails]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrderDetails()
    {
        return $this->hasMany(OrderDetail::class, ['buku_id' => 'id']);
    }
}
