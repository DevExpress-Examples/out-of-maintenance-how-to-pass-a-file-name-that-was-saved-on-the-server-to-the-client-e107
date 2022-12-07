<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ASPxperience_UploadControl_CallbackData" %>


<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web"
    TagPrefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to pass a file name that was saved on the server to the client</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function OnUploadComplete(args) {
            lblFileName.SetText(args.callbackData);
        }
        function onMultiUploadComplete(args) {
            $("#uploadedFiles").append(args.callbackData + "; ");
        }
        function onFileUploadStart(s,e) {
            $("#uploadedFiles").empty();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ClientInstanceName="upload1" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete">
                <ClientSideEvents FileUploadComplete="function(s, e) { OnUploadComplete(e); }" />
            </dx:ASPxUploadControl>
            <dx:ASPxButton ID="btnUpload" runat="server" AutoPostBack="False" Text="Upload" ClientInstanceName="btnUpload">
                <ClientSideEvents Click="function(s, e) { upload1.Upload(); }"></ClientSideEvents>
            </dx:ASPxButton>
            <br />
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td style="padding-right: 5px;">
                        <dx:ASPxLabel ID="lblUploadedFileName" runat="server" Text="Uploaded file name: " Font-Bold="True">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="lblFileName" runat="server" ClientInstanceName="lblFileName">
                        </dx:ASPxLabel>
                    </td>
                </tr>
            </table>

            Multi-upload mode:
            <dx:ASPxUploadControl ID="ASPxUploadControl2" runat="server" ClientInstanceName="upload" AdvancedModeSettings-EnableMultiSelect="true"
                OnFileUploadComplete="ASPxUploadControl2_FileUploadComplete">
                <ClientSideEvents FileUploadComplete="function(s, e) { onMultiUploadComplete(e); }" FilesUploadStart="onFileUploadStart" />
            </dx:ASPxUploadControl>
            <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Upload" ClientInstanceName="btnUpload1">
                <ClientSideEvents Click="function(s, e) { upload.Upload(); }"></ClientSideEvents>
            </dx:ASPxButton>
            <br />
            <div id="uploadedFiles"></div>
        </div>
    </form>
</body>
</html>
