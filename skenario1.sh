#!/bin/bash
for x in {0..5}
do
    for i in {1..5}
    do
        node skenario1.js $i
    done
    for i in {5..1}
    do
        node skenario1.js $i
    done
done