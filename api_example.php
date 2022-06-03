<?php

// POST-request:
//--------------
$url = 'https://rest.arbeitsagentur.de/oauth/gettoken_cc';
$data = array(
    'client_id' => '38053956-6618-4953-b670-b4ae7a2360b1', 
    'client_secret' => 'c385073c-3b97-42a9-b916-08fd8a5d1795', 
    'grant_type' => 'client_credentials');
$options = array(
    'http' => array(
        'method'  => 'POST',
        'content' => http_build_query($data)
    )
);
$context  = stream_context_create($options);
$tokendata = file_get_contents($url, false, $context);
header('Content-Type: application/json'); 
if(isset($_GET['token']) & $_GET['token']==='TRUE'){
	echo $tokendata;
} else {

    // GET-request:
    //-------------
    $url = 'https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v1/bildungsangebot?'.$_SERVER['QUERY_STRING'];
    $options = array(
        'http' => array(
            'header'  => "OAuthAccessToken:".json_decode($tokendata, true)['access_token']." \r\n",
            'method'  => 'GET'    
        )
    );
    $context  = stream_context_create($options);
    $searchdata = file_get_contents($url, false, $context);
    echo $searchdata;
}
?>

