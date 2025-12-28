#!/bin/bash

source .env

lftp -c "set ftp:list-options -a;
open 'sftp://$FTP_USER:$FTP_PASSWD@$FTP_HOST';

cd $BASE_PATH;
put index.html;
put presentacion.css;

lcd img;
cd img;
mirror --reverse --delete --verbose;

lcd ../js;
cd ../js;
mirror --reverse --delete --verbose;"

