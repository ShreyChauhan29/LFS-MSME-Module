namespace MSMEModule.MSMEModule;

using Microsoft.Purchases.Document;

pageextension 71407 LFS_MSME_PurchInvSubfrom extends "Purch. Invoice Subform"
{
    layout
    {
        addbefore("GST Group Code")
        {
            field("Receipt No."; Rec."Receipt No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
