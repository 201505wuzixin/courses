VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "HistoryManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB2E408037F"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'����������ʷ��¼��

Option Explicit

'##ModelId=3DB37A08022F
Implements IMaintData

'##ModelId=3DB6A7480190
Private Const ErrClassName = "MainBusiness.HistoryManager"


'�õ�ָ���û������з�����ʷ��¼
'##ModelId=3DB554350083
Private Function IMaintData_GetListByUserID(UserID As Long) As Recordset
    Const ErrFuncName = "IMaintData_GetListByUserID"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM SendTable WHERE UserID='" & UserID & "'"
    rs.LockType = adLockReadOnly
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic

    rs.Open

    Set rs.ActiveConnection = Nothing
    Set IMaintData_GetListByUserID = rs
    
    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function


'�õ�ĳ���û�ĳһ��ʱ��ķ�����ʷ��¼��
'������
'StartTime: string
'��ʼʱ��
'EndTime: string
'����ʱ��
'UserID: long
'�û���ID��
'return: Recordset
'�����û��鿴��ʱ��εķ�����ʷ��¼��
'##ModelId=3DB374510283
Public Function GetHistory(startTime As String, endTime As String, UserID As Long) As Recordset
    Const ErrFuncName = "GetHistory"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    Dim TimeFilter As String
    TimeFilter = " SendTime>='" & startTime & "' AND SendTime<='" & endTime & " 23:59:59'"
    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM SendTable WHERE UserID=" & UserID & " AND" & TimeFilter & " ORDER BY SendTime"
    rs.LockType = adLockReadOnly
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic

    rs.Open

    Set rs.ActiveConnection = Nothing
    Set GetHistory = rs
    
    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function


'�õ������û�ĳ��ʱ��εķ��ͼ�¼��
'������
'startTime: date
'��ʼʱ��
'endTime: date
'��ֹʱ��
'return: recordset
'����ϵͳ��־��¼��
'##ModelId=3DB553770008
Public Function GetSysLogByTime(startTime As Date, endTime As Date) As Recordset
    Const ErrFuncName = "GetSysLogByTime"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    Dim TimeFilter As String
    TimeFilter = " SendTime>='" & startTime & "' AND SendTime<='" & endTime & " 23:59:59'"
    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM SendTable WHERE" & TimeFilter & " ORDER BY SendTime"
    rs.LockType = adLockReadOnly
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic

    rs.Open

    Set rs.ActiveConnection = Nothing
    Set GetSysLogByTime = rs
    
    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function


'ĳ��ʱ������в��ŵ�����ͳ�ơ�
'������
'startTime: date
'��ʼʱ��
'endTime: date
'����ʱ��
'return: recordset
'һ������������ͳ�Ƶļ�¼��
'##ModelId=3DB3EAF102D2
Public Function GetDeptStatisticByTime(startTime As Date, endTime As Date) As Recordset
    Const ErrFuncName = "GetDeptStatisticByTime"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    Dim TimeFilter As String
    TimeFilter = " SendTime>='" & startTime & "' AND SendTime<='" & endTime & " 23:59:59'"
    rs.ActiveConnection = dbConnString
    
    rs.Source = "SELECT COUNT(SendTable.ID) AS SendCount, Department.Name, Department.ID FROM (SELECT * FROM SendTable WHERE " & TimeFilter & " ) SendTable INNER JOIN Users ON SendTable.UserID = Users.ID RIGHT OUTER JOIN Department ON Users.DeptID = Department.ID GROUP BY Department.Name, Department.ID"
    rs.LockType = adLockReadOnly
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic

    rs.Open

    Set rs.ActiveConnection = Nothing
    Set GetDeptStatisticByTime = rs
    
    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function


'�õ������û���ָ��ʱ�������ͳ�ơ�
'������
'startTime: date
'��ʼʱ��
'endTime: date
'����ʱ��
'return: recordset
'���������˺�����ͳ�Ƶļ�¼��
'##ModelId=3DB3EAF5017A
Public Function GetPersonStatisticByTime(startTime As Date, endTime As Date) As Recordset
    Const ErrFuncName = "GetPersonStatisticByTime"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    Dim TimeFilter As String
    TimeFilter = " SendTime>='" & startTime & "' AND SendTime<='" & endTime & " 23:59:59'"
    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT Users.ID, Users.Name, COUNT(SendTable.ID) AS SendCount FROM (SELECT * FROM SendTable WHERE (" & TimeFilter & " )) SendTable RIGHT OUTER JOIN Users ON Users.ID = SendTable.UserID GROUP BY Users.ID, Users.Name"
    rs.LockType = adLockReadOnly
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic

    rs.Open

    Set rs.ActiveConnection = Nothing
    Set GetPersonStatisticByTime = rs
    
    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function


'δʹ��
'������
'ID: long
'��ʶ
'##ModelId=3DB3F00203A5
Private Function IMaintData_GetListByID(UserID As Long) As Recordset
    '(empty)
End Function


'δʹ��
'##ModelId=3DB3F00300C7
Private Function IMaintData_GetEmpty() As Recordset
    '(empty)
End Function


'δʹ��
'##ModelId=3DB3F0030115
Private Sub IMaintData_Delete(ID As Long)
    '(empty)
End Sub


