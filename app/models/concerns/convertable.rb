module Convertable
  extend ActiveSupport::Concern
  class_methods do
    def export_csv(attributes)
      CSV.generate(headers: true) do |csv|
        csv << attributes
        all.each do |item|
          csv << attributes.map{ |attr| item.send(attr) }
        end
      end
    end
  end
end
