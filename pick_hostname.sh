#!/bin/bash

echo -n "Your new host should be called: "
grep -v "#.*$" hostnames.txt | unsort | head -n 1
