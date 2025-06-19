namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.History;
tableextension 71405 "LFS Purchase Receipt HeaderExt" extends "Purch. Rcpt. Header"
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
