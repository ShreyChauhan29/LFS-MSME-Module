tableextension 71408 LFS_MSME_VendorLedgerEntry extends "Vendor Ledger Entry"
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
