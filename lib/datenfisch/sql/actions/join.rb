module Datenfisch
  module Sql
    module Actions
      class Join
        def initialize joined, joinee
          @joined = joined
          @joinee = joinee
        end

        def call
          @joined.source = source_arel
          @joined.selection.merge! @joinee.selection
          @joined.predicates.concat @joinee.predicates
        end

        private

        def source_arel
          Arel::Nodes::JoinSource.new(
            @joined.source, [
              Arel::Nodes::InnerJoin.new(
              @joinee.source, condition_node)
            ]
          )
        end

        def condition_node
          Arel::Nodes::On.new join_condition
        end

        def join_condition
          common_attributes.map do |attr|
            @joined.selection[attr].eq @joinee.selection[attr]
          end.reduce(&:and)
        end

        def common_attributes
          @joined.selection.keys & @joinee.selection.keys
        end
      end
    end
  end
end
