require 'htmlentities'

module TracksHelper
  def decode_entities(string)
    HTMLEntities.new.decode(string)
  end

  def collect_artists(hash)
    hash.map { |a| a["name"] if a["type"] == "artist"}.compact * ", " unless hash.nil?
  end

  def encode_key(string)
    Monad.by_name(decode_entities(string))
  end

  def affinity?(selected_monad, comparison_monad)
    AffinityFinder.match?(selected_monad, comparison_monad)
  end

  def favorited(string)
    if current_user.favorites.exists?(title: string)
      true
    else
      false
    end
  end
end

