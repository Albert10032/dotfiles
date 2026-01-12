#!/bin/bash

git blame --line-porcelain $1 | sed -n 's/^author //p' | sort | uniq -c | sort -rn

