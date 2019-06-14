f [ $# -eq 0 ]
then
    echo "usage: $0 <data_dir>"
    exit 1
fi

# set relevant paths
SP_PATH=/usr/local/bin
DATA_PATH=$1
TEST_PATH=$DATA_PATH/test

# set vocabulary size and source and target languages
vocab_size=32000
sl=en
tl=de

# Download the default datasets into the $DATA_PATH; mkdir if it doesn't exist
mkdir -p $DATA_PATH
cd $DATA_PATH




echo "Downloading and extracting Commoncrawl data (919 MB) for training..."
wget --trust-server-names http://www.statmt.org/wmt13/training-parallel-commoncrawl.tgz
tar zxvf training-parallel-commoncrawl.tgz
ls | grep -v 'commoncrawl.de-en.[de,en]' | xargs rm
