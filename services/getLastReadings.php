<?php
    header('Access-Control-Allow-Origin: *');
    include('../connection/catalog.php');
    //headers
    $headers = getallheaders();
    /*if (isset($headers['user']) & isset($headers['token']))
    {
        if ($headers['token'] == generatetoken($headers['user']))
        {*/
            $readings = Catalog::getLastReadings();
            if ($readings != null)
            {
                $json = '{ 
                            "status" : 0,
                            "readings" : [';
                $first = true;
                foreach($readings as $r)
                {
                    $s = $r->getStation();
                    if (!$first) $json .= ','; else $first = false;
                    $json .= '{ 
                            "id" : '.$r->getId().',
                            "date" : "'.$r->getDate().'",
                            "temperature" : '.$r->getTemperature().',
                            "station" : {
                                "id" : '.$s->getId().',
                                "description" : "'.$s->getDescription().'",
                                "ip" : "'.$s->getIp().'"}
                        }';
                }
                $json .= "]}";
            }
            else $json = '{ "status" : 2, "message" : "There is no data for today!" }';
        /*}
        else $json = '{ "status" : 2, "message" : "Invalid token" }'; 
    }
    else $json = '{ "status" : 1, "message" : "Invalid parameters" }';*/
    echo $json;
?>