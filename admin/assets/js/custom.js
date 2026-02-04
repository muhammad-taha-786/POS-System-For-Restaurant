$(document).ready(function () {

 alertify.set('notifier','position', 'top-right');

    $(document).on('click', '.increment', function () {

        var $quantityInput = $(this).closest('.qtyBox').find('.qty');
        var productId = $(this).closest('.qtyBox').find('.prodId').val();

        var currentValue = parseInt($quantityInput.val());

        if(!isNaN(currentValue)){
            var qtyVal = currentValue + 1;
            $quantityInput.val(qtyVal);
            quantityIncDec(productId, qtyVal);
        }

    });

    $(document).on('click', '.decrement', function () {

        var $quantityInput = $(this).closest('.qtyBox').find('.qty');
        var productId = $(this).closest('.qtyBox').find('.prodId').val();

        var currentValue = parseInt($quantityInput.val());

        if(!isNaN(currentValue) && currentValue > 1){
            var qtyVal = currentValue - 1;
            $quantityInput.val(qtyVal);
            quantityIncDec(productId, qtyVal);
        }

    });
$(document).on('keyup change', '.quantityInput', function () {

    var qtyVal = parseInt($(this).val());
    var productId = $(this).closest('.qtyBox').find('.prodId').val();

    if (!isNaN(qtyVal) && qtyVal > 0) {
        quantityIncDec(productId, qtyVal);
    } else {
        alertify.error('Invalid quantity');
    }

});

    function quantityIncDec(prodId, qty){
        $.ajax({
            type: "POST",
            url: "orders-code.php",
            data: {
                'productIncDec': true,
                'product_id': prodId,
                'quantity': qty
            },
            success: function (response) {
                var res = JSON.parse(response);
                console.log(res);

                    if(res.status == 200){
                        $('#productArea').load(' #productContent');
                        alertify.success(res.message);
                    }else{
                        $('#productArea').load(' #productContent');
                        alertify.error(res.message);
                    }
            }
        })
    }


});