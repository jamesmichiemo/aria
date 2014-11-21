class AffinityFinder
  attr_reader :selected, :comparison

  def initialize(selected_monad, comparison_monad)
    @selected = selected_monad
    @comparison = comparison_monad
  end

  def self.match?(selected_monad, comparison_monad)
    new(selected_monad, comparison_monad).match?
  end

  def match?
    if same_interval || # identical, including either major or minor
      ((selected_monad.tonality == 24 && comparison_monad.tonality == 13) && same_interval || # 13 and 24 are affinite if the same tone quality
    #     ((selected_monad.tonality == 13 && comparison_monad.tonality == 24) && same_interval) || # 24 and 13 are affinite if the same tone quality
    #     (selected_monad.tonality == (comparison_monad.tonality - 1) && same_interval) || # affinity sequence
    #     (selected_monad.tonality == (comparison_monad.tonality + 1) && selected_monad.interval == comparison_monad.interval) # affinity sequence
    #   true
    # end
  end

  private
  def adjacent
    down_tone || up_tone
  end

  def same_interval
    selected.interval == comparison.interval
  end

  def down_tone
    (selected.tonality == (comparison.tonality - 1)
  end

  def up_tone
    (selected.tonality == (comparison.tonality + 1)
  end
end
