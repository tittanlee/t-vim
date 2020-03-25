
from pathlib import Path
import configparser
import glob



PrjPath = '/Users/leetittan/Documents/project/edk2/'
ArchClassList = ['', '.common', '.IA32', '.X64', '.EBC', '.ARM', '.AARCH64', '.common.Private']
IncludeList = list()

DecList = glob.glob('**/*.dec', recursive = True)

for DecFileName in DecList:
    config = configparser.ConfigParser(defaults=None,
                                       allow_no_value = True,
                                       strict = False
                                       )
    config.optionxform=str
    try:
        config.read(DecFileName)
    except:
        continue
    for Arch in ArchClassList:
        TestArch = 'Includes' + Arch
        if config.has_section(TestArch):
            for Key in config.options(TestArch):
                Key = Key.split(' ')[0]
                Location = Path(DecFileName).parent;
                IncludePath = str(Location) + '/' + Key;
                IncludeList.append(IncludePath)

with open('./compile_flags.txt', 'w') as f:
    for item in IncludeList:
        f.write("-I./%s\n" % item)
