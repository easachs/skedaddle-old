# frozen_string_literal: true

class ParkPoro
  attr_reader :name,
              :city,
              :state,
              :country,
              :description,
              :directions,
              :lat,
              :lon,
              :activities,
              :url,
              :thumbnail

  def initialize(data)
    @name = nil_check(data[:name])
    @city = nil_check(data[:city])
    @state = nil_check(data[:state])
    @country = nil_check(data[:country])
    @description = clean_string(nil_check(data[:description]))
    @directions = clean_string(nil_check(data[:directions]))
    @lat = nil_check(data[:lat])
    @lon = nil_check(data[:lon])
    @activities = data[:activities] ? data[:activities].keys.map(&:to_s) * ', ' : 'Not found'
    @url = data[:activities] ? data[:activities].values.first[:url] : 'Not found'
    @thumbnail = data[:activities] ? nil_check(data[:activities].values.first[:thumbnail]) : 'Not found'
  end

  def nil_check(attribute)
    ['', nil].include?(attribute) ? 'Not found' : attribute
  end

  def clean_string(string)
    string.gsub(
      Regexp.union('&lt;br', '&lt;', '&gt;', '&amp;gt;', '&amp;', '&amp;lt;', '&#39;', '&quot;', 'BR', '<br />'), ''
    )
  end

  def serialized
    {
      name: @name,
      city: @city,
      state: @state,
      country: @country,
      description: @description,
      directions: @directions,
      lat: @lat,
      lon: @lon,
      activities: @activities,
      url: @url,
      thumbnail: @thumbnail
    }
  end
end
