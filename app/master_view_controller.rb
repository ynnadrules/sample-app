class MasterViewController < UIViewController
  attr_reader :layout, :tableView
  def loadView
    @layout = MasterLayout.new
    @tableView = @layout.tableView

    self.view = @layout.view
  end

  def viewDidLoad
      super
      tableView.delegate = self
      tableView.dataSource = self
      tableView.separatorStyle = UITableViewCellSeparatorStyleNone
      tableView.registerClass CellView, forCellReuseIdentifier: CellView::ID
      tableView.tableFooterView = UIView.new #trick to hide empty rows
    end

    def viewWillAppear(animated)
      super

      view.setNeedsUpdateConstraints
    end

    def viewWillDisappear(animated)
      super
    end

    # UITableViewDataSource

    def tableView(tableView, numberOfRowsInSection: section)
      10
    end

    def tableView(tableView, cellForRowAtIndexPath: indexPath)
      tableView.dequeueReusableCellWithIdentifier(CellView::ID, forIndexPath: indexPath)
    end

    # UITableViewDelegate

    def tableView(tableView, heightForRowAtIndexPath: indexPath)
      CellLayout::CELL_HEIGHT
    end

    def tableView(tableView, viewForHeaderInSection: section)
      SectionHeaderLayout.new.view
    end

    def tableView(tableView, heightForHeaderInSection: section)
      37
    end

    def updateViewConstraints
      layout.add_constraints(self)
      super
    end

    def prefersStatusBarHidden
      true
    end
end
