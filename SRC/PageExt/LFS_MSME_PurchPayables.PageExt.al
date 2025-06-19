pageextension 71401 LFS_MSME_PurchaseInvoices extends "Purchase Invoices"
{
    layout
    {

    }
    actions
    {
        // modify(PostSelected)
        // {
        //     trigger OnBeforeAction()
        //     var
        //         PurchPayable: Record "Purchases & Payables Setup";
        //         Vendor: Record Vendor;
        //         PurchLine: Record "Purchase Line";
        //         PurchReceiptHeader: Record "Purch. Rcpt. Header";
        //     begin
        //         PurchPayable.Get();
        //         if Vendor.get(rec."Buy-from Vendor No.") then
        //             if Vendor."LFS MSME Status" = Vendor."LFS MSME Status"::Registerd then begin
        //                 PurchLine.Reset();
        //                 PurchLine.SetRange("Document No.", rec."No.");
        //                 PurchLine.Setfilter("Receipt No.", '<>%1', '');
        //                 if PurchLine.FindFirst() then begin
        //                     if PurchReceiptHeader.Get(PurchLine."Receipt No.") then
        //                         Rec."LFS MSME Due Date" := CalcDate(PurchPayable."LFS MSME Payment Period", PurchReceiptHeader."Posting Date");
        //                 end else
        //                     Rec."LFS MSME Due Date" := CalcDate(PurchPayable."LFS MSME Payment Period", Rec."Posting Date");
        //                 Rec.Modify();
        //             end;

        //     end;
        // }
    }
}
