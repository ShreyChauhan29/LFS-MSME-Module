namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.Payables;
using Microsoft.Purchases.Setup;
pageextension 71406 "LFS Vendor Ledger Entrie Ext." extends "Vendor Ledger Entries"
{
    layout
    {
        addafter("Due Date")
        {
            field("LFS MSME Due Date"; Rec."LFS MSME Due Date")
            {
                ApplicationArea = All;
                Visible = MSMEDetailsVisible;
                ToolTip = 'Specifies the value of the MSME Due Date field.';
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
