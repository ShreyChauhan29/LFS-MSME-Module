pageextension 71400 LFS_MSME_PurchPayablesPage extends "Purchases & Payables Setup"
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
    var
        myInt: Integer;
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
    var
        myInt: Integer;
    begin
        if Rec."LFS Activate MSME" = true then begin
            MSMEActivate := true;
        end
        else begin
            MSMEActivate := false;
            // Rec.Validate("LFS MSME Payment Period",);
        end;
    end;
}