'δʹ��
'������
'return: recordset
'�������еļ�¼��
'##ModelId=3DB3F00301E0
Private Function IMaintData_GetAll() As Recordset
    '(empty)
End Function


'δʹ��
'##ModelId=3DB3F16E03D5
Private Sub IMaintData_Save(rs As Recordset)
    '(empty)
End Sub


'���ڷ��Ͷ���
'������ rs �ڿͻ��˹������ֻ�����ο��԰�������ֻ�����
'##ModelId=3DB83DFF020A
Public Sub SendMessage(fcdrs As Recordset)
    Const ErrFuncName = "SendMessage"
    On Error GoTo ErrHandler

    Dim strMobiles As String, i As Integer, s As String  'for split mobile number
    
    Dim mm As MRUManager                        'update mru list
    Set mm = New MRUManager
    
    'init database connection
    Dim conn As Connection
    Set conn = CreateObject("ADODB.Connection")
    conn.Open dbConnString
    
    Dim rs As Recordset
    Set rs = CreateObject("ADODB.Recordset")
    Set rs.ActiveConnection = conn
    rs.Source = "SELECT * FROM SendHistory WHERE 0=1"
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic
    rs.LockType = adLockBatchOptimistic
    
    rs.Open

    strMobiles = Trim(fcdrs!RecMobileNumber)

    '���ź�����Ϸ����ߵ�ǩ��
    Dim rs1 As ADODB.Recordset
    Set rs1 = CreateObject("ADODB.Recordset")
    
    rs1.LockType = adLockReadOnly
    rs1.CursorLocation = adUseClient
    rs1.CursorType = adOpenStatic

    rs1.Open "Select Name from Users where ID=" & fcdrs!UserID, conn
    Set rs1.ActiveConnection = Nothing
    
    Dim msg As String
    msg = Trim(fcdrs!Message)

    If Not rs1.EOF Then msg = msg + " -" + rs1!Name
    
    rs1.Close


    '��ϵͳ������Ϣ���Ƿ����дʹ��ˣ����дʺ�Ķ�������
    rs1.Open "Select * from Configuration", conn
    rs1.ActiveConnection = Nothing
    
    Dim strHotWordsFilter As String    '���д��Ƿ����
    Dim strAction As String         '�������дʺ�Ķ���
    
    rs1.Filter = "CFGName='HotWords'"
    strHotWordsFilter = UCase(rs1!Value)
    
    rs1.Filter = "CFGName='HotAction'"
    strAction = rs1!Value
    
    rs1.Close
    Set rs1 = Nothing

    
    '��д���ͱ��������Ͷ���
    While strMobiles <> ""
        i = InStr(1, strMobiles, ",")
        If i = 0 Then
            s = strMobiles
            strMobiles = ""
        Else
            s = Left(strMobiles, i - 1)
            strMobiles = Right(strMobiles, Len(strMobiles) - i)
        End If
        
        'update MRU list
        If Trim(fcdrs!RecName) = "" Then mm.UpdateMRU fcdrs!UserID, s
        
        'send message
        rs.AddNew
        rs!UserID = fcdrs!UserID
        rs!IPAddr = Trim(fcdrs!IPAddr)
        rs!RecName = Trim(fcdrs!RecName)
        rs!RecMobileNumber = Trim(s)
        
        
        '���дʴ���
        If strHotWordsFilter = "TRUE" Then '����������дʹ���
            Dim obj As HotWordManager
            Set obj = New HotWordManager
            
            Dim n As Integer
            n = obj.IsIncludeHotWord(Trim(fcdrs!Message))
            rs!IsIncludeHotWord = n
                
            '���ϵͳ�����дʻ�Ķ���
            If n = 2 Then   '�����2��������д�ɾ��
                msg = FilterHotWord(msg, conn)
            End If
        Else
            rs!IsIncludeHotWord = 0
        End If
        
        rs!Message = msg
        
    Wend
    

    
    'update and close database
    rs.UpdateBatch
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing

    
    Exit Sub
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Sub

Private Function FilterHotWord(msg As String, con As Connection) As String
    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.LockType = adLockReadOnly
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic

    rs.Open "SELECT * FROM HotWords", con
    
    If Not rs.EOF Then rs.MoveFirst
    
    '���˵����дʻ�
    Do Until rs.EOF
        msg = Replace(msg, rs!Word, "", , , vbTextCompare)
        rs.MoveNext
    Loop
    
    rs.Close
    Set rs = Nothing
    
    FilterHotWord = msg
End Function

'�������������Ϊ���÷�������
'�ճ����������Ҫ�������
Public Sub SendMessageByVC(UserID As Long, RecName As String, RecMobileNumber As String, Message As String, IPAddr As String)
    Dim rs As ADODB.Recordset
    
    Set rs = CreateObject("ADODB.Recordset")
    rs.Fields.Append "UserID", adInteger, 4
    rs.Fields.Append "RecName", adVarChar, 20
    rs.Fields.Append "RecMobileNumber", adVarChar, 50
    rs.Fields.Append "Message", adVarChar, 70
    rs.Fields.Append "IPAddr", adVarChar, 50
    
    rs.Open
    rs.AddNew
    rs!UserID = UserID
    rs!RecName = RecName
    rs!RecMobileNumber = RecMobileNumber
    rs!Message = Message
    rs!IPAddr = IPAddr
    
    SendMessage rs
End Sub
