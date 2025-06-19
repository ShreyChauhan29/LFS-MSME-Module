pageextension 71404 LFS_MSME_PurchaseInvoice extends "Purchase Invoice"
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
    actions
    {
        // modify(Post)
        // {
        //     trigger OnBeforeAction()
        //     var
        //         PurchLine: Record "Purchase Line";
        //         Vendor: Record Vendor;
        //         PurchReceiptHeader: Record "Purch. Rcpt. Header";
        //         PurchPayable: Record "Purchases & Payables Setup";
        //     begin

        //         PurchPayable.Get();
        //         if PurchPayable."LFS Activate MSME" then begin
        //             if Vendor.get(rec."Buy-from Vendor No.") then
        //                 if Vendor."LFS MSME Status" = Vendor."LFS MSME Status"::Registerd then begin
        //                     PurchLine.Reset();
        //                     PurchLine.SetRange("Document No.", rec."No.");
        //                     PurchLine.Setfilter("Receipt No.", '<>%1', '');
        //                     if PurchLine.FindFirst() then begin
        //                         if PurchReceiptHeader.Get(PurchLine."Receipt No.") then
        //                             Rec."LFS MSME Due Date" := CalcDate(PurchPayable."LFS MSME Payment Period", PurchReceiptHeader."Posting Date");
        //                     end else
        //                         Rec."LFS MSME Due Date" := CalcDate(PurchPayable."LFS MSME Payment Period", Rec."Document Date");
        //                     Rec.Modify();
        //                 end;
        //         end;
        //     end;
        // }
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