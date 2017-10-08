module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_reader :headers, :csv_contents


    def initialize
      read
      set_row_methods
    end

    def each(&block)
      csv_contents.each do |row|
        block.call(CsvRow.new(row))
      end
    end

    private

    def set_row_methods
      headers.each_with_index do |header, index|
        CsvRow.class_eval do
          define_method header do
            instance_eval("row[#{index}]")
          end
        end
      end
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.csv'
      file = File.new filename
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    CsvRow = Struct.new(:row)
  end
end

class RubyCsv
  include ActsAsCsv

  acts_as_csv
end

csv = RubyCsv.new
csv.each { |row| puts row.one }
