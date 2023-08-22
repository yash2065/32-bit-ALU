@echo off
set xv_path=D:\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 9336332498f043498d90cc2d7bef72a3 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot ALU32_behav xil_defaultlib.ALU32 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
