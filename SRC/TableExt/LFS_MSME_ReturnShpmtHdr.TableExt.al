tableextension 71406 LFS_MSME_ReturnShpmtHdr extends "Return Shipment Header"
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
