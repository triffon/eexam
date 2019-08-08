#!/bin/bash

GDRIVE=/opt/gdrive

function gdrive_check() {
    if [ ! -x "$GDRIVE" ]
    then
        echo "Error: gdrive executable not found at $GDRIVE"
        exit 2
    fi
}

function gdrive_upload_all() {
    # check if gdrive is present
    gdrive_check

    # check usage
    if [ $# -lt 3 ]
    then
        echo "Usage: gdrive_upload_all <gdrive.index> <target-folder-ID> <file> ..."
        exit 1
    fi
    
    # index file is passed as first parameter
    GDRIVE_INDEX="$1"

    # target folder ID is passed as second parameter
    TARGET_FOLDER="$2"

    # list of files is passed as remaining parameters
    shift 2
    FILES="$@"
    
    # make sure any old index is deleted, as we are going to upload new copies of files
    rm -f "$GDRIVE_INDEX"

    for FILE in $FILES
    do
        # upload file and fetch ID
        echo "Uploading $FILE..."
        ID=`"$GDRIVE" upload -p "$TARGET_FOLDER" "$FILE" | grep "Uploaded" | cut -d' ' -f2`
        if [ $? -ne 0 ]
        then
            echo "An error occurred while uploading $FILE"
            exit 5
        fi

        if [ -z "$ID" ]
        then
            echo "An error occurred while detecting ID of uploaded file $FILE"
            exit 6
        fi

        # add file and its ID to the index file
        echo "Adding $FILE to index with ID=$ID"
        echo "$FILE,$ID" >> "$GDRIVE_INDEX"
    done
}

function gdrive_update_all() {
    # check if gdrive is present
    gdrive_check

    # check usage
    if [ $# -lt 2 ]
    then
        echo "Usage: gdrive_update_all <gdrive.index> <file> ..."
        exit 1
    fi
    
    # index file is passed as first parameter
    GDRIVE_INDEX="$1"

    # make sure that the index file is there
    if [ ! -f "$GDRIVE_INDEX" ]
    then
        echo "Error: could not locate index file at $GDRIVE_INDEX"
        exit 3
    fi
    
    # list of files is passed as remaining parameters
    shift 1
    FILES="$@"

    for FILE in $FILES
    do
        # try to locate file ID in the index file
        ID=`grep -e "^$FILE" "$GDRIVE_INDEX" | cut -d, -f2`
        if [ $? -ne 0 ]
        then
            echo "Error locating ID for $FILE in index file"
            exit 4
        fi
        "$GDRIVE" update "$ID" "$FILE"
        if [ $? -ne 0 ]
        then
            echo "An error occurred while updating $FILE"
            exit 5
        fi
    done
}