cmake-as-scripting
==================
### How to use
- just drag favorite "*.cmake" to "local-build.cmd"

### TODOs
- [ ] migrate to [Task](https://github.com/go-task/task)
	- https://github.com/go-task/task/releases/download/v3.45.5/task_windows_amd64.zip
 
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
