<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'] ?? '';
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    if ($username && $email && $password) {

        $data = "$username | $email | $password\n";
        file_put_contents("users.txt", $data, FILE_APPEND);

        echo "✅ Account registered successfully!";
    } else {
        echo "⚠️ Please fill all fields.";
    }
} else {
    echo "⛔ Invalid request.";
}
?>
