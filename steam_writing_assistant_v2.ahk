;@xmaxray @unbreakable-ray 

#Requires AutoHotkey v2.0
#SingleInstance Force
;#HotIf WinActive("ahk_exe Steam.exe")

;===============================[start the engine]==========================
aa := 1 ;For Smart navigation  
gg := "" ;clipboread work
ff := ""
fileSengture := "Not ready"



;for singture function
if FileExist(A_MyDocuments . "\SWA.txt") ;is if file singture exit
    {
    signature := FileRead(A_MyDocuments . "\SWA.txt",  "UTF-8") ;sinugture
    ;MsgBox("file signature exit and loaded") ;for test
    fileSengture := "File is loaded" ;debug
    }
else ;create new sengture file 
    {
        FileAppend "
        (
        )", A_MyDocuments "\SWA.txt" , "UTF-8"
        fileSengture := "new file created"


    }


;===============================[Temp engine]==========================
;/*

;notepad ++ for testing
note :=1 ;for note ;temp
#n::
{
    global note  

    If (note=1)
        {
            Run "C:\Program Files (x86)\Notepad++\notepad++.exe"
            WinMaximize "ahk_exe notepad++.exe"
            note := 2
            return
        }
    if (note = 2)
        {
            WinMinimize "ahk_exe notepad++.exe" 
            note := 1
            return
        }
        return

    }

;*/
;===============================[Debug]==========================
;remove and add to display or allow it(;)
+F1:: MsgBox "Navigation mode is     [ " . aa . " ].", ("Debug window = Navigation" ), "Iconi" ;cheak navigation mode
+F2:: MsgBox "gg contains:    [" . gg . "] `n `n A-Clipboard contains:    [" . A_Clipboard . "]", ("Debug window = Navigation" ), "Iconi" ;cheak navigation mode
+F3:: MsgBox "Signature status: [" . fileSengture . "]"


msgInfo_god := "Navigation mode is     [ " . aa . " ]. `n`n gg contains:    [" . gg . "] `n`n Clipboard contains (A_Clipboard):    [" . A_Clipboard . "] `n`n Signature status: [" . fileSengture . "] `n `n ff contains:    [" . ff . "] ."
F4:: MsgBox ( msgInfo_god) , ("Debug window = God mode" )


/*
;;varable
msgInfo_aa := "Navigation mode is     [ " . aa . " ]."
msgInfo_gg :="gg contains:    [" . gg . "] ."
msgInfo_Clipboard := "A-Clipboard contains:    [" . A_Clipboard . "]"
msgInfo_fileSignature := "Signature status: [" . fileSengture . "]"
msgInfo_ff := "ff contains:    [" . ff . "] ."

F4:: MsgBox ("" . msgInfo_aa . "`n `n" . msgInfo_gg . "" )
*/

;===============================[quote]==========================
^q::
{   
    
    A_Clipboard := ""
    Send "^c"
    Send ("{Delete}") ; see if this good?
                    if !ClipWait(0.2,0) ;if there is no text
                        {
                            
                            
                            if (gg="")

                                { ;start (see if gg empty)
                                
                                    SetTimer ChangeButtonNames, 20 ;timer to change butten naem
                                    Result := MsgBox("There is no slected text `n Add Quote [BB] code?", ("Error: No text found" ), "YNC Iconi Default3 0x40000")
                                    
                                    if (Result = "Yes")
                                            {
                                                
                                                ;Send("[quote][/quote]") disabled: too slow
                                                A_Clipboard := ("[quote][/quote]")
                                                Send "^v"
                                                Send("{Left 8}")
                                                return
                                                
                                            }
                                            if (Result = "No")
                                                {
                                                    
                                                    global ff
                                                    A_Clipboard := (ff)
                                                    Send "^v"
                                                    return
                                                    
                                                }
                                        
                                        
                                        if (Result ="Cancel")
                                        
                                            {
                                                Sleep(10)
                                                return
                                                
                                            }
                                        
                                                    
                                                            
                                            ChangeButtonNames() ;change bttens names
                                            {
                                                if !WinExist("Error: No text found")
                                                    return  ; Keep waiting.
                                                SetTimer , 0
                                                WinActivate
                                                ControlSetText "&Yes", "Button1"
                                                ControlSetText "&Last quoted", "Button2"
                                            
                                            }
                                            return
                                } ;end (see if gg empty)
                            else ;if gg has stuff
                                {
                                    ;MsgBox "gg is full"
                                    A_Clipboard := gg
                                    Send ("^v")
                                global ff := gg
                                    gg := ""
                                    return
                                }    
                            return





                            
                            
                        }
    ;gg := ""
    ;if text found
        global gg := ("[quote]" . A_Clipboard . "[/quote]")
        global ff := gg
        A_Clipboard := gg
     ;Send "^v"
     return
}




