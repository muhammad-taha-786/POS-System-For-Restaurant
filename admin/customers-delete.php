<?php 

require '../config/function.php';

$paraResultId = checkParamId('id');

if(is_numeric($paraResultId)){

    $customerId = validate($paraResultId);
    
    $customer = getById('customers', $customerId);
    if($customer['status'] == 200)
    {
        $response = delete('customers', $customerId);
        if($response)
        {
            redirect('customer.php','Customer deleted successfully' );

        }
        else{
            redirect('customer.php','Something went wrong' );

        }
    }else{
    redirect('customer.php',$category['message'] );

    }

}else{
    redirect('customer.php', 'Something went wrong');
}
            
?>