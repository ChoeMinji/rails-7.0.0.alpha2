# frozen_string_literal: true

module Arel # :nodoc: all
  module Nodes
    class DeleteStatement < Arel::Nodes::Node
      attr_accessor :relation, :wheres, :orders, :limit, :offset, :key

      def initialize(relation = nil, wheres = [])
        super()
        @relation = relation
        @wheres = wheres
        @orders = []
        @limit = nil
        @offset = nil
        @key = nil
      end

      def initialize_copy(other)
        super
        @relation = @relation.clone if @relation
        @wheres = @wheres.clone if @wheres
      end

      def hash
        [self.class, @relation, @wheres, @orders, @limit, @offset, @key].hash
      end

      def eql?(other)
        self.class == other.class &&
          self.relation == other.relation &&
          self.wheres == other.wheres &&
          self.orders == other.orders &&
          self.limit == other.limit &&
          self.offset == other.offset &&
          self.key == other.key
      end
      alias :== :eql?
    end
  end
end
