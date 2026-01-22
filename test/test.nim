import winim

proc main() =

  
  var title: LPSTR = "xRC Simulator"
  let hwnd = FindWindowA(nil, title)

  var placement: WINDOWPLACEMENT


  while true:
    GetWindowPlacement(hwnd, addr placement)
    echo placement

when isMainModule:
  main()