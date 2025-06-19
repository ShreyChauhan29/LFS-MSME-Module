namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.History;
tableextension 71406 "LFS Return Shipment Header Ext" extends "Return Shipment Header"
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
