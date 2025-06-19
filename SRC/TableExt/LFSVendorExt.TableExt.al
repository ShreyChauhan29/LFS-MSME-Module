namespace MSMEModule.MSMEModule;
using Microsoft.Purchases.Vendor;
using Microsoft.Finance.Dimension;
tableextension 71407 "LFS Vendor Ext." extends Vendor
{
    fields
    {
        modify("Vendor Posting Group")
        {
            trigger OnBeforeValidate()
            begin
                TestField("LFS MSME Status");
                if Rec."LFS MSME Status" = Rec."LFS MSME Status"::Registerd then begin
                    TestField("LFS MSME Type");
                    TestField("LFS MSME No.");
                end;
            end;
        }
        field(71400; "LFS MSME Type"; Enum "LFS MSME Type Vendor")
        {
            DataClassification = CustomerContent;
            Caption = 'MSME Type';
        }
        field(71401; "LFS MSME No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'MSME No.';
        }
        field(71402; "LFS MSME Status"; Enum "LFS MSME Status")
        {
            DataClassification = CustomerContent;
            Caption = 'MSME Status';
            trigger OnValidate()
            var
                dimension: Record "Default Dimension";
                vendorTypeDimFound: Boolean;
            begin
                if Rec."LFS MSME Status" = Rec."LFS MSME Status"::Registerd then begin
                    dimension.Reset();
                    dimension.SetRange("No.", Rec."No.");
                    dimension.SetRange("Table ID", 23);
                    dimension.SetRange("Dimension Code", 'VENDOR TYPE');
                    vendorTypeDimFound := dimension.FindFirst();
                    if vendorTypeDimFound then begin
                        if dimension."Dimension Value Code" = 'OTHERS' then begin
                            dimension."Dimension Value Code" := 'MSME';
                            dimension."Value Posting" := dimension."Value Posting"::"Same Code";
                            dimension.Modify();
                        end;
                    end else begin
                        dimension.Init();
                        dimension."Table ID" := 23;
                        dimension."No." := Rec."No.";
                        dimension."Dimension Code" := 'VENDOR TYPE';
                        dimension."Dimension Value Code" := 'MSME';
                        dimension."Value Posting" := dimension."Value Posting"::"Same Code";
                        dimension.Insert();
                    end;
                end else begin
                    dimension.Reset();
                    dimension.SetRange("No.", Rec."No.");
                    dimension.SetRange("Table ID", 23);
                    dimension.SetRange("Dimension Code", 'VENDOR TYPE');
                    vendorTypeDimFound := dimension.FindFirst();

                    if vendorTypeDimFound then begin
                        if dimension."Dimension Value Code" = 'MSME' then begin
                            dimension."Dimension Value Code" := 'OTHERS';
                            dimension."Value Posting" := dimension."Value Posting"::"Same Code";
                            dimension.Modify();
                        end;
                    end else begin
                        dimension.Init();
                        dimension."Table ID" := 23;
                        dimension."No." := Rec."No.";
                        dimension."Dimension Code" := 'VENDOR TYPE';
                        dimension."Dimension Value Code" := 'OTHERS';
                        dimension."Value Posting" := dimension."Value Posting"::"Same Code";
                        dimension.Insert();
                    end;
                end;
            end;

        }

    }
}
