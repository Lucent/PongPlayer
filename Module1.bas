Attribute VB_Name = "Module1"
Declare Function CreateDC& Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, ByVal lpDeviceName As String, ByVal lpOutput As String, lpInitData As Any)
Declare Function DeleteDC& Lib "gdi32" (ByVal hdc As Long)
Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long) As Long

Declare Function SetCursorPos& Lib "user32" (ByVal X As Long, ByVal Y As Long)

Declare Function SetPixel Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal crColor As Long) As Long


Type POINTAPI
X As Long
Y As Long
End Type

Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long

