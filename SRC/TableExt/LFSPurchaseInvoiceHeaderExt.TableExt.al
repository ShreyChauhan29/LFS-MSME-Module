namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.History;
tableextension 71403 "LFS Purchase Invoice HeaderExt" extends "Purch. Inv. Header"
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
