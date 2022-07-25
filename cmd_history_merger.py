import sys
import datetime
import dateutil.parser
import numpy as np

def parse_time(line):
    time_str = line.split("|")[1]
    time = dateutil.parser.parse(time_str)# , "%a %b %d %X %Z %Y")
    return time


forever = datetime.datetime(datetime.MAXYEAR, 12, 31, tzinfo=datetime.timezone.utc)

files = [open(filename, "r") for filename in sys.argv[1:]]
liness = [file.readlines() for file in files]
[file.close() for file in files]

indices = [0 for _ in files]
lines = [lines_[0] for lines_ in liness]
times = [parse_time(line) for line in lines]

output = []

while True:
    argmin = np.argmin(times)
    time = times[argmin]
    if time == forever:
        break
    else:
        output.append(lines[argmin])
        for i in range(len(indices)):
            if times[i] == time:
                indices[i] += 1
                if indices[i] == len(liness[i]):
                    times[i] = forever
                else:
                    lines[i] = liness[i][indices[i]]
                    times[i] = parse_time(lines[i])


print(''.join(output))
