# Start with Debian Stretch
FROM alpine

# Install npm and tiddlywiki
RUN apk add --update npm && npm install -g tiddlywiki

# Change to the Wiki directory
WORKDIR /var/lib/tiddlywiki

# Set the default port for the listen command
ENV WIKI_PORT=8090
ENV WIKI_NAME="wikifolder"
ENV WIKI_READERS='(anon)'
ENV WIKI_WRITERS='(authenticated)'
ENV WIKI_CREDENTIALS="/run/secrets/tiddywiki-credentials"
ENV WIKI_PATH_PREFIX='/'

# Add init-and-run script
COPY init-and-run.sh /usr/local/bin/init-and-run-wiki

# Run the init-and-run script
CMD ["/usr/local/bin/init-and-run-wiki"]
