VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdEventSub"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DABFC6D00D1"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'ά��ϵͳ��־���ġ�

Option Explicit


'�õ����ĵ��б���
'������
'UserID: long
'�û���ʶ��
'return: recordset
'���ĵ��б�
'##ModelId=3DB03DA601EF
Public Function GetSubList(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.EventSubManager")
    Set GetSubList = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'�õ�һ���յļ�¼����
'������
'return: recordset
'�ռ�¼��
'##ModelId=3DB03E16029E
Public Function GetEmptyRecord() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.EventSubManager")
    Set GetEmptyRecord = objMngr.GetEmpty()
    Set objMngr = Nothing
    
End Function


'ɾ����ĳ̨���������¼����ġ�
'������
'ID: long
'�����¼��ı�ʶ
'##ModelId=3DB03E360203
Public Sub DeleteSub(ID As Long)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.EventSubManager")
    objMngr.Delete ID
    Set objMngr = Nothing
    
End Sub


'������¼����ĵĸ��ġ�
'������
'rs: recordset
'Ҫ����ļ�¼����Ϣ��
'##ModelId=3DB04580038F
Public Sub Save(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.EventSubManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub