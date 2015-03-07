require 'rubocop'

module RuboCop
  module Cop
    module RSpec
      # Tests should not be focused.
      #
      # @example
      #   # bad
      #   fit 'does something' do
      #     expect(foo).to be_empty
      #   end
      #
      #   it 'does something', focus: true do
      #     expect(foo).to be_empty
      #   end
      #
      #   # good
      #   it 'does something' do
      #     expect(foo).to be_empty
      #   end
      class Focused < Cop
        include AST::Sexp

        MESSAGE = 'Remove focused spec'
        FOCUSED_METHODS =
          [:focus, :fexample, :fit, :fspecify, :fcontext, :fdescribe]

        def on_block(node)
          method, _args, _body = *node
          _receiver, method_name, _object, *metadata = *method

          if FOCUSED_METHODS.include?(method_name) || focus_set_to_true?(metadata)
            add_offense(node, :expression, MESSAGE)
          end
        end

        private

        def focus_set_to_true?(metadata)
          return unless metadata

          metadata.include?(s(:sym, :focus)) || (
            metadata.last &&
            metadata.last.children.any? do |pair|
              pair == s(:pair, s(:sym, :focus), s(:true))
            end
          )
        end
      end
    end
  end
end
