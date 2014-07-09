class SpecialHeaderLayout < MK::Layout

  def layout
    root :root do
      background_color :white.uicolor

      add UIImageView, :badge do
        background_color 0xdad969.uicolor
        constraints do
          center_x 67
        end
        center_y_aligned
      end

      add UILabel, :description do
        font UIFont.fontWithName("AvenirNext-Medium", size:10)
        number_of_lines 0
        preferredMaxLayoutWidth 155
        text_color 0x444444.uicolor

        constraints do
          x 131
        end

        center_y_aligned

        text "Special Header with wordz"
      end

      add UILabel, :arrow do
        font UIFont.fontWithName("AvenirNext-Medium", size:25)

        text ">"
        text_alignment :center.nsalignment
        text_color 0x444444.uicolor

        constraints do
          right.is(:superview).minus(9)
        end

        center_y_aligned(-2)
      end
    end
  end

  def center_y_aligned(offset=0)
    constraints do
      center_y.is(:superview).plus(offset)
    end
  end

end
