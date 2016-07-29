<?php
    require_once('/../connection/connection.php');
    class Station extends Connection
    {
        /** attributes **/
        private $id, $description, $ip;
        
        /** functions **/
        public function setId($value) { $this->id = $value;}
        public function getId() { return $this->id; }
        public function setDescription($value) { $this->description = $value; }
        public function getDescription() { return $this->description; }
        public function setIp($value){ $this->ip = $value; }
        public function getIp() { return $this->ip; }
        
        /** constructor **/
        public function __construct()
        {
            // validate arguments
            $num = func_num_args();
            $argumments = func_get_args();
            // create an empty object
            if ($num == 0)
            {
                $this->id = 0;
                $this->description = '';
                $this->ip = '';
            }
            // 1 values received
            if ($num == 1)
            {
                // pass the value to the id
                $id = $argumments[0];
                // create the instruction
                $instruction = 'SELECT station_description, station_ip_address FROM station WHERE station_id = ?';
                // open the connection
                parent::openConnection();
                // create the command
                $command = parent::$connection->prepare($instruction);
                // parameters
                $command->bind_param('i', $id);   
                // execute command
                $command->execute();
                // link the results to local values
                $command->bind_result($description, $ip);
                // read data
                $found = $command->fetch();
                // close command
                mysqli_stmt_close($command);
                // close the connection
                parent::closeConnection();
                if ($found)
                {
                    $this->id = $id;
                    $this->description = $description;
                    $this->ip = $ip;
                }
                else
                {
                    $this->id = 0;
                    $this->description = 'asdasd';
                    $this->ip = 'asdasd';
                }
            }
            
        }
    }

?>