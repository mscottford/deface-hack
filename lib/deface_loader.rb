require 'polyglot'

$: << File.expand_path('..', __FILE__)
require 'deface_adapter'

class DefaceLoader
  def self.load(filename, options = nil, &block)
    File.open(filename) do |file|
      name = File.basename(filename).gsub('.deface', '')
      adapter = DefaceAdapter.new(name)
      adapter.instance_eval(file.read)
      override = adapter.to_deface_override
      
      # this is purely to illustrate that things got wired up correctly
      puts override.inspect
    end
  end
end

Polyglot.register("deface", DefaceLoader)