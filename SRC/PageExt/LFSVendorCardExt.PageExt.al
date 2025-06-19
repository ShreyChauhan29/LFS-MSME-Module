namespace Microsoft.Purchases.Vendor;
using Microsoft.Purchases.Setup;
pageextension 71405 "LFS Vendor Card Ext." extends "Vendor Card"
{
    layout
    {
        addbefore("Address & Contact")
        {
            group("LFS MSME Details")
            {
                Caption = 'MSME Details';
                Visible = MSMEDetailsVisible;
                field("LFS MSME Status"; Rec."LFS MSME Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MSME Status field.';
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        MSMEType_N_No_Edit();
                    end;
                }
                field("LFS MSME Type"; Rec."LFS MSME Type")
                {
                    ApplicationArea = all;
                    Editable = MSMEType_N_No_Editable;
                    ToolTip = 'Specifies the value of the MSME Type field.';
                    ShowMandatory = true;
                }
                field("LFS MSME No."; Rec."LFS MSME No.")
                {
                    ApplicationArea = all;
                    Editable = MSMEType_N_No_Editable;
                    ToolTip = 'Specifies the value of the MSME No. field.';
                    ShowMandatory = true;
                }
            }
        }



    }

    actions
    {
        modify(SendApprovalRequest)
        {
            trigger OnBeforeAction()
            begin
                MSMEValidation();
            end;
        }
        addafter(Delegate)
        {
            action(LFSRelease)
            {
                Caption = 'Release';
                ToolTip = 'Release';
                Ellipsis = true;
                Image = ReleaseDoc;
                ApplicationArea = ALL;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                begin

                    MSMEValidation();
                end;

            }
        }

    }
    trigger OnOpenPage()
    begin
        MSMEDetails();
        MSMEType_N_No_Edit();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        MSMEDetails();
    end;

    var
        // MakeFieldsEdit: Boolean;
        MSMEDetailsVisible: Boolean;
        MSMEType_N_No_Editable: Boolean;


    local procedure MSMEDetails()
    var
        PurchPaybleSetup: Record "Purchases & Payables Setup";
    begin
        PurchPaybleSetup.Get();
        if PurchPaybleSetup."LFS Activate MSME" then
            MSMEDetailsVisible := true
        else
            MSMEDetailsVisible := false;
    end;

    local procedure MSMEType_N_No_Edit()
    begin
        if Rec."LFS MSME Status" = Rec."LFS MSME Status"::Registerd then
            MSMEType_N_No_Editable := true
        else begin
            MSMEType_N_No_Editable := false;
            Rec."LFS MSME No." := '';
            Rec."LFS MSME Type" := Rec."LFS MSME Type"::" ";
        end;

    end;

    procedure MSMEValidation()

    begin
        Rec.TestField("LFS MSME Status");
        if Rec."LFS MSME Status" = Rec."LFS MSME Status"::Registerd then begin
            rec.TestField(Rec."LFS MSME No.");
            rec.TestField(Rec."LFS MSME Type");
        end;
    end;
}
