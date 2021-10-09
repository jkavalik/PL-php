#!/bin/bash

mkdir -p out

for i in ./sql/*.sql
do
	j=`basename $i`
	o="./out/${j%.sql}.out"
	LANG=C psql --set=ON_ERROR_ROLLBACK=on --echo-all test < "$i" > "$o" 2>&1
	diff "$o" "./expected/${j%.sql}.out"
done
