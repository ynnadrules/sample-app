class CellLayout < MK::Layout
  CELL_HEIGHT = 53
  BASE_HEIGHT = 48

  view :icon
  view :other_container

  def add_constraints(cell)
    constraints(self.view) do
      origin [0, 0]
      width.is(:superview)
      height BASE_HEIGHT
    end
  end

  def layout
    root :root do
      background_color 0xd6d6d9.uicolor

      add UIImageView, :icon do
        background_color :orange.uicolor
        constraints do
          origin [0, 0]
          width 36
          height.is(:superview)
        end
      end

      add UIView, :other_container do
        background_color :cyan.uicolor(0.25)
        constraints do
          y 0
          left.equals(:icon, :right)
          width 33
          height.is(:superview)
        end
      end

      add UILabel, :title_label do
        font UIFont.fontWithName("AvenirNextCondensed-Medium", size: 16)
        text_color 0x444444.uicolor

        text "Movie Title"

        constraints do
          left.equals(:other_container, :right)
        end
        center_y_aligned
      end

      add UILabel, :progress_label do
        font UIFont.fontWithName("AvenirNextCondensed-Medium", size: 16)
        text_alignment :right.nsalignment
        text_color :black.uicolor

        constraints do
          right.is(:superview).minus(7)
        end

        center_y_aligned

        text "#{(rand * 100).round}%"
      end
    end
  end

  def center_y_aligned
    constraints do
      center_y.is(:superview)
    end
  end

end
