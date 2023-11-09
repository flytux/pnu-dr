FROM ubuntu:bionic

RUN apt-get update && apt-get install -y curl zsh git openjdk-8-jdk 

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
COPY .zshrc /root

RUN curl -LO https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz  
RUN tar xvf apache-maven-3.3.9-bin.tar.gz -C /opt

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
RUN curl -LO https://github.com/tektoncd/cli/releases/download/v0.18.0/tkn_0.18.0_Linux_x86_64.tar.gz
RUN tar xvzf tkn_0.18.0_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn && rm tkn_0.18.0_Linux_x86_64.tar.gz
RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v2.0.1/argocd-linux-amd64
RUN curl -sfL -o /usr/local/bin/kubectl https://dl.k8s.io/release/v1.26.9/bin/linux/amd64/kubectl
RUN curl -LO https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
RUN tar xvf k9s_Linux_amd64.tar.gz -C /usr/local/bin && rm -f k9s_Linux_amd64.tar.gz
RUN chmod +x /usr/local/bin/*

ENV PATH=/opt/apache-maven-3.3.9/bin:$PATH

RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'root:1' | chpasswd
