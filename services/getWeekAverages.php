<?php
    header('Access-Control-Allow-Origin: *');
    include('../classes/reading.php');
    //headers
    $headers = getallheaders();
    /*if (isset($headers['user']) & isset($headers['token']))
    {
        if ($headers['token'] == generatetoken($headers['user']))
        {*/
            $averages = Reading::getWeekAverages();
            if ($averages != null)
            {
                $json = '{ 
                            "status" : 0,
                            "averages" : ';
                $first = true;
                $json .= '{ 
                            "station1" : '.round($averages['station1'], 2).',
                            "station2" : '.round($averages['station2'], 2).',
                            "station3" : '.round($averages['station3'], 2).'
                        }';
                $json .= "}";
            }
            else $json = '{ "status" : 2, "message" : "There is no data for this Week!" }';
        /*}
        else $json = '{ "status" : 2, "message" : "Invalid token" }'; 
    }
    else $json = '{ "status" : 1, "message" : "Invalid parameters" }';*/
    echo $json;
?>