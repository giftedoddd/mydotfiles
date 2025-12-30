#! /bin/bash

if pgrep -x "wpaperd"; then
  killall wpaperd >/dev/null 2>&1

  current_path=$(sed -n '2p' /home/giftedodd/.config/wpaperd/config.toml)
  basename_=$(echo "$current_path" | awk -F'/' '{print $NF}')

  if [[ $basename_ = 'public"' ]]; then
    mv /home/giftedodd/.config/wpaperd/config.toml /home/giftedodd/.config/wpaperd/config.tomlpu
    mv /home/giftedodd/.config/wpaperd/config.tomlpri /home/giftedodd/.config/wpaperd/config.toml
  else
    mv /home/giftedodd/.config/wpaperd/config.toml /home/giftedodd/.config/wpaperd/config.tomlpri
    mv /home/giftedodd/.config/wpaperd/config.tomlpu /home/giftedodd/.config/wpaperd/config.toml
  fi
  wpaperd -d >/dev/null 2>&1 &
  hyprctl reload
else
  wpaperd -d >/dev/null 2>&1 &

  current_path=$(sed -n '2p' /home/giftedodd/.config/wpaperd/config.toml)
  basename_=$(echo "$current_path" | awk -F'/' '{print $NF}')

  if [[ $basename_ = 'public"' ]]; then
    mv /home/giftedodd/.config/wpaperd/config.toml /home/giftedodd/.config/wpaperd/config.tomlpu
    mv /home/giftedodd/.config/wpaperd/config.tomlpri /home/giftedodd/.config/wpaperd/config.toml
  else
    mv /home/giftedodd/.config/wpaperd/config.toml /home/giftedodd/.config/wpaperd/config.tomlpri
    mv /home/giftedodd/.config/wpaperd/config.tomlpu /home/giftedodd/.config/wpaperd/config.toml
  fi
  hyprctl reload
fi
