module Client
  class Domain < Base

    def initialize (attributes = {})
      attributes = attributes
    end
    
    def apply!
      $stderr.puts "Domain information does not need to be applied manually. Client::Domain#apply! method will be deprecated soon."
      true
    end
    
    def records
      Record.find(:all, :domain => self)
    end
    
    def record(id)
      Record.find(id, :domain => self)
    end
    
    def build_record(attributes = {})
      z = Record.new
      z.attributes = attributes if attributes.is_a?(Hash)
      z.domain = self
      z
    end
    
    def requires_update?
      $stderr.puts "Domain updated are applied immediately. Client::Domain#requires_update? will be deprecated soon."
      false
    end
  end
end
