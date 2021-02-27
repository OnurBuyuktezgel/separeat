require 'rqrcode'

class TablesController < ApplicationController
  skip_after_action :verify_authorized

  def qr_code
    set_table

    qrcode = RQRCode::QRCode.new(restaurant_url(@table.restaurant))

    @svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end

  private

  def set_table
    @table = Table.find(params[:id])
  end
end
