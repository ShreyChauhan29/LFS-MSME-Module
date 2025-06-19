namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.Payables;
tableextension 71408 "LFS Vendor Ledger Entry Ext." extends "Vendor Ledger Entry"
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
