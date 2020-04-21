function Invoke-Haskell {
    docker run -it --rm haskell:8 $args
}

Set-Alias haskell Invoke-Haskell

function Invoke-Java {
    docker run -it --rm openjdk:8u252-jdk java $args
}

Set-Alias java Invoke-Java

function Invoke-Node {
    docker run -it --rm node:12.16.2 node $args
}

Set-Alias node Invoke-Node
