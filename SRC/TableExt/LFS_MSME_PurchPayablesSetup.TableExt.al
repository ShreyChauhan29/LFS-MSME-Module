tableextension 71400 LFS_MSME_PurchPayablesSetup extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; "LFS MSME Payment Period"; DateFormula)
        {
            DataClassification = CustomerContent;
            Caption = 'MSME Payment Period';

        }
        field(50001; "LFS Activate MSME"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Activate MSME';
            trigger OnValidate()
            var
                DimensionRec: Record Dimension;
                dimensionValue: Record "Dimension Value";
                vendorTypeDimFound: Boolean;
                DefaultDimension: Record "Default Dimension";

            begin

                if rec."LFS Activate MSME" = true then begin
                    DimensionRec.Reset();
                    DimensionRec.Setrange(Code, 'VENDOR TYPE');
                    if not DimensionRec.FindFirst() then begin
                        DimensionRec.Init();
                        DimensionRec.Validate(Code, 'VENDOR TYPE');
                        DimensionRec.Insert();

                        dimensionValue.Reset();
                        dimensionValue.SetRange("Dimension Code", 'VENDOR TYPE');
                        dimensionValue.SetRange(Code, 'OTHERS');
                        if not dimensionValue.FindFirst() then begin
                            dimensionValue.Init();
                            dimensionValue.Validate("Dimension Code", 'VENDOR TYPE');
                            dimensionValue.Validate(Code, 'OTHERS');
                            dimensionValue.Validate(Name, 'OTHERS');
                            dimensionValue.Insert();
                        end;

                        dimensionValue.Reset();
                        dimensionValue.SetRange("Dimension Code", 'VENDOR TYPE');
                        dimensionValue.SetRange(Code, 'MSME');
                        if not dimensionValue.FindFirst() then begin
                            dimensionValue.Init();
                            dimensionValue.Validate("Dimension Code", 'VENDOR TYPE');
                            dimensionValue.Validate(Code, 'MSME');
                            dimensionValue.Validate(Name, 'MSME');
                            dimensionValue.Insert();
                        end;

                        DefaultDimension.Reset();
                        DefaultDimension.SetRange("Dimension Code", 'VENDOR TYPE');
                        DefaultDimension.SetRange("Table ID", 23);
                        if not DefaultDimension.FindFirst() then begin
                            DefaultDimension.Init();
                            DefaultDimension.Validate("Table ID", 23);
                            DefaultDimension.Validate("Dimension Code", 'VENDOR TYPE');
                            DefaultDimension.Validate("Value Posting", DefaultDimension."Value Posting"::"Code Mandatory");
                            DefaultDimension.Validate("Parent Type", DefaultDimension."Parent Type"::Vendor);
                            DefaultDimension.Insert();
                        end;

                    end;
                end;
            end;
            //     if Dimension.Code = 'VENDOR TYPE' then begin
            //         dimensionValue.Reset();
            //         dimensionValue.SetRange("Dimension Code", Dimension.Code);
            //         dimensionValue.SetRange(Code, 'OTHERS');
            //         if not dimensionValue.FindFirst() then begin
            //             dimensionValue.Init();
            //             dimensionValue.Code := 'OTHERS';
            //             dimensionValue.Validate(Code, 'OTHERS');
            //             dimensionValue.Insert();
            //         end;

            //         dimensionValue.Reset();
            //         dimensionValue.SetRange("Dimension Code", Dimension.Code);
            //         dimensionValue.SetRange(Code, 'MSME');
            //         if not dimensionValue.FindFirst() then begin
            //             dimensionValue.Init();
            //             dimensionValue.Code := 'MSME';
            //             dimensionValue.Validate(Code, 'MSME');
            //             dimensionValue.Insert();
            //         end;
            //     end;

        }

    }
    // var
    //     MSMEActivate: Boolean;

    // procedure MSMEActivate1()
    // var
    //     myInt: Integer;
    // begin
    //     if Rec."LFS Activate MSME" = true then
    //         MSMEActivate := true
    //     else
    //         MSMEActivate := false;
    // end;

}
