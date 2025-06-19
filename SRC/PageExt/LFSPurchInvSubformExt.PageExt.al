namespace MSMEModule.MSMEModule;

using Microsoft.Purchases.Document;
pageextension 71407 "LFS Purch. Inv. Subform Ext" extends "Purch. Invoice Subform"
{
    layout
    {
        addbefore("GST Group Code")
        {
            field("Receipt No."; Rec."Receipt No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Receipt No. field.';
            }
        }
    }
}
