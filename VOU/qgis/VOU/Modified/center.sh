#!/bin/bash

tput reset
tput clear
tput sgr0

COLUMNS=$(tput cols)
echoa="wowwwwwwwwwwwww"
echob="hihihihihihihihi"
echoc="I'm done!"


printf "%*s\n" $(((${#echoa}+$COLUMNS)/2)) "$echoa"

printf "%*s\n" $(((${#echob}+$COLUMNS)/2)) "$echob"

printf "%*s\n" $(((${#echoc}+$COLUMNS)/2)) "$echoc"