require 'htmlentities'

module TracksHelper
  def decode_entities(string)
    HTMLEntities.new.decode(string)
  end

  def collect_artists(hash)
    hash.map { |a| a["name"] if a["type"] == "artist"}.compact * ", " unless hash.nil?
  end
end

