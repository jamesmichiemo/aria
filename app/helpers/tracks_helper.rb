require 'htmlentities'

module TracksHelper
  def decode_entities(string)
    HTMLEntities.new.decode(string)
  end

  def collect_artists(hash)
    hash.map { |a| a["name"] if a["type"] == "artist"}.compact * ", " unless hash.nil?
  end

  def encode_key(string)
    if string == "G♯min"
      monado = []
      monado << 13
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "Bmaj"
      monado = []
      monado << 13
      monado << '∠＝∞'
      return monado
    end

    if string == "D♯min"
      monado = []
      monado << 14
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "F♯maj"
      monado = []
      monado << 14
      monado << '∠＝∞'
      return monado
    end

    if string == "A♯min"
      monado = []
      monado << 15
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "C♯maj"
      monado = []
      monado << 15
      monado << '∠＝∞'
      return monado
    end

    if string == "Fmin"
      monado = []
      monado << 16
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "G♯maj"
      monado = []
      monado << 16
      monado << '∠＝∞'
      return monado
    end

    if string == "Cmin"
      monado = []
      monado << 17
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "D♯maj"
      monado = []
      monado << 17
      monado << '∠＝∞'
      return monado
    end

    if string == "Gmin"
      monado = []
      monado << 18
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "A♯maj"
      monado = []
      monado << 18
      monado << '∠＝∞'
      return monado
    end

    if string == "Dmin"
      monado = []
      monado << 19
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "Fmaj"
      monado = []
      monado << 19
      monado << '∠＝∞'
      return monado
    end

    if string == "Amin"
      monado = []
      monado << 20
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "Cmaj"
      monado = []
      monado << 20
      monado << '∠＝∞'
      return monado
    end

    if string == "Emin"
      monado = []
      monado << 21
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "Gmaj"
      monado = []
      monado << 21
      monado << '∠＝∞'
      return monado
    end

    if string == "Bmin"
      monado = []
      monado << 22
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "Dmaj"
      monado = []
      monado << 22
      monado << '∠＝∞'
      return monado
    end

    if string == "F♯min"
      monado = []
      monado << 23
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "Amaj"
      monado = []
      monado << 23
      monado << '∠＝∞'
      return monado
    end

    if string == "C♯min"
      monado = []
      monado << 24
      monado << 'ζ=δτ(ωρ)'
      return monado
    end

    if string == "Emaj"
      monado = []
      monado << 24
      monado << '∠＝∞'
      return monado
    end
    ''
  end

  def affinity?(monad0, tonality0, monad1, tonality1)
    if (monad0 == monad1) || # identical, including either major or minor
       ((monad0 == 24 && monad1 == 13) && tonality0 == tonality1) || # 13 and 24 are affinite if the same tone quality
       ((monad0 == 13 && monad1 == 24) && tonality0 == tonality1) || # 24 and 13 are affinite if the same tone quality
       (monad0 == (monad1 - 1) && tonality0 == tonality1) || # affinity sequence
       (monad0 == (monad1 + 1) && tonality0 == tonality1) # affinity sequence
      true
    end
  end

  def favorited(string)
    if current_user.favorites.exists?(title: string)
      true
    else
      false
    end
  end
end

