<?php

  class N{

    public static $e;
    public static $database;
    public static $DIR = ".";
    public static $GMAIL = "prasana6@gmail.com";
    public static $GMAIL_PASSWORD = "prasanna29";

    public static function _DB(){
      try {
        self::$database = new PDO('mysql:host=database;dbname=shopping;charset=utf8mb4', 'root', 'root');
        self::$database->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $e = self::$e;
      } catch (PDOException $e) {
        echo $e->getMessage();
      }
      return self::$database;
    }

  }

?>
