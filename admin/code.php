<?php
include('../config/function.php');

/* ===================== ADMINS ===================== */

if (isset($_POST['saveAdmin'])) {

    $name = validate($_POST['name']);
    $email = validate($_POST['email']);
    $password = validate($_POST['password']);
    $phone = validate($_POST['phone']);
    $is_ban = isset($_POST['is_ban']) ? 1 : 0;

    if ($name == '' || $email == '' || $password == '') {
        redirect('admins-create.php', 'All fields are mandatory');
    }

    $checkEmail = mysqli_query($conn, "SELECT id FROM admins WHERE email='$email'");
    if (mysqli_num_rows($checkEmail) > 0) {
        redirect('admins-create.php', 'Email already exists');
    }

    $data = [
        'name' => $name,
        'email' => $email,
        'password' => password_hash($password, PASSWORD_BCRYPT),
        'phone' => $phone,
        'is_ban' => $is_ban
    ];

    insert('admins', $data);
    redirect('admins.php', 'Admin added successfully');
}

/* ===================== UPDATE ADMIN ===================== */

else if (isset($_POST['updateAdmin'])) {

    $adminId = validate($_POST['adminId']);
    $adminData = getById('admins', $adminId);

    if ($adminData['status'] != 200) {
        redirect('admins.php', 'Admin not found');
    }

    $name = validate($_POST['name']);
    $email = validate($_POST['email']);
    $phone = validate($_POST['phone']);
    $is_ban = isset($_POST['is_ban']) ? 1 : 0;

    $password = $_POST['password'] != ''
        ? password_hash($_POST['password'], PASSWORD_BCRYPT)
        : $adminData['data']['password'];

    $data = [
        'name' => $name,
        'email' => $email,
        'password' => $password,
        'phone' => $phone,
        'is_ban' => $is_ban
    ];

    update('admins', $adminId, $data);
    redirect('admins-edit.php?id='.$adminId, 'Admin updated successfully');
}

/* ===================== CATEGORIES ===================== */

else if (isset($_POST['saveCategory'])) {

    $data = [
        'name' => validate($_POST['name']),
        'description' => validate($_POST['description']),
        'status' => isset($_POST['status']) ? 1 : 0
    ];

    insert('categories', $data);
    redirect('categories.php', 'Category added successfully');
}

else if (isset($_POST['updateCategory'])) {

    $categoryId = validate($_POST['categoryId']);

    $data = [
        'name' => validate($_POST['name']),
        'description' => validate($_POST['description']),
        'status' => isset($_POST['status']) ? 1 : 0
    ];

    update('categories', $categoryId, $data);
    redirect('categories-edit.php?id='.$categoryId, 'Category updated successfully');
}

/* ===================== SAVE PRODUCT ===================== */

else if (isset($_POST['saveProduct'])) {

    $finalImage = "";

    if ($_FILES['image']['size'] > 0) {
        $path = "../assets/uploads/products";
        $ext = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
        $filename = time().'.'.$ext;

        move_uploaded_file($_FILES['image']['tmp_name'], $path.'/'.$filename);
        $finalImage = "assets/uploads/products/".$filename;
    }

    $data = [
        'category_id' => validate($_POST['category_id']),
        'name' => validate($_POST['name']),
        'description' => validate($_POST['description']),
        'price' => validate($_POST['price']),
        'quantity' => validate($_POST['quantity']),
        'image' => $finalImage,
        'status' => isset($_POST['status']) ? 1 : 0
    ];

    insert('products', $data);
    redirect('products.php', 'Product added successfully');
}

/* ===================== UPDATE PRODUCT ===================== */

else if (isset($_POST['updateProduct'])) {

    $productId = validate($_POST['product_id']);
    $productData = getById('products', $productId);

    if ($productData['status'] != 200) {
        redirect('products.php', 'Product not found');
    }

    if ($_FILES['image']['size'] > 0) {
        $path = "../assets/uploads/products";
        $ext = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
        $filename = time().'.'.$ext;

        move_uploaded_file($_FILES['image']['tmp_name'], $path.'/'.$filename);
        $finalImage = "assets/uploads/products/".$filename;

        $oldImage = "../".$productData['data']['image'];
        if (file_exists($oldImage)) {
            unlink($oldImage);
        }
    } else {
        $finalImage = $productData['data']['image'];
    }

    $data = [
        'category_id' => validate($_POST['category_id']),
        'name' => validate($_POST['name']),
        'description' => validate($_POST['description']),
        'price' => validate($_POST['price']),
        'quantity' => validate($_POST['quantity']),
        'image' => $finalImage,
        'status' => isset($_POST['status']) ? 1 : 0
    ];

    update('products', $productId, $data);
    redirect('products.php', 'Product updated successfully');
}
?>
