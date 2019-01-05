# !/bin/bash
erl -name milk@192.168.1.5 -boot start_sasl -config sasl.config -pa "./.ebin" -setcookie abc
#erl -name milk@192.168.1.5 -pa "./.ebin" -setcookie abc
