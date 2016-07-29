<?php
    include_once('connection.php');
    include_once('/../classes/reading.php');
    class Catalog extends Connection
    {
        function getLastReadings()
        {
            $ids = array();
            $readings = array();
            $instruction = 'SELECT reading_id FROM readings WHERE date(reading_date)= curdate() ORDER BY reading_id DESC LIMIT 10';
            parent::openConnection();
            $command = parent::$connection->prepare($instruction);            
            $command->execute();
            $command->bind_result($id);
            while ($command->fetch()) array_push($ids, $id);
            mysqli_stmt_close($command);
            parent::closeConnection();
            foreach ($ids as $id) array_push($readings, new Reading($id));
            return $readings;
        }
        function getStationReadings($i)
        {
            $ids = array();
            $readings = array();
            $instruction = 'SELECT reading_id FROM readings WHERE date(reading_date)= curdate() AND reading_id_station=? ORDER BY reading_id DESC LIMIT 10';
            parent::openConnection();
            $command = parent::$connection->prepare($instruction);            
            $command->bind_param('i', $i);
            $command->execute();
            $command->bind_result($id);
            while ($command->fetch()) array_push($ids, $id);
            mysqli_stmt_close($command);
            parent::closeConnection();
            foreach ($ids as $id) array_push($readings, new Reading($id));
            return $readings;
        }
    }
?>