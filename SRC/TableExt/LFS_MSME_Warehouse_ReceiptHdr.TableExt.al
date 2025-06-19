tableextension 71409 LFS_MSME_Warehouse_ReceiptHdr extends "Warehouse Receipt Header"
{
    fields
    {
        field(50001; "LFS MSME Due Date"; Date)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'MSME Due Date';
        }
    }
}
