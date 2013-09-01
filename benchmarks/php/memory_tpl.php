<?php
gc_disable();

define('NB', 1000000);

$l = [];
for ($i = 0; $i < NB; ++$i)
    $l[] = preg_match_all('/PATTERN/MODIFIER', '');