;================================      ==============================
;================================[bold]============================
;================================       ============================




^b::
               {
                global aa
    A_Clipboard := "" 
    Send '{Blind}+{Left}'
    Send "^c"
    if !ClipWait(0.1) ;no text
                                {
                                    send ("[b][/b]")
                                    send ("{Left 4}")
                                    global aa :=2 ;for Smart navigation
                                    return
                                }
        gg := ""  
        gg := A_Clipboard
        gg := StrReplace(A_Clipboard, A_Space, "") ;remove space
        gg := StrReplace(A_Clipboard, "`r`n", "") ;remove new lines
        
        
                                if (gg = "]") 
                                {
                                  Send ("{Delete}")
                                  Sleep(10)
                                  Send ("][b][/b]")
                                  Sleep(10)
                                  Send ("{Left 4}")
                                  global aa := 2 ;for Smart navigation
                                  return
                                } 
                    
                            
                                else 
                                    {
                                    Send ("[b]" gg "[/b]") 
                                    global aa := 4 ;for Smart navigation
                                    return

                                    }    

                    
                    return
                    
                }


;================================[horizontal rule]============================

;[hr][/hr] Ctrl+h  
^h:: 
^r::
{ 
    SendInput ("[hr][/hr]")
    Send ("{Enter}")
 }
;================================[spoiler]======================================

;[s][/s] Ctrl+s  
^s::
{
    gg := ""
    A_Clipboard := "" 
    Send "^c"
    Sleep(50)
    global gg := ("[spoiler]" A_Clipboard "[/spoiler]")
    A_Clipboard := gg
    Send "^v"
    return
} 
;================================[Bulleted list]============================
^3::
{ 
SendInput
(
"
[list]
[*]
[/list]
"
)

Send("{Up 2}")
Send("{Right  3}")

return
} 

;================================[order list]============================
^4::
{ 
SendInput
(
"
[olist]
[*]
[/olist]
"
)

Send("{Up 2}")
Send("{Right  3}")
return
} 

;================================[one slot list]============================
^1::
{ 
Sleep(50)
Send("{Enter}")
SendInput("[*]")
return
}
;================================[code]============================
;code -> Alt+c / Ctrl+e
!c::
^e::
{
SendInput
(
"
[code]  

[/code]
"
)
send ("{Up 2}")
}

;================================[navitaction]============================


^Down:: 
{
    Send "^{End}"
}

;================================[Smart navigation]============================
;defult number is 1
^Space::
 {
            global aa

            
            if ( aa=1)
                {
                    Send "^{End}"
                    return
                }
                    
            else if (aa=2)
                {
                    Send ("{Right 4}")
                    SendInput (" ")
                    global aa :=1
                    return
                }

                else if (aa=3)
                    {
                        Send "{Right}{Space}"
                        global aa :=1
                        return
                    }
                else if (aa=4)
                    {
                    Send "{Left 4}"
                    SendInput " "
                    global aa := 1
                    return
                   }

               return 
 }
        


;================================[Smart dublcate]============================
":: ;""
{
    Send ('""')
    Send ("{Left}")
    global aa := 3
    return

}

$}:: ;{}
${::
{
    Send ("{Raw}{}")
    Send ("{Left}")
    global aa := 3
    return

}

$]::
$[::
    {
        Send ("{Raw}[]")
        Send ("{Left}")
        global aa := 3
        return
    
    }
;================================[signature]============================
F1::
{
A_Clipboard :=  signature
Send "^v"
;MsgBox  StrGet((FileRead(A_MyDocuments . "\SWA.txt",  "UTF-16-RAW")), "UTF-16")
;MsgBox  (FileRead(A_MyDocuments . "\SWA.txt",  "UTF-8"))
return
}


F5:: 
{
    global signature := FileRead(A_MyDocuments . "\SWA.txt" ,"UTF-8") ;update
}

+F5::
{
    
   Run 'notepad.exe ' A_MyDocuments . "\SWA.txt"
   WinWait("ahk_exe notepad.exe")
   SetTimer cheakNotepadExit, 20
   
   
   
   cheakNotepadExit()
    {
        if WinExist("ahk_class Notepad") 
            {
                ;restart
                return
            }
        
                        
        else
            {
            ;Sleep(200)
            global signature := FileRead(A_MyDocuments . "\SWA.txt", "UTF-8") ;update
            SetTimer ,0
            fileSengture := "internal-edited and loaded"
            MsgBox  "Info: New signature louded", ("Steam writing assistant"), "0x40000 Iconi"
            }
            
    }
      
        
    }



    ;Run A_MyDocuments . "\SWA.txt"
    ;WinWait("ahk_exe notepad.exe")




;================================[]============================
