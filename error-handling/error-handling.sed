v 4.9

/^\S+$| and |^$/  {
   s/^/Hello, /; q
}

/\s/ {
    s/.*/Usage: error-handling.sh <person>/;q 1
}

/\0/ {
    s/.*/Usage: error-handling.sh <person>/;q 1
}
