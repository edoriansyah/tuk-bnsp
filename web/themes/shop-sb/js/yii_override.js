/**
 * Override the default yii confirm dialog. This function is
 * called by yii when a confirmation is requested.
 *
 * @param message the message to display
 * @param okCallback triggered when confirmation is true
 * @param cancelCallback callback triggered when canceled
 */
yii.confirm = function (message, okCallback, cancelCallback) {
    swal({
        title: 'Konfirmasi',
        text: message,
        type: 'warning',
        showCancelButton: true,
        allowOutsideClick: true,
        cancelButtonText: 'Tidak',
        confirmButtonText: 'Ya',
        allowEnterKey: false,
    }).then((action) => {
        if(action.value){
            okCallback()
        }else{
            cancelCallback;
        }
    });
};