!macro CustomCodePostInstall
${If} ${FileExists} "$INSTDIR\App\foobar2000\installer.ini"
${Else}
	CopyFiles /SILENT $INSTDIR\App\bin\installer.ini $INSTDIR\App\foobar2000
	CopyFiles /SILENT $INSTDIR\App\bin\portable_mode_enabled $INSTDIR\App\foobar2000
${EndIf}

${If} ${FileExists} "$INSTDIR\App\foobar2000\$$PLUGINSDIR\*.*"
	RMDir /r "$INSTDIR\App\foobar2000\$$PLUGINSDIR"
	RMDir /r $INSTDIR\App\foobar2000\icons
	Delete "$INSTDIR\App\foobar2000\$$R0"
	Delete "$INSTDIR\App\foobar2000\foobar2000 Shell Associations Updater.exe"
	Delete $INSTDIR\App\foobar2000\uninstall.exe
${Else}
${EndIf}
!macroend
