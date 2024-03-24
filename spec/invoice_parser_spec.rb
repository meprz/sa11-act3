require 'invoice_parser'

RSpec.describe '#parse_invoices' do
    it 'parses a single invoice' do
        sample_entry = "2023-03-01 - INV001 - Acme Corp - $1000"
        expect{ parse_invoices sample_entry }.to output("Date: 2023-03-01, Invoice Number: INV001, Client: Acme Corp, Amount: $1000\n").to_stdout
    end

    it 'parses multiple invoices' do
        sample_entries = <<-INVOICES
        2023-03-01 - INV001 - Acme Corp - $1000
        2023-03-02 - INV002 - Beta LLC - $2050
        2023-03-03 - INV003 - Gamma Inc - $3500
        INVOICES

        sample_output = "Date: 2023-03-01, Invoice Number: INV001, Client: Acme Corp, Amount: $1000\nDate: 2023-03-02, Invoice Number: INV002, Client: Beta LLC, Amount: $2050\nDate: 2023-03-03, Invoice Number: INV003, Client: Gamma Inc, Amount: $3500\n"
        
        expect{ parse_invoices sample_entries }.to output(sample_output).to_stdout
    end
end
