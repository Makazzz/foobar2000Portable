!macro CustomCodePreInstall
;Create folder in case they don't exist
${If} ${FileExists} "$INSTDIR\Data\*.*"
${Else}
	CreateDirectory "$INSTDIR\Data"
${EndIf}
${If} ${FileExists} "$INSTDIR\Data\fb2k\*.*"
${Else}
	CreateDirectory "$INSTDIR\Data\fb2k"
${EndIf}

;Move every data for fb2k in case they are in 1.4.8 version of my PAF
${If} ${FileExists} "$INSTDIR\App\foobar2000\component-updates\*.*"
	Rename "$INSTDIR\App\foobar2000\component-updates" "$INSTDIR\Data\fb2k\component-updates"
${EndIf}

${If} ${FileExists} "$INSTDIR\App\foobar2000\configuration\*.*"
	Rename "$INSTDIR\App\foobar2000\configuration" "$INSTDIR\Data\fb2k\configuration"
${EndIf}

;Not working wildcard...
${If} ${FileExists} "$INSTDIR\App\foobar2000\foo_*\*.*"
	Rename "$INSTDIR\App\foobar2000\foo_*" "$INSTDIR\Data\fb2k\foo_*"
${EndIf}

${If} ${FileExists} "$INSTDIR\App\foobar2000\index-data\*.*"
	Rename "$INSTDIR\App\foobar2000\index-data" "$INSTDIR\Data\fb2k\index-data"
${EndIf}

${If} ${FileExists} "$INSTDIR\App\foobar2000\library\*.*"
	Rename "$INSTDIR\App\foobar2000\library" "$INSTDIR\Data\fb2k\library"
${EndIf}

${If} ${FileExists} "$INSTDIR\App\foobar2000\playlists-v1.4\*.*"
	Rename "$INSTDIR\App\foobar2000\playlists-v1.4" "$INSTDIR\Data\fb2k\playlists-v1.4"
${EndIf}

${If} ${FileExists} "$INSTDIR\App\foobar2000\user-components\*.*"
	Rename "$INSTDIR\App\foobar2000\user-components" "$INSTDIR\Data\fb2k\user-components"
${EndIf}

${If} ${FileExists} "$INSTDIR\App\foobar2000\LargeFieldsConfig.txt"
	Rename "$INSTDIR\App\foobar2000\LargeFieldsConfig.txt" "$INSTDIR\Data\fb2k\LargeFieldsConfig.txt"
${EndIf}

${If} ${FileExists} "$INSTDIR\App\foobar2000\library-error-log.txt"
	Rename "$INSTDIR\App\foobar2000\library-error-log.txt" "$INSTDIR\Data\fb2k\library-error-log.txt"
${EndIf}

${If} ${FileExists} "$INSTDIR\App\foobar2000\theme.fth"
	Rename "$INSTDIR\App\foobar2000\theme.fth" "$INSTDIR\Data\fb2k\theme.fth"
${EndIf}

${If} ${FileExists} "$INSTDIR\App\foobar2000\version.txt"
	Rename "$INSTDIR\App\foobar2000\version.txt" "$INSTDIR\Data\fb2k\version.txt"
${EndIf}
!macroend

!macro CustomCodePostInstall
${If} ${FileExists} "$INSTDIR\App\foobar2000\portable_mode_enabled"
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
