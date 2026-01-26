import wAuto/mouse
import wAuto/window

proc main() =

  let window = enumerate(window.title == "Timesheet")[0]

  while true:
    let size = window.getClientSize()

    echo(size)



when isMainModule:
  main()