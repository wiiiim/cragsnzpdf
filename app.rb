require 'sinatra'
require 'pdfkit'

CRAGS_PRINT_URL = "http://crags.nz/print/"

get '/pdf/:id' do |node_id|

	PDFKit.configure do |config|
	  config.default_options = {
	    :margin_top => "4mm",
	    :margin_right => "4mm",
	    :margin_bottom => "4mm",
	    :margin_left => "4mm",
      :footer_righ => "Page [page] of [toPage]",
	   }
  end 

  kit = PDFKit.new(CRAGS_PRINT_URL + node_id)

	content_type 'application/pdf'
  kit.to_pdf

end