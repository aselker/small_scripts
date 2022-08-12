import sys
import datetime
import dateutil.parser
import numpy as np


def parse_time(line):
    time_str = line.split("|")[1]
    time = dateutil.parser.parse(time_str)  # , "%a %b %d %X %Z %Y")
    return time


def parse(lines):
    lines_out = []
    i = 0
    while True:
        line = lines[i]
        try:
            pipe_parts = line.split("|")
            if pipe_parts[0] not in ["triton", "tdl-8lcr333", "lxl-cjzqn13"]:
                is_continuation = True
            else:
                try:
                    time = parse_time(line)
                    is_continuation = False
                except dateutil.parser._parser.ParserError:
                    is_continuation = True
        except IndexError:
            is_continuation = True

        if is_continuation:
            lines_out[-1][1] = lines_out[-1][1] + line
        else:
            lines_out.append([time, line])

        i += 1
        if i == len(lines):
            return lines_out


forever = datetime.datetime(datetime.MAXYEAR, 12, 31, tzinfo=datetime.timezone.utc)

files = [open(filename, "r") for filename in sys.argv[1:]]
liness = [file.readlines() for file in files]
[file.close() for file in files]

commandss = [parse(lines) for lines in liness]

indices = [0 for _ in files]
times = [commands[0][0] for commands in commandss]

output = []

while True:
    argmin = np.argmin(times)
    time = times[argmin]
    if time == forever:
        break
    else:
        output.append(commandss[argmin][indices[argmin]][1])
        for i in range(len(indices)):
            if times[i] == time:
                indices[i] += 1
                if indices[i] == len(commandss[i]):
                    times[i] = forever
                else:
                    times[i] = commandss[i][indices[i]][0]

assert output[-1][-1] == "\n"
output[-1] = output[-1][:-1]

print("".join(output))
