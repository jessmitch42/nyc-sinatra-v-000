class Title < ActiveRecord::Base
    has_many :figure_titles
    has_many :figures, through: :figure_titles
end

# a title can be held by many figures
