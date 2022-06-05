#!/bin/bash
for i in {0..13}
do
    up=10
    down=2
    node skenario2.js $down
    node skenario2.js $up
done