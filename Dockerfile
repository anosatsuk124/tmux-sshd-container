FROM alpine:3.14

RUN apk update && apk add openssh-server tmux
RUN mkdir /var/run/sshd

RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "Match User root" >> /etc/ssh/sshd_config
RUN echo "  ForceCommand /usr/bin/tmux -S /tmp/tmux_shared_session/tmux_shared_sock attach -t tmux_shared_session -r" >> /etc/ssh/sshd_config

RUN echo 'root:hello'|chpasswd

RUN ssh-keygen -A

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
