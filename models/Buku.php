<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "buku".
 *
 * @property int $id
 * @property string $judul
 * @property string $abstrak
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
    public $file_cover;
    public $keyword;

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
            [['judul', 'penulis', 'penerbit', 'tahun_terbit', 'harga', 'stok', 'kategori_id', 'abstrak'], 'required'],
            [['tahun_terbit', 'stok', 'kategori_id'], 'integer'],
            [['harga'], 'number'],
            [['abstrak', 'keyword'], 'string'],
            [['judul', 'penulis', 'penerbit', 'cover'], 'string', 'max' => 100],
            [['kategori_id'], 'exist', 'skipOnError' => true, 'targetClass' => KategoriBuku::class, 'targetAttribute' => ['kategori_id' => 'id']],
            [['file_cover'], 'file', 'extensions' => 'jpg,png,jpeg', 'maxSize' => 1024 * 1024 * 2, 'checkExtensionByMimeType' => false],
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
            'abstrak' => 'Abstrak',
            'penulis' => 'Penulis',
            'penerbit' => 'Penerbit',
            'tahun_terbit' => 'Tahun Terbit',
            'harga' => 'Harga',
            'stok' => 'Stok',
            'kategori_id' => 'Kategori Buku',
            'cover' => 'Cover',
            'file_cover' => 'Cover',
            'keyword' => 'Keyword',
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