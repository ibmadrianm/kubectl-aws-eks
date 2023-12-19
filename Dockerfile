FROM amazon/aws-cli:latest
RUN curl -sL -o /usr/bin/jq https://github.com/jqlang/jq/releases/download/jq-1.6/jq-linux64
RUN chmod +x /usr/bin/jq
RUN curl -sL -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl 
RUN curl -sL -o /usr/bin/aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.6.2/aws-iam-authenticator_0.6.2_linux_amd64
RUN chmod +x /usr/bin/aws-iam-authenticator && \
    chmod +x /usr/bin/kubectl
COPY jira-form /github/home/
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
