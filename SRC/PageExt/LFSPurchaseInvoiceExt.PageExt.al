namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.Setup;
pageextension 71404 "LFS Purchase Invoice Ext." extends "Purchase Invoice"
{
    layout
    {
        addafter("Due Date")
        {
            field("LFS MSME Due Date"; Rec."LFS MSME Due Date")
            {
                Visible = MSMEDetailsVisible;
                ApplicationArea = All;
                ToolTip = 'Specifies MSME Due Date.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        MSMEDetails();
    end;

    var
        MSMEDetailsVisible: Boolean;

    local procedure MSMEDetails()
    var
        PurchPaybleSetup: Record "Purchases & Payables Setup";
    begin
        PurchPaybleSetup.Get();
        if PurchPaybleSetup."LFS Activate MSME" then
            MSMEDetailsVisible := true
        else
            MSMEDetailsVisible := false;
    end;
}