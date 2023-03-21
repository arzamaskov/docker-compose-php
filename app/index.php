<?php

$templates_path = __DIR__ . '/assets/templates/';

$web_server = getenv('SERVER_SOFTWARE');
$php_version = phpversion();

$link = mysqli_connect('db', 'root', 'root', null);

if (mysqli_connect_errno()) {
    $mysql = sprintf(
        'MySQL connecttion failed: %s',
        mysqli_connect_error()
    );
} else {
    $mysql = sprintf('MySQL Server: %s', mysqli_get_server_info($link));
}

mysqli_close($link);

include $templates_path . 'index.html';
