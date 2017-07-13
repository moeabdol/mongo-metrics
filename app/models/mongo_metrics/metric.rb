module MongoMetrics
  class Metric
    include Mongoid::Document

    field :name,             type: String
    field :started_at,       type: DateTime
    field :ended_at,         type: DateTime
    field :duration,         type: Integer
    field :instrumenter_id,  type: String
    field :payload,          type: Hash
    field :created_at,       type: DateTime

    def self.store!(args)
      metric = new
      metric.parse(args)
      metric.save!
    end

    def parse(args)
      self.name            =  args[0]
      self.started_at      =  args[1]
      self.ended_at        =  args[2]
      self.duration        =  (args[2] - args[1]) * 1000000
      self.instrumenter_id =  args[3]
      self.payload         =  args[4].except(:headers)
      self.created_at      =  Time.now.utc
    end
  end
end
