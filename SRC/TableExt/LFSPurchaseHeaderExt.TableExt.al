namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.Document;
tableextension 71402 "LFS Purchase Header Ext." extends "Purchase Header"
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
