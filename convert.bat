@echo off
echo Put your unencrypted .wem files in the "input" folder.
pause

if not exist "input" (
    echo The "input" folder does not exist. Please create the folder and place your files in it.
    pause
    exit
)

if not exist "output" (
    mkdir output
)

echo Processing the files in the "input" folder...


for %%c in (input\*.wem) do (
    ww2ogg.exe %%c --pcb packed_codebooks_aoTuV_603.bin -o output\%%~nc.ogg
    revorb.exe output\%%~nc.ogg
)

echo Conversion process completed. The converted files can be found in the "output" folder.
pause
exit
