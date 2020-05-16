module ApplicationHelper

  def display_svg(path)
    File.open("app/assets/images/#{path}", 'rb') do |file|
      # rubocop:disable Rails/OutputSafety
      raw file.read
      # rubocop:enable Rails/OutputSafety
    end
  end
end
