require 'htmlentities'

module TracksHelper
  def decode_entities(string)
    HTMLEntities.new.decode(string)
  end
end

