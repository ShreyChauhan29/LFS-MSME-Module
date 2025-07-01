namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.Setup;
pageextension 71400 "LFS Purch. & Payable Setup Ext" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter(General)
        {
            group("MSME Details")
            {
                Caption = 'MSME Details';
                field("Activate MSME"; Rec."LFS Activate MSME")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies Whether MSME is activated or Not.';
                    trigger OnValidate()
                    begin
                        MSMEActivate1();
                    end;
                }
                field("LFS MSME Payment Period"; Rec."LFS MSME Payment Period")
                {
                    ApplicationArea = all;
                    Enabled = MSMEActivate;
                    ToolTip = 'Specifies the value of the MSME Payment Period field.';
                }
                field("LFS Due Date Calc."; Rec."LFS Due Date Calc.")
                {
                    ApplicationArea = All;
                    Enabled = Rec."LFS Activate MSME";
                    ToolTip = 'Specifies the value of the Due Date Calc field. For Non-GRN Documents which not having Receipt Nos.', Comment = '%';
                }
                group("MSME Dimension")
                {
                    Caption = 'MSME Dimension';
                    field("LFS MSME Dimension Code"; Rec."LFS MSME Dimension Code")
                    {
                        ApplicationArea = All;
                        Enabled = (Rec."LFS Activate MSME" = false) and (Rec."LFS MSME Dimension Code" = '');
                        ToolTip = 'Specifies the value of the MSME Dimension Code field.', Comment = '%';
                    }
                    field("LFS MSME Dimensions Value 1"; Rec."LFS MSME Dimensions Value")
                    {
                        ApplicationArea = All;
                        Enabled = (Rec."LFS Activate MSME" = false) and (Rec."LFS MSME Dimensions Value" = '');
                        ToolTip = 'Specifies the value of the MSME Dimensions Value 1 field.', Comment = '%';
                    }
                    field("LFS MSME Dimensions Value 2"; Rec."LFS Non-MSME Dimensions Value")
                    {
                        ApplicationArea = All;
                        Enabled = (Rec."LFS Activate MSME" = false) and (Rec."LFS Non-MSME Dimensions Value" = '');
                        ToolTip = 'Specifies the value of the MSME Dimensions Value 2 field.', Comment = '%';
                    }
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        MSMEActivate2();
    end;

    // trigger OnAfterGetRecord()
    // begin

    //     MSMEActivate1();
    // end;

    // trigger OnAfterGetCurrRecord()
    // begin
    //     MSMEActivate1();
    // end;

    var
        MSMEActivate: Boolean;

    procedure MSMEActivate1()
    begin
        if Rec."LFS Activate MSME" = true then begin
            MSMEActivate := true;
            Message('You have activated the MSME setup.');
        end
        else begin
            MSMEActivate := false;
            Message('You have deactivated the MSME setup.');
            // Rec.Validate("LFS MSME Payment Period",);
        end;
    end;

    procedure MSMEActivate2()
    begin
        if Rec."LFS Activate MSME" = true then
            MSMEActivate := true
        else
            MSMEActivate := false;
        // Rec.Validate("LFS MSME Payment Period",);
    end;
}

