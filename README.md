# GetIP
GetIP is a function/script/plugin for batch files.
It can obtain external and internal IPv4 address.

# Usage
To get **external** IP address:
> call getip.bat --external

To get **internal** IP address:
> call getip.bat --internal

To **delete temporary files**:
> call getip.bat --clean

To **display** IP address:
> type ext_ip.var
> type int_ip.var

# How it works
External:
> It uses **wget** to download output from http://api.ipify.org/.

Internal:
> It uses **ipconfig** command.
