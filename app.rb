require 'sinatra'
require 'pdfkit'

CRAGS_PRINT_URL = "http://crags.nz/print/"

get '/pdf/:id' do |node_id|

	PDFKit.configure do |config|
	  config.default_options = {
	    :margin_top => "4mm",
	    :margin_right => "0mm",
	    :margin_bottom => "6mm",
	    :margin_left => "0mm",
      :footer_center => "Page [page] of [toPage]",
      :footer_font_size => "8"
	   }
  end

  url = CRAGS_PRINT_URL + node_id + '?filters=' + (params[:filters] || '')
  kit = PDFKit.new(url)

  content_type 'application/pdf'
  kit.to_pdf

end
