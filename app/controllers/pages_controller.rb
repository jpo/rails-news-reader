class PagesController < ApplicationController
  include HighVoltage::StaticPage
  caches_page :show, if: :landing_page_without_flash_or_session?

  private

  def landing_page_without_flash_or_session?
    landing_page? && flash.empty? && !user_signed_in?
  end

  def landing_page?
    %w(index guest help).include?(params[:id])
  end
end
