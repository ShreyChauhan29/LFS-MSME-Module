namespace MSMEModule.MSMEModule;
using Microsoft.Foundation.Company;
tableextension 71401 "LFS Company Information Ext." extends "Company Information"
{
    fields
    {
        field(71400; "LFS MSME No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'MSME No.';
        }
        field(71401; "LFS MSME Type"; Enum "LFS MSME Type Vendor")
        {
            DataClassification = CustomerContent;
            Caption = 'MSME Type';
        }
    }
}
