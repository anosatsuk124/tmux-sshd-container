# tmux-sshd-container

You can share your tmux session with guests as **a readonly session** using ssh **securely**.

* Host's Port: 10000
* Host's Socket: /tmp/tmux_shared_session/tmux_shared_sock
* Host's Session: tmux_shared_session

## Requirements

* docker
* docker-compose (optional)
* tmux

## Usage

### 1. Setup your tmux session.

```bash
sudo mkdir /tmp/tmux_shared_session
sudo chmod 777 /tmp/tmux_shared_session
tmux -S /tmp/tmux_shared_session/tmux_shared_sock new -s tmux_shared_session
```

### 2. Setup the authorized_keys.

* Add the users' ssh private keys sharing the tmux session to `authorized_keys` file.

e.g.
```bash
cat id_ed25519.pub >> authorized_keys
```

### 3. Run setup.sh

```bash
./setup.sh
````

### 4. Login ssh

```bash
ssh tmux_login@{your ip} -p 10000
```



tmux-sshd-container

Copyright (C) 2021 Viterum(Satsuki Akiba).
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
