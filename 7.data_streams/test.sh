#! /bin/bash
/usr/bin/find / -type f 2> err_text.txt
/usr/bin/find / -type f 1> text.txt
/usr/bin/find / -type f &> all_text.txt
/usr/bin/find / -type f 1> text.txt 2> err_text.txt
