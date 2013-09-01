<?php

if (preg_match_all('/PATTERN/MODIFIER', file_get_contents("php://stdin"), $m))
    echo count($m[0]);
else
    echo 0;
