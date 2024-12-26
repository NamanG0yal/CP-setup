@echo off
setlocal enabledelayedexpansion
set /p contest_name="Enter the name of the contest:"
mkdir "!contest_name!"
:: Prompt for the number of problems
set /p num_problems_str="Enter the number of problems:"

:: Convert the input string to an integer
set /a num_problems=%num_problems_str%

:: Loop to create folders and files
for /L %%i in (1,1,%num_problems%) do (
    set /a temp_var =  %%i   + 96
    for /f "delims=" %%A in ('powershell -command "[char]!temp_var!"') do set char=%%A
    set folder_name=!char!

 
    :: Create the folder
    mkdir "!contest_name!\!folder_name!"
    type nul  > "!contest_name!\!folder_name!\!folder_name!.cpp"
    type nul  > "!contest_name!\!folder_name!\input.in"
    type nul  > "!contest_name!\!folder_name!\output.in"
    ( echo ^/**
      echo ^* Author : Naman Goyal 
      echo ^* Created : !date! !time!
      echo ^**/


    ) > "!contest_name!\!folder_name!\!folder_name!.cpp"
    type "template.txt" >> "!contest_name!\!folder_name!\!folder_name!.cpp"

)

echo Setup complete!
pause
