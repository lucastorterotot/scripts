#!/bin/bash

echo ''
echo 'Checking LaTeX log files ...'
echo ''
grep -r --color --include="*.log" -e 'Overfull' -e 'Underfull' -e 'undefined on input line' -e 'multiply defined' -e 'Rerun to get cross-references right' -e 'Please (re)run' -e 'and then reprocess this file' -e '! Emergency stop.' -e '! LaTeX Error:' -e 'Fatal error occurred' -e 'Undefined control sequence' -e 'Too many ' -e 'Missing $ inserted' -e 'Runaway argument?' -e 'undefined references' -e 'no output file produced' -e 'not found when defining image' -e 'Float too large for page'
# -e 'multiply-defined'
echo ''
echo 'Checking Biber log files ...'
grep -r --color --include="*.blg" -ve 'INFO' -e 'does not contain any citations!'
echo ''
echo ''
echo 'LaTeX and Biber log files checked.'
