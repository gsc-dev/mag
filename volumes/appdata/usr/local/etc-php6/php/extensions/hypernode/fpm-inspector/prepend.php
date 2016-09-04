<?php

if (PHP_SAPI == 'fpm-fcgi') {
    @file_put_contents(
        '/var/log/hypernode/fpm-inspector/' . getmypid() . '.log',
        json_encode([
            'event'       => 'start',
            'timestamp'   => $_SERVER['REQUEST_TIME_FLOAT'],
            'method'      => $_SERVER['REQUEST_METHOD'],
            'uri'         => $_SERVER['REQUEST_URI'],
            'remote_addr' => $_SERVER['REMOTE_ADDR'],
            'http_host'   => $_SERVER['HTTP_HOST'],
            'useragent'   => $_SERVER['HTTP_USER_AGENT'],
            'referer'     => (isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : ''),
            'ssl'         => $_SERVER['HTTPS'],
        ]) . "\n"
        );

    register_shutdown_function(function() {
        @file_put_contents(
            '/var/log/hypernode/fpm-inspector/' . getmypid() . '.log',
            json_encode([
                'event'       => 'end',
                'timestamp'   => microtime(TRUE),
                'method'      => $_SERVER['REQUEST_METHOD'],
                'uri'         => $_SERVER['REQUEST_URI'],
                'remote_addr' => $_SERVER['REMOTE_ADDR'],
                'http_host'   => $_SERVER['HTTP_HOST'],
                'useragent'   => $_SERVER['HTTP_USER_AGENT'],
                'referer'     => (isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : ''),
                'ssl'         => $_SERVER['HTTPS'],
            ]) . "\n",
            FILE_APPEND);
    });
}
