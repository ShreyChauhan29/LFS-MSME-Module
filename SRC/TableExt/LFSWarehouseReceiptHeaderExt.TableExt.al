namespace MSMEModule.MSMEModule;
using Microsoft.Warehouse.Document;
tableextension 71409 "LFS Warehouse ReceiptHeaderExt" extends "Warehouse Receipt Header"
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
