class AttendeeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :pray_before_service, :attend_time, :created_at, :updated_at, :preparation, :lecturing, :missing_by_phone, :missing_by_visit, :osra_preparing_meeting
end
