#! /bin/nu

try { rm build/* -r }

print "Enter build type: (release, test, run, run-test)"
input 
| if $in == "release" {
    (nim c 
    -d:mingw
    -d:($in)
    --opt:size
    -o:build/wpilib_auto.exe
    --nimcache:build/buildcache

    src/wpilib_auto.nim)
 } else if $in == "test" {
    (nim c 
    -d:mingw
    -o:build/test.exe
    --nimcache:build/testcache

    test/test.nim)
 } else if $in == "run" {
    (nim r
    -d:mingw
    --opt:size
    --nimcache:build/buildcache

    src/wpilib_auto.nim)
 } else if $in == "run-test" {
    (nim r
    -d:mingw
    --nimcache:build/testcache

    test/test.nim)
 } else { print $"Unknown build option: ($in)" ; exit 1}
; exit 0