cmake-as-scripting
==================
### How to use
- just drag favorite "*.cmake" to "local-build.cmd"

### [`common/readinput.exe`](common/readinput.exe)
```go
package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	text := scanner.Text()
	fmt.Println(text)
}

```
