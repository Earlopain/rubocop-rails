# frozen_string_literal: true

module RuboCop
  module Cop
    module Rails
      # TODO: Write cop description and example of bad / good code. For every
      # `SupportedStyle` and unique configuration, there needs to be examples.
      # Examples must have valid Ruby syntax. Do not use upticks.
      class TransactionRescue < Base
        MSG = 'Do not use implicit rescue bodies inside of transactions.'

        # @!method transaction_rescue?(node)
        def_node_matcher :transaction_rescue?, <<~PATTERN
          (block
            (send _ :transaction)
            _
            (rescue
              {(...) nil?}
              (resbody (array ...) nil? ...)
            nil?)
          )
        PATTERN

        def on_block(node)
          return unless transaction_rescue?(node)

          add_offense(node)
        end
        alias on_numblock on_block
      end
    end
  end
end
