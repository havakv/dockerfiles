#!/usr/bin/env python

from __future__ import print_function
import re
import os

fullpath = os.getcwd()
home = os.path.expanduser('~') + '/'
print(re.sub(home, '', fullpath))

