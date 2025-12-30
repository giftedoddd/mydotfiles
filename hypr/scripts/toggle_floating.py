#! /bin/python3

import subprocess
import re

BASE_COMMAND = ["hyprctl"]

def main():
    subprocess.check_output(BASE_COMMAND + ["dispatch", "togglefloating"], text=True)
    active_window = subprocess.check_output(BASE_COMMAND + ["activewindow"], text=True).strip()
    pattern = re.compile(r"floating:\s*(\d)")
    current_state = pattern.findall(active_window)

    if current_state == 0:
        exit(0)

    subprocess.run(BASE_COMMAND + ["dispatch", "resizeactive", "exact", "50%", "50%"])
    subprocess.run(BASE_COMMAND + ["dispatch", "centerwindow"])

if __name__ == '__main__':
    main()
