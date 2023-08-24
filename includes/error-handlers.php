<?php 
    function handle_exception($e) {
        error_log($e);
        http_response_code(500);
        include_once 'includes/error.php';
        
        exit;
    }
    set_exception_handler('handle_exception');

    function handle_error($type, $message, $file = '',$line = 0) {
        throw new ErrorException($message, 0, $type, $file, $line);
    }
    set_error_handler('handle_error');

    function handle_shutdown() {
        $err = error_get_last();
        if($err) {
            $e = new ErrorException($err['message'], 0, $err['type'], $err['file'], $err['file']);
            
            handle_exception($e);
        }
    }
    register_shutdown_function('handle_shutdown');
?>