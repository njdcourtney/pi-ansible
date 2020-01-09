#!/bin/sh

if [ ! -d "$WIKI_NAME" ]
then
  tiddlywiki "$WIKI_NAME" --init server
fi

exec tiddlywiki "$WIKI_NAME" --listen "readers=$WIKI_READERS" "writers=$WIKI_WRITERS" "credentials=$WIKI_CREDENTIALS" "port=$WIKI_PORT" host=0.0.0.0