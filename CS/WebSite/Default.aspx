<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ASPxperience_UploadControl_CallbackData" %>


<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v8.1" Namespace="DevExpress.Web.ASPxUploadControl"
    TagPrefix="dxuc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>How to pass a file name that was saved on the server to the client</title>
    <script type="text/javascript">
        function OnUploadStart() {
            btnUpload.SetText("Uploading...");
            btnUpload.SetEnabled(false);
        }
        function OnUploadComplete(args) {
            btnUpload.SetText("Upload");        
            btnUpload.SetEnabled(true);
            lblFileName.SetText(args.callbackData);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
            
        <div>
            <dxuc:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ClientInstanceName="upload" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete">
                <ClientSideEvents FileUploadComplete="function(s, e) { OnUploadComplete(e); }" 
                FileUploadStart="function(s, e) { OnUploadStart(); }" />
            </dxuc:ASPxUploadControl>
            <dxe:ASPxButton ID="btnUpload" runat="server" AutoPostBack="False" Text="Upload" ClientInstanceName="btnUpload">
                <ClientSideEvents Click="function(s, e) { upload.UploadFile(); }"></ClientSideEvents>
            </dxe:ASPxButton>
            <br />            
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td style="padding-right: 5px;">
                        <dxe:ASPxLabel ID="lblUploadedFileName" runat="server" Text="Uploaded file name: " Font-Bold="True">
                        </dxe:ASPxLabel>                    
                    </td>
                    <td>
                        <dxe:ASPxLabel ID="lblFileName" runat="server" ClientInstanceName="lblFileName">
                        </dxe:ASPxLabel>                    
                    </td>                    
                </tr>
            </table>            
        </div>
    </form>
</body>
</html>
