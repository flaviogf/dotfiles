function Get-LocationUnixFormat {
    $location = $(pwd) -replace "\\", "/" 
    $location -replace "C:", "//c"
}

function Invoke-DockerRun {
    $location = Get-LocationUnixFormat
    docker run -it --rm -v ${location}:/workdir -w /workdir $args
}

function Invoke-Haskell {
    Invoke-DockerRun haskell:8 $args
}

function Invoke-Node {
    Invoke-DockerRun node:12.16.2 node $args
}

function Invoke-Python {
    Invoke-DockerRun python:3.8.2 python $args
}

Set-Alias pwdunix Get-LocationUnixFormat

Set-Alias haskell Invoke-Haskell

Set-Alias node Invoke-Node

Set-Alias python Invoke-Python
