from pathlib import Path
import sys, os, re

PRIVATE_WALLPAPERS = Path().home().joinpath(".config/wallpapers/private")
PUBLIC_WALLPAPERS = Path().home().joinpath(".config/wallpapers/public")
CONFIG_PATH = Path().home().joinpath(".config/i3/config")
ARGUMENT = sys.argv[1]

current_wallpaper = 0
target_line = ""
current_env = ""
seek = 0
env = ""

def get_requirements():
    global current_wallpaper, target_line, current_env, seek, env

    with CONFIG_PATH.open() as config_file:
        for line in config_file:
            if "exec_always feh" in line:
                target_line = line.strip()
                break
            seek += len(line.encode())

    current_wallpaper = int(re.search(r"mainwall(\d+)", target_line).group(1))
    current_env = target_line.split("/")[-2]

    if ARGUMENT == "q":
        env = "public"
    elif ARGUMENT == "c":
        env = "private"

    need_to_fill = (0, 8)
    condition = (current_wallpaper in need_to_fill and current_env == "public") or (current_env == "private")
    if condition:
        target_line = target_line.replace("scale", "fill")
    else:
        target_line = target_line.replace("fill", "scale")

def change_target_line():
    global target_line

    if env == "public":
        next_wallpaper = (current_wallpaper + 1) % len(tuple(PUBLIC_WALLPAPERS.iterdir()))
    else:
        next_wallpaper = (current_wallpaper + 1) % len(tuple(PRIVATE_WALLPAPERS.iterdir()))

    target_line = (
        target_line
        .replace(str(current_wallpaper), str(next_wallpaper))
        .replace(current_env, env)
    )

def write_changes():
    global seek

    with CONFIG_PATH.open("r+") as config_file:
        config_file.seek(seek)
        config_file.write(target_line + "\n")

def restart_wm():
    os.system("i3-msg restart")

if __name__ == '__main__':
    get_requirements()
    change_target_line()
    write_changes()
    restart_wm()
