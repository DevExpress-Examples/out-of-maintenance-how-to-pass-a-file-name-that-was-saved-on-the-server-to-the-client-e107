Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class ASPxperience_UploadControl_CallbackData
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub ASPxUploadControl1_FileUploadComplete(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs)
		' string fileName = "MyUploadedFileName.txt";
		Dim fileName As String = ASPxUploadControl1.FileName

		' save file to disk or database
		' string fullFileName = MapPath(uploadFolder) + fileName;
		' ASPxUploadControl1.SaveAs(fullFileName);
		e.CallbackData = fileName
	End Sub
End Class
