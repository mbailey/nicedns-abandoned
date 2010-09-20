require 'rubygems'
require 'point'

Point.username = "mike@bailey.net.au"
Point.apitoken = "syb7lfgrwisc06gwvodcyuk47if1t5uuitho0bl2"

class Point::Zone

  def self.find_by_name(name)
    # Don't require users to enter the entire.domain.name
    find(:all).detect{ |zone| zone.name =~ /^#{name.gsub('.','\.')}/ }
  end

  def add_record(host_name, data, record_type='A', aux=nil )
    record = build_record
    record.record_type = record_type
    record.name = host_name
    record.data = data
    record.aux = aux if aux
    record.save || record.errors
  end

  def del_records(host_name, record_type='A')
    fqdn = host_name.to_s+'.'+name+'.'
    records.each do |record|
      if host_name == :all or (record.name == fqdn and record.record_type == record_type)
        record.destroy
      end
    end
  end

end


include Point
