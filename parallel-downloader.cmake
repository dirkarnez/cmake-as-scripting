curl --range 0-999999 -o part1.zip https://example.com/largefile.zip
curl --range 1000000- -o part2.zip https://example.com/largefile.zip
# Then combine part1.zip and part2.zip
