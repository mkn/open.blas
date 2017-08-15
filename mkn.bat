

@ECHO off
SET PWD=%CD%
SET VERSION="master"
SET GIT_URL="https://github.com/xianyi/OpenBLAS"
SET DIR="blas"

IF NOT EXIST %PWD%\%DIR% (

git clone --depth 1 %GIT_URL% -b %VERSION% %DIR% --recursive || exit 666 /b
echo "not sure if windows is supported :\"

)
