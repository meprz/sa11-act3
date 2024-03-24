

#...
def parse_invoices(invoice_data)
    invoice_data.split("\n").each do |entry|
        pattern = /(\d{4}-\d{2}-\d{2}) - (INV\d{3}) - ([a-zA-Z ]+) - \$(\d+)/
        data = entry.scan pattern
        puts "Date: #{data[0][0]}, Invoice Number: #{data[0][1]}, Client: #{data[0][2]}, Amount: $#{data[0][3]}"
    end
end

# invoice_entries = <<-INVOICES
#         2023-03-01 - INV001 - Acme Corp - $1000
#         2023-03-02 - INV002 - Beta LLC - $2050
#         2023-03-03 - INV003 - Gamma Inc - $3500
#         INVOICES

# parse_invoices(invoice_entries)
