#!/bin/zsh

while (true) {
    archstatus -srwf;
    sleep 60; # update every 60 seconds
    clear;
}
