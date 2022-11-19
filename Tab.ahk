; ${tab}:: ; If {Tab} is pressed
; Loop ; If any of the above is true then loop below
; {
;     if not GetKeyState("{Tab}", "P") ; If {Tab} is not pressed then break the loop
;         break
;     if GetKeyState("Ctrl", "P") ; If left control is pressed then send control+{Tab}
;     {
;         if GetKeyState("Alt", "P")
;             Send ^!{Tab}
;         else if GetKeyState("Shift", "P")
;             Send ^+{Tab}
;         else if GetKeyState("j", "P")
;             Send {CtrlDown}
;         else if GetKeyState("k", "P")
;             Send {CtrlUp}
;         else if GetKeyState("h", "P")
;             Send ^{Left}
;         else if GetKeyState("l", "P")
;             Send ^{Right}
;         else if GetKeyState("i", "P")
;             Send ^{Home}
;         else if GetKeyState("o", "P")
;             Send ^{End}
;         else if GetKeyState{"u", "P"}
;             Send ^{PgUp}
;         else if GetKeyState{"p", "P"}
;             Send ^{PgDn}
;         else
;             Send ^{Tab}
;     }
;     else if GetKeyState("Shift", "P") ; If left shift is pressed then send shift+{Tab}
;     {
;         if GetKeyState("Alt", "P")
;             Send {ShiftAltTab}
;         else if GetKeyState("Ctrl", "P")
;             Send +^{Tab}
;         else if GetKeyState("j", "P")
;             Send {ShiftDown}
;         else if GetKeyState("k", "P")
;             Send {ShiftUp}
;         else if GetKeyState("h", "P")
;             Send ^{}
;         else if GetKeyState("l", "P")
;             Send ^{Right}
;         else if GetKeyState("i", "P")
;             Send ^{Home}
;         else if GetKeyState("o", "P")
;             Send ^{End}
;         else if GetKeyState{"u", "P"}
;             Send ^{PgUp}
;         else if GetKeyState{"p", "P"}
;             Send ^{PgDown}
;         else
;             Send ^{Tab}
;     }
;     else
;         Send {Tab} ; If {Tab} is pressed with no other modifiers send {Tab}
;     sleep 0 ; Time in milliseconds between key repeats
; }
; return

; Tab & k::
; if GetKeyState("Shift", "D")
;     if GetKeyState("Alt", "D")
;     Send +^{Up}
; else if GetKeyState("Ctrl", "D")
;     Send +!{Up}
; else
;     Send +{Up}
; else if GetKeyState("Ctrl", "D")
;     if (GetKeyState("Alt", "D"))
;     Send !^{Up}
; else
;     Send !{Up}
; else if GetKeyState("Alt", "D")
;     Send ^{Up}
; else
;     Send {Up}
; return

; Tab & j::
; if GetKeyState("Shift", "D")
;     if GetKeyState("Alt", "D")
;     Send +^{Down}
; else if GetKeyState("Ctrl", "D")
;     Send +!{Down}
; else
;     Send +{Down}
; else if GetKeyState("Ctrl", "D")
;     if (GetKeyState("Alt", "D"))
;     Send !^{Down}
; else
;     Send !{Down}
; else if GetKeyState("Alt", "D")
;     Send ^{Down}
; else
;     Send {Down}
; return

; Tab & h::
; if GetKeyState("Shift", "D")
;     if GetKeyState("Alt", "D")
;     Send +^{Left}
; else if GetKeyState("Ctrl", "D")
;     Send +!{Left}
; else
;     Send +{Left}
; else if GetKeyState("Ctrl", "D")
;     if (GetKeyState("Alt", "D"))
;     Send !^{Left}
; else
;     Send !{Left}
; else if GetKeyState("Alt", "D")
;     Send ^{Left}
; else
;     Send {Left}
; return

; Tab & l::
; if GetKeyState("Shift", "D")
;     if GetKeyState("Alt", "D")
;     Send +^{Right}
; else if GetKeyState("Ctrl", "D")
;     Send +!{Right}
; else
;     Send +{Right}
; else if GetKeyState("Ctrl", "D")
;     if (GetKeyState("Alt", "D"))
;     Send !^                   {Right}
; else
;     Send !{Right}
; else if GetKeyState("Alt", "D")
;     Send ^{Right}
; else
;     Send {Right}
; return

; Tab & i::
; if GetKeyState("Shift", "D")
;     if GetKeyState("Alt", "D")
;     Send +^{Home}
; else if GetKeyState("Ctrl", "D")
;     Send +!{Home}
; else
;     Send +{Home}
; else if GetKeyState("Ctrl", "D")
;     if (GetKeyState("Alt", "D"))
;     Send !^{Home}
; else
;     Send !{Home}
; else if GetKeyState("Alt", "D")
;     Send ^{Home}
; else
;     Send {Home}
; return

; Tab & o::
; if GetKeyState("Shift", "D")
;     if GetKeyState("Alt", "D")
;     Send +^{End}
; else if GetKeyState("Ctrl", "D")
;     Send +!{End}
; else
;     Send +{End}
; else if GetKeyState("Ctrl", "D")
;     if (GetKeyState("Alt", "D"))
;     Send !^{End}
; else
;     Send !{End}
; else if GetKeyState("Alt", "D")
;     Send ^{End}
; else
;     Send {End}
; return

; Tab & p:: send, {PgUp}
; Tab & u:: send, {PgDn}
; Return
; Alt & Tab:: send !{Tab}
; Tab & p:: send, {PgUp}
; Tab:: send {Tab}
; Return

; return

; #if GetKeyState("Tab", "P") ; If {tab} is pressed
; if GetKeyState("j", "P") ; If left control is pressed then send control+{tab}
;     Send {Down}
; else
;     Send {Tab}
; return

; $j::
;     Loop
;     {
;         if not GetKeyState("j", "P") ; If 1 is not pressed then break the loop
;             break
;         else if GetKeyState("Tab", "P")
;             Send, {Down}
;         else
;             Send, j
;         sleep 0
;         return
;     }
; return

; When press Tab alone
$Tab::
    KeyWait, Tab ; Wait for Tab to release
    if (A_PriorKey="Tab") ; If the Release kye is Tab, then send Tab
        Send {Tab}
return

$+Tab:: ; When press shift Tab alone
    KeyWait, Tab
    if (A_PriorKey="Tab")
        Send +{Tab}
return

#If, GetKeyState("Tab", "P")
h::Left
j::Down
k::Up
l::Right
y::Home
o::End
,::PgUp
m::PgDn
b::^Left
w::^Right
#If

#If, GetKeyState("Tab", "P") && GetKeyState("Shift", "P")
h::+Left
j::+Down
k::+Up
l::+Right
y::+Home
o::+End
,::+PgUp
m::+PgDn
b::+^Left
w::+^Right
#If

PrintScreen::^+Tab
ScrollLock::^Tab
Pause::Volume_Mute
