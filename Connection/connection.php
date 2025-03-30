<?php
if(basename($_SERVER['PHP_SELF']) == 'Login.php') {
    require_once '../vendor/autoload.php';
}else{
    require_once '../../vendor/autoload.php';
}

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '../../');
$dotenv->load();

class DatabaseConnection {
    private $host;
    private $dbname;
    private $username;
    private $password;
    public $conn;

    public function __construct() {
        $this->host = $_ENV['DB_HOST'];
        $this->dbname = $_ENV['DB_NAME'];
        $this->username = $_ENV['DB_USER'];
        $this->password = $_ENV['DB_PASS'];
        
        try {
            $this->conn = new PDO("mysql:host={$this->host};dbname={$this->dbname}",$this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $erro) {
                echo "Connection failed: " . $erro->getMessage();
        }
    }
}
 