import wAuto/mouse
import wAuto/window
import wAuto/process except windows

import os
import sugar
import strutils

proc main() =

  let notepad = try: enumerate(window.getTitle.contains("Notepad"))[0]
                except IndexDefect:
                  echo "Notepad not found"
                  return

  let 
    rect = notepad.getRect()

    (x, y, w, h) = (rect.x, rect.y, rect.width, rect.height)

    center = (x: x + w div 2, y: y + h div 2)

  discard execShellCmd("cls")
  echo rect
  echo center
  move(center.x, center.y)






when isMainModule:
  main()