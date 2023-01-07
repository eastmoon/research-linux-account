docker run -ti --rm ^
    -v %cd%\src:/tmp ^
    -w "/tmp" ^
    ubuntu bash -l -c "source demo1.sh"
