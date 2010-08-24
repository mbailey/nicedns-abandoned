module Client
  class Record < Base
    
    class << self
      def collection_path(params = {})
        "domains/#{params[:domain].id}/records"
      end
      
      def member_path(id, params = {})
        "domains/#{params[:domain].id}/records/#{id}"
      end
      
      def class_name
        "record"
      end
    end
    
    def default_params
      {:domain => self.domain}
    end
    
  end
end
