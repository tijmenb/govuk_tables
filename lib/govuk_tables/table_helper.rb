module GovukTables
  module TableHelper
    def govuk_table
      GovukTables::Table.helper(self) do |table|
        yield(table)
      end
    end
  end
end
