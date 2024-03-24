require 'url_extractor'

RSpec.describe '#extract_urls' do
    it 'should extract nothing when there are no URLs' do
        sample_text = "Woah..."
        expect{ extract_urls sample_text }.to output(//).to_stdout
    end

    it 'should extract a single https URL' do
        sample_text = "Check out our YouTube channel at https://www.youtube.com/@ChimperatorChannel for the latest releases!"
        expect{ extract_urls sample_text }.to output(/https:\/\/www.youtube.com\/@ChimperatorChannel/).to_stdout
    end

    it 'should extract a single https URL without www' do
        sample_text = "Check out our YouTube channel at https://youtube.com/@ChimperatorChannel for the latest releases!"
        expect{ extract_urls sample_text }.to output(/https:\/\/youtube.com\/@ChimperatorChannel/).to_stdout
    end

    it 'should extract multiple https URLs' do
        sample_text = "Check out our YouTube channel at https://www.youtube.com/@ChimperatorChannel for the latest releases! Don't forget our Twitter at https://twitter.com/Chimperator."
        expect{ extract_urls sample_text }.to output(/https:\/\/www.youtube.com\/@ChimperatorChannel/).to_stdout
        expect{ extract_urls sample_text }.to output(/https:\/\/twitter.com\/Chimperator/).to_stdout
    end

    it 'should extract multiple URLs' do
        sample_text = "Visit our site at http://www.example.org for more information. Check out our search page at https://example.com/search?q=ruby+regex. Don't forget to ftp our resources at ftp://example.com/resources."

        sample_output = "http://www.example.org\nhttps://example.com/search?q=ruby+regex\nftp://example.com/resources\n"
        
        expect{ extract_urls sample_text }.to output(sample_output).to_stdout
    end
end
