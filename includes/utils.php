<?php 
    declare(strict_types = 1);
    function fetchData(PDO pdo, string $sql, array $arguments = null) {
        if(!$arguments)
            return pdo->query($sql);
        
        $statement = pdo->prepare($sql);
        return $statement->execute($arguments);
    }
?>