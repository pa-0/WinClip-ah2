#Requires AutoHotkey v2.0
#SingleInstance Force


#Include "WinClipAPI.ahk"
#Include "WinClip.ahk"

#HotIf WinActive("ahk_exe ONENOTE.EXE")


Clip := WinClip()


^v::{
    msgbox html := clip.GetHTML()
    
    CleanList := ["SourceURL:.+","Version:.+" 
    ,"StartHTML:.+" ,"EndHTML:.+"
    ,"StartFragment:.+" ,"EndFragment:.+"]
    
    loop CleanList.Length
        {
            html := RegExReplace(html,CleanList[A_Index],"")
           
        }
    ; MsgBox(html)
    clip.SetHTML(html)
    send('^v')
}

