set ns [new simulator] //create simulator

$ns color 1 Blue //color of packet

set nf [open out.nam w]
$ns namtrace-all $nf
