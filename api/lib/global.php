<?php
function output($output) {
//    $json = json_encode($output);
//    echo $json;
    $data = array();
    $data['status'] = 'success';
    $data['results'] = $output;
    
    $json = json_encode($data);
    echo $json;
    exit();
}     
?>
