#!c:\pypy2\pypy.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'robotframework-hub==0.9','console_scripts','rfhub'
__requires__ = 'robotframework-hub==0.9'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('robotframework-hub==0.9', 'console_scripts', 'rfhub')()
    )
