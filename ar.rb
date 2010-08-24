require 'active_resource'

class Domain < ActiveResource::Base
  self.site = 'http://localhost:3000'
 
  def records(scope = :all)
    Record.find(scope, :params => {:domain_id => self.id})
  end
 
  def records(id)
    records(id)
  end
end
 
class Record < ActiveResource::Base
  # :domain_id gets swapped out by ARes based on the :prefix_options hash
  self.site = 'http://localhost:3000/domains/:domain_id'
 
  def domain
    Domain.find(self.prefix_options[:domain_id])
  end
 
  def domain=(domain)
    self.prefix_options[:domain_id] = domain.id
  end
end
