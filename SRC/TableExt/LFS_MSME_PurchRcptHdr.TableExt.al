tableextension 71405 LFS_MSME_PurchRcptHdr extends "Purch. Rcpt. Header"
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
