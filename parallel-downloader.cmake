curl -I https://tunnelsassetsprod.blob.core.windows.net/cli/devtunnel.exe | grep -i Content-Length
curl -I https://tunnelsassetsprod.blob.core.windows.net/cli/devtunnel.exe | grep -i Accept-Ranges
22592216
curl --range 0-999999 -o part1 https://tunnelsassetsprod.blob.core.windows.net/cli/devtunnel.exe
curl --range 1000000-22592215 -o part2 https://tunnelsassetsprod.blob.core.windows.net/cli/devtunnel.exe

cat part1 part2 > target_file