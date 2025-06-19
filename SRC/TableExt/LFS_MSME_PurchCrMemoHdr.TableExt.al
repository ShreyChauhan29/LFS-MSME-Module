tableextension 71404 LFS_MSME_PurchCrMemoHdr extends "Purch. Cr. Memo Hdr."
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
