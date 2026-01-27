#! /bin/nu

try { rm build/* -r }

def main [opt: string] {
   match $opt {
    "release" => {
      (nim c 
      -d:mingw
      -d:release
      --opt:size
      -o:build/wpilib_auto.exe
      --nimcache:build/buildcache

      src/wpilib_auto.nim)
   },
    "test" => {
      (nim c 
      -d:mingw
      -o:build/test.exe
      --nimcache:build/testcache

      test/test.nim)
   },
   "run" => {
      (nim r
      -d:mingw
      --opt:size
      --nimcache:build/buildcache

      src/wpilib_auto.nim)
   },
   "run-test" => {
      (nim r
      -d:mingw
      --nimcache:build/testcache

      test/test.nim)
   },
    _ => {
      print -e $"Unknown build option: ($opt)"
      exit 1
   }
}
   ; exit 0
}