class MasterLayout < MK::Layout
  view :tableView

  def add_constraints(controller)
    constraints(self.view) do
      origin [0, 0]
      width.equals(:superview)
      height.equals(:superview)
    end

    constraints :tableView do
      width.is(:superview)
      # height.is(:superview)
      bottom.is(:superview)
    end

    constraints :special_header do
      width.is(:superview)
    end
  end

  def layout
    add SpecialHeaderLayout.new.view, :special_header do
      constraints do
        origin [0, 0]
        height 54
      end
    end

    add UITableView, :tableView do
      background_color UIColor.whiteColor

      constraints do
        x 0

        # y 0
        below(:special_header)
      end
    end
  end #end layout
end
