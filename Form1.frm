VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Pong Player"
   ClientHeight    =   576
   ClientLeft      =   48
   ClientTop       =   276
   ClientWidth     =   2028
   LinkTopic       =   "Form1"
   ScaleHeight     =   576
   ScaleWidth      =   2028
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Watch Ball"
      Default         =   -1  'True
      Height          =   372
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   1812
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   360
      Top             =   240
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      Height          =   3612
      Left            =   1320
      Picture         =   "Form1.frx":0000
      ScaleHeight     =   3564
      ScaleWidth      =   4884
      TabIndex        =   0
      Top             =   720
      Visible         =   0   'False
      Width           =   4932
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim z As POINTAPI
Dim pot, tel, tiny, big, bigfactor, smallfactor As Integer

Private Sub Command1_Click()
    Timer1.Enabled = Not Timer1.Enabled
End Sub

Private Sub Form_Load()
    bigfactor = 110
    smallfactor = 60
End Sub

Private Sub Timer1_Timer()
    GetCursorPos z
    screendc = CreateDC("DISPLAY", "", "", 0&)
    For xstep = -3.14 To 3.14 Step 0.1
        If GetPixel(screendc, Cos(xstep) * smallfactor + z.X, Sin(xstep) * smallfactor / 1.4 + z.Y) = 15790320 Then SetCursorPos Cos(xstep) * smallfactor + z.X, Sin(xstep) * smallfactor / 1.4 + z.Y
        If GetPixel(screendc, Cos(xstep) * bigfactor + z.X, Sin(xstep) * bigfactor / 1.4 + z.Y) = 15790320 Then SetCursorPos Cos(xstep) * bigfactor + z.X, Sin(xstep) * bigfactor / 1.4 + z.Y
       SetPixel Picture1.hdc, Cos(xstep) * bigfactor + z.X, Sin(xstep) * bigfactor / 1.4 + z.Y, RGB(255, 0, 0)
       SetPixel Picture1.hdc, Cos(xstep) * smallfactor + z.X, Sin(xstep) * smallfactor / 1.4 + z.Y, RGB(255, 0, 0)
       Picture1.Refresh
    Next
    
'   If GetPixel(screendc, z.X, z.Y) < 13000000 And GetPixel(screendc, z.X, z.Y) > 14000000 Then
'       If GetPixel(screendc, z.X + tiny, z.Y + tiny) = 15790320 Then SetCursorPos z.X + tiny, z.Y + tiny
'       If GetPixel(screendc, z.X - tiny, z.Y - tiny) = 15790320 Then SetCursorPos z.X - tiny, z.Y - tiny
'       If GetPixel(screendc, z.X - tiny, z.Y + tiny) = 15790320 Then SetCursorPos z.X - tiny, z.Y + tiny
'       If GetPixel(screendc, z.X + tiny, z.Y - tiny) = 15790320 Then SetCursorPos z.X + tiny, z.Y - tiny
'       If GetPixel(screendc, z.X + tiny, z.Y) = 15790320 Then SetCursorPos z.X + tiny, z.Y
'       If GetPixel(screendc, z.X - tiny, z.Y) = 15790320 Then SetCursorPos z.X - tiny, z.Y
'       If GetPixel(screendc, z.X, z.Y + tiny) = 15790320 Then SetCursorPos z.X, z.Y + tiny
'       If GetPixel(screendc, z.X, z.Y - tiny) = 15790320 Then SetCursorPos z.X, z.Y - tiny

'       If GetPixel(screendc, z.X + medium, z.Y + medium) = 15790320 Then SetCursorPos z.X + medium, z.Y + medium
'       If GetPixel(screendc, z.X - medium, z.Y - medium) = 15790320 Then SetCursorPos z.X - medium, z.Y - medium
'       If GetPixel(screendc, z.X - medium, z.Y + medium) = 15790320 Then SetCursorPos z.X - medium, z.Y + medium
'       If GetPixel(screendc, z.X + medium, z.Y - medium) = 15790320 Then SetCursorPos z.X + medium, z.Y - medium
'       If GetPixel(screendc, z.X + medium, z.Y) = 15790320 Then SetCursorPos z.X + medium, z.Y
'       If GetPixel(screendc, z.X - medium, z.Y) = 15790320 Then SetCursorPos z.X - medium, z.Y
'       If GetPixel(screendc, z.X, z.Y + medium) = 15790320 Then SetCursorPos z.X, z.Y + medium
'       If GetPixel(screendc, z.X, z.Y - medium) = 15790320 Then SetCursorPos z.X, z.Y - medium

'        If GetPixel(screendc, z.X + big, z.Y + big) = 15790320 Then SetCursorPos z.X + big, z.Y + big
 '       If GetPixel(screendc, z.X - big, z.Y - big) = 15790320 Then SetCursorPos z.X - big, z.Y - big
  '      If GetPixel(screendc, z.X - big, z.Y + big) = 15790320 Then SetCursorPos z.X - big, z.Y + big
   '     If GetPixel(screendc, z.X + big, z.Y - big) = 15790320 Then SetCursorPos z.X + big, z.Y - big
    '    If GetPixel(screendc, z.X + big, z.Y) = 15790320 Then SetCursorPos z.X + big, z.Y
     '   If GetPixel(screendc, z.X - big, z.Y) = 15790320 Then SetCursorPos z.X - big, z.Y
      '  If GetPixel(screendc, z.X, z.Y + big) = 15790320 Then SetCursorPos z.X, z.Y + big
       ' If GetPixel(screendc, z.X, z.Y - big) = 15790320 Then SetCursorPos z.X, z.Y - big


'        If GetPixel(screendc, z.X - 1, z.Y + tiny) = 15790320 Then
 '           SetCursorPos z.X - 1, z.Y + tiny
  '      ElseIf GetPixel(screendc, z.X - 1, z.Y - tiny) = 15790320 Then
   '         SetCursorPos z.X - 1, z.Y - tiny
    '    ElseIf GetPixel(screendc, z.X - 1, z.Y + big) = 15790320 Then
     '       SetCursorPos z.X - 1, z.Y + big
      '  ElseIf GetPixel(screendc, z.X - 1, z.Y - big) = 15790320 Then
       '     SetCursorPos z.X - 1, z.Y - big
        'End If
    'End If
'    For tel = 1 To Screen.Height / Screen.TwipsPerPixelY Step 2
 '       For pot = 1 To Screen.Width / Screen.TwipsPerPixelX Step 2
  '          If GetPixel(screendc, pot, tel) = 16777215 Then
   '             If GetPixel(screendc, pot - 4, tel - 4) = 16777215 _
    '            And GetPixel(screendc, pot + 4, tel - 4) = 16777215 _
     '           And GetPixel(screendc, pot - 4, tel + 4) = 16777215 _
      '          And GetPixel(screendc, pot + 4, tel + 4) = 16777215 _
 '_
  '              And GetPixel(screendc, pot - 8, tel - 8) < 1677721 _
   '             And GetPixel(screendc, pot - 8, tel + 8) < 1677721 _
    '            And GetPixel(screendc, pot + 8, tel - 8) < 1677721 _
     '           And GetPixel(screendc, pot + 8, tel + 8) < 1677721 _
 '_
  '              Then SetCursorPos pot, tel
   '         End If
    '    Next
    'Next
    'Text1 = GetPixel(screendc, z.X, z.Y)
    'Picture1.BackColor = GetPixel(screendc, z.X, z.Y)
    DeleteDC (screendc)
End Sub
