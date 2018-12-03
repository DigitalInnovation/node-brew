FROM node:8.9.0
RUN wget https://github.com/github/hub/releases/download/v2.2.9/hub-linux-amd64-2.2.9.tgz \
    && tar zvxvf hub-linux-amd64-2.2.9.tgz \
    && ./hub-linux-amd64-2.2.9/install \
    && mkdir -p ~/.bash/completions \
    && mv ./hub-linux-amd64-2.2.9/etc/hub.bash_completion.sh ~/.bash/completions/_hub \
    && echo "if [ -f ~/.bash/completions/_hub ]; then" >> ~/.bashrc \
    && echo "    . ~/.bash/completions/_hub" >> ~/.bashrc \
    && echo "fi" >> ~/.bashrc \
    && echo "eval "$(hub alias -s bash)"" >> ~/.bashrc \
    && rm -rf hub-linux-amd64-2.2.9
RUN npm install -g npm-check-updates