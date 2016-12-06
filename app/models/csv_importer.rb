class CsvImporter
  attr_reader :filepath

  def initialize(filepath)
    @filepath = filepath
  end

  def run
    puts "Prepare to import #{filepath} ..."
    # some crunching code
    puts "Import #{filepath} completed"
  end
end
