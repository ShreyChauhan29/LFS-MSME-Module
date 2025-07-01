namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.Setup;
using Microsoft.Finance.Dimension;
tableextension 71400 "LFS Purch. & Payable Setup Ext" extends "Purchases & Payables Setup"
{
    fields
    {
        field(71400; "LFS MSME Payment Period"; DateFormula)
        {
            DataClassification = CustomerContent;
            Caption = 'MSME Payment Period';

        }
        field(71401; "LFS Activate MSME"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Activate MSME';
            trigger OnValidate()
            var
                DimensionRec: Record Dimension;
                dimensionValue: Record "Dimension Value";
                // vendorTypeDimFound: Boolean;
                DefaultDimension: Record "Default Dimension";

            begin
                if rec."LFS Activate MSME" = true then begin
                    TestField(Rec."LFS MSME Dimension Code");
                    TestField(Rec."LFS MSME Dimensions Value");
                    TestField(Rec."LFS Non-MSME Dimensions Value");

                    DimensionRec.Reset();
                    DimensionRec.Setrange(Code, Rec."LFS MSME Dimension Code");
                    if not DimensionRec.FindFirst() then begin
                        DimensionRec.Init();
                        DimensionRec.Validate(Code, Rec."LFS MSME Dimension Code");
                        DimensionRec.Insert();

                        dimensionValue.Reset();
                        dimensionValue.SetRange("Dimension Code", Rec."LFS MSME Dimension Code");
                        dimensionValue.SetRange(Code, Rec."LFS Non-MSME Dimensions Value");
                        if not dimensionValue.FindFirst() then begin
                            dimensionValue.Init();
                            dimensionValue.Validate("Dimension Code", Rec."LFS MSME Dimension Code");
                            dimensionValue.Validate(Code, Rec."LFS Non-MSME Dimensions Value");
                            dimensionValue.Validate(Name, Rec."LFS Non-MSME Dimensions Value");
                            dimensionValue.Insert();
                        end;

                        dimensionValue.Reset();
                        dimensionValue.SetRange("Dimension Code", Rec."LFS MSME Dimension Code");
                        dimensionValue.SetRange(Code, Rec."LFS MSME Dimensions Value");
                        if not dimensionValue.FindFirst() then begin
                            dimensionValue.Init();
                            dimensionValue.Validate("Dimension Code", Rec."LFS MSME Dimension Code");
                            dimensionValue.Validate(Code, Rec."LFS MSME Dimensions Value");
                            dimensionValue.Validate(Name, Rec."LFS MSME Dimensions Value");
                            dimensionValue.Insert();
                        end;

                        DefaultDimension.Reset();
                        DefaultDimension.SetRange("Dimension Code", Rec."LFS MSME Dimension Code");
                        DefaultDimension.SetRange("Table ID", 23);
                        if not DefaultDimension.FindFirst() then begin
                            DefaultDimension.Init();
                            DefaultDimension.Validate("Table ID", 23);
                            DefaultDimension.Validate("Dimension Code", Rec."LFS MSME Dimension Code");
                            DefaultDimension.Validate("Value Posting", DefaultDimension."Value Posting"::"Code Mandatory");
                            DefaultDimension.Validate("Parent Type", DefaultDimension."Parent Type"::Vendor);
                            DefaultDimension.Insert();
                        end;

                    end;
                end;
            end;
        }
        field(71402; "LFS MSME Dimension Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'MSME Dimension Code';
        }
        field(71403; "LFS MSME Dimensions Value"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'MSME Dimensions Value';
        }
        field(71404; "LFS Non-MSME Dimensions Value"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Non-MSME Dimensions Value';
        }
        field(71405; "LFS Due Date Calc."; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Due Date Calc';
            OptionMembers = "Document Date","Invoice Received Date";
            OptionCaption = 'Document Date,Invoice Received Date';
        }
    }
}
