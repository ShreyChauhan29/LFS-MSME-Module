report 71400 "LFS MSME Report"
{
    ApplicationArea = All;
    Caption = 'MSME Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './SRC/ReportLayouts/MSME.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = sorting("Posting Date") order(ascending);
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(Vendor_Name; "Vendor Name")
            {

            }
            column(PANNo; PANNo)
            {

            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Original_Amt___LCY_; "Original Amt. (LCY)")
            {

            }
            column(PostingDateDetVenLedEntry; PostingDateDetVenLedEntry)
            {

            }
            column(DelayBeyondDays; DelayBeyondDays)
            {

            }
            column(StartDate; StartDate)
            {

            }
            column(EndDate; EndDate)
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(MSMEBoolean; MSMEBoolean)
            {

            }
            column(PaidOn; DetailedVendorLedgEntry."Posting Date")
            {

            }
            column(SumOrginalAmtLCY_VLE; SumOrginalAmtLCY_VLE)
            {

            }
            trigger OnPreDataItem()
            begin
                SumOrginalAmtLCY_VLE := 0;
                if (StartDate <> 0D) AND (EndDate <> 0D) then
                    "Vendor Ledger Entry".SETRANGE("Vendor Ledger Entry"."Posting Date", StartDate, EndDate);
            end;

            trigger OnAfterGetRecord()
            var
                Vendor: Record Vendor;
            begin
                Clear(PANNo);
                Clear(MSMEBoolean);
                Vendor.get("Vendor No.");
                PANNo := Vendor."P.A.N. No.";
                MSMEBoolean := Format(Vendor."LFS MSME Type");
                if Vendor."LFS MSME Status" = Vendor."LFS MSME Status"::Unregistered then
                    CurrReport.Skip();

                Clear(PostingDateDetVenLedEntry);
                Clear(DelayBeyondDays);

                DetailedVendorLedgEntry.Reset();
                DetailedVendorLedgEntry.SetRange("Vendor Ledger Entry No.", "Vendor Ledger Entry"."Entry No.");
                DetailedVendorLedgEntry.SetRange("Vendor No.", "Vendor No.");
                DetailedVendorLedgEntry.SetFilter("Document Type", '%1', DetailedVendorLedgEntry."Document Type"::Payment);
                if DetailedVendorLedgEntry.FindLast() then
                    if ("LFS MSME Due Date" <> 0D) and ("LFS MSME Due Date" <= DetailedVendorLedgEntry."Posting Date") then begin
                        DelayBeyondDays := DetailedVendorLedgEntry."Posting Date" - "Vendor Ledger Entry"."LFS MSME Due Date";
                        PostingDateDetVenLedEntry := DetailedVendorLedgEntry."Posting Date";
                    end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(General)
                {
                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = All;
                        Visible = true;
                        Enabled = true;
                        ToolTip = 'Specifies the value of the Start Date field.';
                        Caption = 'Start Date';
                    }
                    field("end Date"; EndDate)
                    {
                        ApplicationArea = All;
                        Visible = true;
                        Enabled = true;
                        ToolTip = 'Specifies the value of the end Date field.';
                        Caption = 'end Date';
                    }

                }
            }
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        /*  Vendor.Reset();
         Vendor.SetRange("No.", "Vendor Ledger Entry"."Vendor No.");
         Vendor.SetFilter(MSME, 'true'); */
    end;

    var
        CompanyInfo: Record "Company Information";
        Vendor: Record Vendor;
        DetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry";
        PANNo: Text;
        PostingDateDetVenLedEntry: Date;
        DelayBeyondDays: Integer;
        StartDate: Date;
        EndDate: Date;
        MSMEBoolean: Text;
        SumOrginalAmtLCY_VLE: Decimal;

}