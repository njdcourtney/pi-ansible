#!/bin/sh

# Init the service directory if required
if [ ! -d "$WIKI_NAME" ]
then
  tiddlywiki "$WIKI_NAME" --init server
fi

# Set-up the wiki path variable if needed
if [ "$WIKI_PATH_PREFIX" != '/' ]
then
   mkdir "$WIKI_NAME"/tiddlers
   echo -e "title: \$:/config/tiddlyweb/host\n\n\$protocol$//\$host\$$WIKI_PATH_PREFIX/" > "$WIKI_NAME"/tiddlers/'$__config_tiddlyweb_host.tid'
fi

# Start the Wiki server
exec tiddlywiki "$WIKI_NAME" --listen "readers=$WIKI_READERS" "writers=$WIKI_WRITERS" "credentials=$WIKI_CREDENTIALS" "port=$WIKI_PORT" "pathprefix=$WIKI_PATH_PREFIX" host=0.0.0.0