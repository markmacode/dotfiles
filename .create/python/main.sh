#!/usr/bin/env bash

create_python() {
    project_name=$1;
    git init $project_name;
    cd $project_name;
    git branch -M main
    cp -a ~/.create/python/template/. .;
    mv "./#project_name" ./$project_name;

    # Create the virtual environment.
    _os="$(uname)";
    if [[ $_os =~ "MINGW64_NT" ]]; then
        python -m venv ./venv-mingw;
        source ./venv-mingw/Scripts/activate;
    elif [[ $_os =~ "Linux" ]]; then
        python3 -m venv ./venv-linux;
        source ./venv-linux/bin/activate;
    else
        echo "ERROR: could not make venv";
    fi;

    pip install -r requirements.txt;
}
