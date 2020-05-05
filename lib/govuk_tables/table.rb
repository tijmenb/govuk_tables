module GovukTables
  class Table
    def self.helper(context, caption = nil, opt = {})
      builder = TableBuilder.new(context.tag)

      classes = %w(govuk-table)
      caption_classes = %w(govuk-table__caption)

      context.tag.table class: classes do
        context.concat context.tag.caption caption, class: caption_classes
        yield(builder)
      end
    end

    class TableBuilder
      include ActionView::Helpers::UrlHelper
      include ActionView::Helpers::TagHelper

      attr_reader :tag

      def initialize(tag)
        @tag = tag
      end

      def head
        tag.thead class: "govuk-table__head" do
          tag.tr class: "govuk-table__row" do
            yield(self)
          end
        end
      end

      def body
        tag.tbody class: "govuk-table__body" do
          yield(self)
        end
      end

      def row
        tag.tr class: "govuk-table__row" do
          yield(self)
        end
      end

      def header(name, options = {})
        classes = %w(govuk-table__header)
        tag.th name, class: classes, scope: options[:scope] || "col"
      end

      def cell(value, options = {})
        classes = %w(govuk-table__cell)
        value ||= "Not set"
        tag.td value, class: classes
      end
    end
  end
end
