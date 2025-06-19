namespace MSMEModule.MSMEModule;
using Microsoft.Foundation.Company;
using Microsoft.Purchases.Setup;
pageextension 71402 "LFS Company Information Ext" extends "Company Information"
{
    layout
    {
        addafter("State Code")
        {
            group(MSME)
            {
                field("LFS MSME No."; Rec."LFS MSME No.")
                {
                    ApplicationArea = All;
                    Visible = MSMEDetailsVisible;
                    ToolTip = 'Specifies MSME No. Value';
                }
                field("LFS MSME Type"; Rec."LFS MSME Type")
                {
                    ApplicationArea = all;
                    Visible = MSMEDetailsVisible;
                    ToolTip = 'Specifies MSME Type ';
                }

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
