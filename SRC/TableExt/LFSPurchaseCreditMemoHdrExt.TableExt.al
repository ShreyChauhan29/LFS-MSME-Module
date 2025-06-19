namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.History;
tableextension 71404 "LFS Purchase CreditMemo HdrExt" extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(71400; "LFS MSME Due Date"; Date)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'MSME Due Date';
        }
    }
}
