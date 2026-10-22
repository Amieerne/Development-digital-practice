<?php


$t = [1,3,8,4,7,2,8];

echo " Les  Elements pairs:\n";
for ($i = 0; $i < count($t); $i++) {
    if ($t[$i] % 2 == 0) {
        echo $t[$i];
    }
}
echo " Le  maximum:\n";
$m = $t[0];
for ($i = 0; $i < count($t); $i++) {
    if ($t[$i] > $m) {
        $m = $t[$i];
    }
}
echo $m;

echo "Le tri croissant: \n";
$n = count($t);

for ($i = 0; $i <= count($t) - 2; $i++) {
    for ($j = $i+1 ; $j <= count($t) - 1; $j++) {
        if ($t[$j] < $t[$i]) {
            $a = $t[$j];
            $t[$j] = $t[$i];
            $t[$i] = $a;
        }
    }
}

foreach ($t as $v) {
    echo $v ;
}


?>