class SectionHeaderLayout < MK::Layout
  def layout
    root :root do
      add UILabel, :header_label do
        font UIFont.fontWithName("AvenirNext-DemiBold", size: 18)

        text "MOVIES"
        text_color :white.uicolor

        constraints do
          x 20
          center_y.is(:superview)
        end
      end

      background_color 0x444444.uicolor
    end
  end

end
