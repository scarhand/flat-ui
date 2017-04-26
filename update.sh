#!/usr/bin/env sh
alias realpath="ruby -e 'puts File.realpath(ARGV[0])'"
BASEDIR=$(dirname $(realpath $0))

set -e

if [ $# -eq 0 ]; then
  echo "Usage: ./update.sh <tag>"
  exit 1
fi

TAG=$1
EXTERNAL_DIR="$BASEDIR/external"
FILE_NAME="$TAG.tar.gz"
RELEASE_URL="https://github.com/designmodo/Flat-UI/archive/$TAG.tar.gz"
RELEASE_PATH="$EXTERNAL_DIR/$TAG/Flat-UI-$TAG/dist"
VENDOR_PATH="$BASEDIR/vendor/assets"

if [ ! -d $EXTERNAL_DIR ]; then
	mkdir $EXTERNAL_DIR
fi

if [ ! -f $EXTERNAL_DIR/$FILE_NAME ]; then
	echo "Downloading release..."
	wget -O $EXTERNAL_DIR/$FILE_NAME $RELEASE_URL -o /dev/null
	mkdir $EXTERNAL_DIR/$TAG
	echo "Extracting..."
	tar xfz $EXTERNAL_DIR/$FILE_NAME -C $EXTERNAL_DIR/$TAG 1> /dev/null
fi

for DIR in images fonts javascript stylesheets;
do
	mkdir -p "$VENDOR_PATH/$DIR"
done
echo "Copying files..."
cp -R $RELEASE_PATH/img/* $VENDOR_PATH/images/
cp -R $RELEASE_PATH/fonts/* $VENDOR_PATH/fonts/
cp -R $RELEASE_PATH/js/* $VENDOR_PATH/javascript/
cp $RELEASE_PATH/css/flat-ui.css.map $VENDOR_PATH/stylesheets/
$BASEDIR/css_to_erb.rb $RELEASE_PATH/css/flat-ui.css > $VENDOR_PATH/stylesheets/flat-ui.css.erb
cp -R $RELEASE_PATH/css/vendor/bootstrap/css/*.css $VENDOR_PATH/stylesheets/

rm $RELEASE_PATH/css/flat-ui.css
echo "All done!"
