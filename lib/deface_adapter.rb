require 'deface'

class DefaceAdapter
  def initialize(name)
    @name = name
  end
  
  def virtual_path(value)
    @virtual_path = value
  end
  
  def insert_bottom(value)
    @insert_bottom = value
  end
  
  def partial(value)
    @partial = value
  end
  
  def enabled(value)
    @enabled = value
  end
  
  def to_deface_override
    Deface::Override.new(
      :name => @name,
      :virtual_path => @virtual_path,
      :insert_bottom => @insert_bottom,
      :partial => @partial,
      :disabled => !@enabled)
  end
end