class CellView < UITableViewCell
  ID = 'master-cell'

  attr_reader :layout

  def initWithStyle(style, reuseIdentifier:identifier)
    super.tap do
      @layout = CellLayout.new
      self.contentView.addSubview layout.view
    end
  end

  def prepareForReuse
    super

  end

  def layoutSubviews
    super
    self.updateConstraints
  end

  def updateConstraints
    super
    @layout.add_constraints(self)
  end
end
