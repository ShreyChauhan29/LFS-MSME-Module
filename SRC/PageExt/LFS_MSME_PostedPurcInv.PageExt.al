pageextension 71403 LFS_MSME_PostedPurcInv extends "Posted Purchase Invoice"
{
    layout
    {
        addafter("Due Date")
        {
            field("LFS MSME Due Date"; Rec."LFS MSME Due Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the MSME Due Date';
                Visible = MSMEDetailsVisible;
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
