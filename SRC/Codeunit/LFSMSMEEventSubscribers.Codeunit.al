codeunit 71400 LFS_MSME_EventSubscribers
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostInvoice', '', false, false)]  //Finance
    local procedure OnAfterPostInvoice(var PurchHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; TotalPurchLine: Record "Purchase Line"; TotalPurchLineLCY: Record "Purchase Line"; CommitIsSupressed: Boolean; var VendorLedgerEntry: Record "Vendor Ledger Entry");
    var
        PurchPayable: Record "Purchases & Payables Setup";
    begin
        PurchPayable.Get();
        if PurchPayable."LFS Activate MSME" then begin
            VendorLedgerEntry."LFS MSME Due Date" := PurchHeader."LFS MSME Due Date";
            VendorLedgerEntry.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnRunOnBeforePostInvoice, '', false, false)]
    local procedure "Purch.-Post_OnRunOnBeforePostInvoice"(PurchaseHeader: Record "Purchase Header"; var EverythingInvoiced: Boolean)
    var
        PurchLine: Record "Purchase Line";
        Vendor: Record Vendor;
        PurchReceiptHeader: Record "Purch. Rcpt. Header";
        PurchPayable: Record "Purchases & Payables Setup";
    begin
        PurchPayable.Get();
        if PurchPayable."LFS Activate MSME" then
            if Vendor.get(PurchaseHeader."Buy-from Vendor No.") then
                if Vendor."LFS MSME Status" = Vendor."LFS MSME Status"::Registerd then begin
                    PurchLine.Reset();
                    PurchLine.SetRange("Document No.", PurchaseHeader."No.");
                    PurchLine.Setfilter("Receipt No.", '<>%1', '');
                    if PurchLine.FindFirst() then begin
                        if PurchReceiptHeader.Get(PurchLine."Receipt No.") then
                            PurchaseHeader."LFS MSME Due Date" := CalcDate(PurchPayable."LFS MSME Payment Period", PurchReceiptHeader."Posting Date");
                    end else
                        PurchaseHeader."LFS MSME Due Date" := CalcDate(PurchPayable."LFS MSME Payment Period", PurchaseHeader."Document Date");
                    PurchaseHeader.Modify();
                end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePostPurchaseDoc, '', false, false)]
    local procedure "Purch.-Post_OnBeforePostPurchaseDoc"(var Sender: Codeunit "Purch.-Post"; var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; CommitIsSupressed: Boolean; var HideProgressWindow: Boolean; var ItemJnlPostLine: Codeunit "Item Jnl.-Post Line"; var IsHandled: Boolean)
    var
        PurchLine: Record "Purchase Line";
        Vendor: Record Vendor;
        PurchReceiptHeader: Record "Purch. Rcpt. Header";
        PurchPayable: Record "Purchases & Payables Setup";
    begin
        PurchPayable.Get();
        if PurchPayable."LFS Activate MSME" then
            if Vendor.get(PurchaseHeader."Buy-from Vendor No.") then
                if Vendor."LFS MSME Status" = Vendor."LFS MSME Status"::Registerd then begin
                    PurchLine.Reset();
                    PurchLine.SetRange("Document No.", PurchaseHeader."No.");
                    PurchLine.Setfilter("Receipt No.", '<>%1', '');
                    if PurchLine.FindFirst() then begin
                        if PurchReceiptHeader.Get(PurchLine."Receipt No.") then
                            PurchaseHeader."LFS MSME Due Date" := CalcDate(PurchPayable."LFS MSME Payment Period", PurchReceiptHeader."Posting Date");
                    end else
                        PurchaseHeader."LFS MSME Due Date" := CalcDate(PurchPayable."LFS MSME Payment Period", PurchaseHeader."Document Date");
                    PurchaseHeader.Modify();
                end;
    end;

}
